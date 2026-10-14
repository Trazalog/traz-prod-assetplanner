// @ts-check
/**
 * REQ-ASSET-ALM — Ciclo de vida de la OT con los bloques nuevos:
 *   F4 entrega de materiales (lo pedido vs lo entregado, con detalle, sin precio)
 *   F5 herramientas usadas (días de uso, asociar/quitar/tildar vales, permisos)
 *
 * Cubre MAN-UC-011 (ejecutar+pedir), MAN-UC-012 (informe) y MAN-UC-013
 * (verificar/conformidad). Usa la OT de prueba (935), que ya tiene pedido con
 * entregas parciales y herramientas usadas; y una OT sin datos para el estado vacío.
 *
 * Correr con: ASSET_URL, ASSET_USER, ASSET_PASS, PW_CHANNEL=chrome, E2E_ESCRITURA=1
 */
const fs = require('fs');
const path = require('path');
const { test, expect, DATA } = require('./fixtures');

const OT = DATA.ot;            // 935 (con datos)
const OT_VACIA = process.env.TEST_OT_VACIA || '936'; // sin pedido ni herramientas
const DNI = process.env.TEST_DNI_VALES || '123';     // DNI con varios vales

async function json(page, path, form) {
  const r = await page.request.post('index.php/' + path, { form });
  const t = await r.text();
  expect(t, `${path} devolvió un fatal/warning de PHP`).not.toMatch(/Fatal error|<b>Warning/);
  return JSON.parse(t);
}

test.describe('MAN-UC-011/012/013 — entregas de almacén y herramientas usadas', () => {

  // ---- F4: materiales ----
  test('F4 el pedido separa pedido/entregado/pendiente (coherente)', async ({ authedPage: page }) => {
    const filas = await json(page, 'Ordenservicio/getInsumosPorOT', { id_ot: OT });
    expect(filas.length).toBeGreaterThan(0);
    for (const f of filas) {
      expect(Number(f.pedido)).toBe(Number(f.entregado) + Number(f.pendiente));
    }
  });

  test('F4 las entregas traen detalle (lote/depósito) y NO traen precio (def. 11)', async ({ authedPage: page }) => {
    const r = await page.request.post('index.php/Ordenservicio/getEntregasPorOT', { form: { id_ot: OT } });
    const body = await r.text();
    expect(body.toLowerCase()).not.toContain('precio');
    const pedidos = JSON.parse(body);
    const entregas = pedidos[0].entregas || [];
    expect(entregas.length, 'la OT de prueba tiene entregas parciales').toBeGreaterThan(0);
    const d = entregas[0].detalle[0];
    for (const k of ['descripcion', 'lote_id', 'deposito', 'cantidad']) expect(d).toHaveProperty(k);
    expect(d).not.toHaveProperty('precio');
  });

  // ---- F5: herramientas usadas ----
  test('F5 herramientas usadas con días de uso y origen', async ({ authedPage: page }) => {
    const hs = await json(page, 'Ordenservicio/getHerramientasUsadas', { id_ot: OT });
    expect(hs.length).toBeGreaterThan(0);
    for (const h of hs) {
      expect(['MANTENEDOR', 'SUPERVISOR', 'PANOLERO']).toContain(h.origen);
      expect(Number(h.dias)).toBeGreaterThanOrEqual(0);
    }
  });

  test('@escribe F5 buscar por DNI, asociar (dedup), y quitar (mantenedor)', async ({ authedPage: page }) => {
    const b = await json(page, 'Ordenservicio/buscarVales', { rol: 'MANTENEDOR', dni: DNI, desde: '2024-01-01', hasta: '2026-12-31' });
    expect(b.ok).toBeTruthy();
    expect(b.vales.length).toBeGreaterThan(0);
    const sapa = b.vales.map((v) => String(v.sapa_id)).find((s) => s !== '61' && s !== '78');
    expect(sapa).toBeTruthy();

    const a = await json(page, 'Ordenservicio/asociarVale', { id_ot: OT, sapa_id: sapa, origen: 'MANTENEDOR' });
    expect(a.ok, a.msg).toBeTruthy();
    let hs = await json(page, 'Ordenservicio/getHerramientasUsadas', { id_ot: OT });
    expect(hs.some((h) => String(h.sapa_id) === sapa)).toBeTruthy();

    const dup = await json(page, 'Ordenservicio/asociarVale', { id_ot: OT, sapa_id: sapa, origen: 'MANTENEDOR' });
    expect(dup.ok, 'un vale no se asocia dos veces (def. 5)').toBeFalsy();

    const q = await json(page, 'Ordenservicio/quitarVale', { id_ot: OT, sapa_id: sapa, rol: 'MANTENEDOR' });
    expect(q.ok, q.msg).toBeTruthy();
    hs = await json(page, 'Ordenservicio/getHerramientasUsadas', { id_ot: OT });
    expect(hs.some((h) => String(h.sapa_id) === sapa)).toBeFalsy();
  });

  test('F5 permisos: el mantenedor no quita el vale del pañolero (def. 8)', async ({ authedPage: page }) => {
    const r = await json(page, 'Ordenservicio/quitarVale', { id_ot: OT, sapa_id: '78', rol: 'MANTENEDOR' });
    expect(r.ok).toBeFalsy();
    expect(r.msg).toMatch(/permiso|PANOLERO/i);
  });

  test('F5 sin DNI el mantenedor no puede buscar/asociar (def. 3)', async ({ authedPage: page }) => {
    const r = await json(page, 'Ordenservicio/buscarVales', { rol: 'MANTENEDOR', dni: '', desde: '2024-01-01', hasta: '2026-12-31' });
    expect(r.ok).toBeFalsy();
  });

  // ---- UI: el informe muestra ambos bloques y el asociar refresca la tabla ----
  test('@escribe UI informe: Insumos muestra entregas; Herramientas asocia y refresca', async ({ authedPage: page }) => {
    test.setTimeout(150_000); // login + dash pesado + informe + asociar (getHerramientasUsadas hace N llamadas al MI)
    page.on('dialog', (d) => d.accept());
    await page.goto('dash', { waitUntil: 'commit' });
    await page.locator('.sidebar-menu, aside').first().waitFor({ timeout: 30000 });
    await page.evaluate((ot) => new Promise((r) => window.jQuery('#content').load('index.php/Ordenservicio/cargarOrden/' + ot + '/0/0/0', () => r(null))), OT);
    await page.waitForTimeout(1500);
    await expect(page.locator('#numSolic')).toHaveValue(String(OT));

    // Insumos → entregas
    await page.evaluate(() => window.jQuery('a[href="#insumosPed"]').tab('show'));
    await page.waitForTimeout(600);
    await expect(page.locator(':text("Entregas del Pedido")').first()).toBeVisible();

    // Herramientas → asociar un vale y ver que la tabla crece (getHerramientasUsadas es lento: esperar)
    await page.evaluate(() => window.jQuery('a[href="#herramientas"]').tab('show'));
    await page.waitForTimeout(600);
    await expect(page.locator('#tablaHerrUsadas')).toBeVisible();
    const antes = await page.locator('#tablaHerrUsadas tbody tr').count();
    await page.locator('#btnAbrirBuscarVales').click();
    await page.locator('#valeDni').fill(DNI);
    await page.locator('#valeDesde').fill('2024-01-01');
    await page.locator('#valeHasta').fill('2026-12-31');
    await page.locator('#btnBuscarVales').click();
    await page.waitForTimeout(1200);
    expect(await page.locator('#tablaValesEncontrados tbody tr').count()).toBeGreaterThan(0);
    await page.locator('.btnAsociarVale').first().click();
    await expect.poll(async () => page.locator('#tablaHerrUsadas tbody tr').count(), { timeout: 10000 }).toBeGreaterThan(antes);
    // limpieza
    await page.locator('.btnQuitarVale').last().click();
    await expect.poll(async () => page.locator('#tablaHerrUsadas tbody tr').count(), { timeout: 10000 }).toBe(antes);
  });

  // ---- Estado vacío (def. 14) ----
  test('estado vacío: una OT sin pedido ni herramientas rinde sin fatal', async ({ authedPage: page }) => {
    const ins = await json(page, 'Ordenservicio/getInsumosPorOT', { id_ot: OT_VACIA });
    expect(ins.length).toBe(0);
    const hs = await json(page, 'Ordenservicio/getHerramientasUsadas', { id_ot: OT_VACIA });
    expect(hs.length).toBe(0);
    const r = await page.request.get('index.php/Ordenservicio/cargarOrden/' + OT_VACIA + '/0/0/0');
    expect(await r.text()).not.toMatch(/Fatal error|<b>Warning/);
  });

  // ---- Pantallas del ciclo: el código del panel está presente en cada vista ----
  test('las pantallas del ciclo incluyen los bloques (ejecutar, verificar, conformidad)', async ({ authedPage: page }) => {
    // Ejecutar OT: se puede renderizar por GET
    const ejec = await (await page.request.get('index.php/Calendario/verEjecutarOT/' + OT)).text();
    expect(ejec).not.toMatch(/Fatal error/);
    expect(ejec).toContain('tablaEntregasEjec');
    expect(ejec).toContain('herrEjec');
    // Verificar / conformidad: se renderizan dentro del flujo Bonita; se verifica que
    // el panel esté en la vista (el render vivo requiere la tarea asignada).
    const base = path.resolve(__dirname, '../../application/views/tareas');
    expect(fs.readFileSync(path.join(base, 'view_verifica_informe.php'), 'utf8')).toContain('herrSup');
    expect(fs.readFileSync(path.join(base, 'view_presta_presta_conf_modal.php'), 'utf8')).toContain('tablaHerrUsadasPC');
  });
});
