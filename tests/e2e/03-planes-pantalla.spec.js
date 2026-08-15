// @ts-check
/**
 * F3/F4 en pantalla — las pantallas de planes y OTs muestran insumos y
 * herramientas resueltos contra tools, y los autocompletes funcionan.
 *
 * Además cubre la deuda de jQuery que dejó la migración de 2024 (jquery-migrate
 * removido): si un autocomplete quedó roto, `.autocomplete()` no está definido
 * y el campo no despliega sugerencias.
 */
const { test, expect, DATA, abrirVista } = require('./fixtures');

test.describe('F3/F4 — pantallas de planes', () => {
  test('el listado de preventivos abre sin errores de JS', async ({ authedPage: page }) => {
    const errores = [];
    page.on('pageerror', (e) => errores.push(e.message));

    await abrirVista(page, 'Preventivo');
    await expect(page.locator('#content')).toContainText(/Preventivo/i);

    // los TypeError de jQuery (.success/.error, autocomplete) aparecen acá
    expect(errores, `Errores de JS al abrir Preventivo: ${errores.join(' | ')}`).toEqual([]);
  });

  test('el autocomplete de insumos despliega sugerencias del catálogo de tools', async ({ authedPage: page }) => {
    await abrirVista(page, 'Preventivo');

    // jQuery UI autocomplete: el widget tiene que estar inicializado
    const inputs = page.locator('input.insumo, input[id*="insumo" i], input[name*="insumo" i]');
    const n = await inputs.count();
    test.skip(n === 0, 'La vista no expone un campo de insumo en este estado');

    const input = inputs.first();
    await input.click();
    await input.fill(DATA.articulo.descripcion.slice(0, 4));

    const sugerencias = page.locator('ul.ui-autocomplete li');
    await expect(sugerencias.first()).toBeVisible({ timeout: 10_000 });
    await expect(page.locator('ul.ui-autocomplete')).toContainText(DATA.articulo.descripcion);
  });

  test('el listado de OTs abre sin errores de JS', async ({ authedPage: page }) => {
    const errores = [];
    page.on('pageerror', (e) => errores.push(e.message));

    await abrirVista(page, 'Otrabajo', 'listOrden');
    expect(errores, `Errores de JS al abrir OTs: ${errores.join(' | ')}`).toEqual([]);
  });

  test('el plan de mantenimiento (calendario) carga', async ({ authedPage: page }) => {
    const errores = [];
    page.on('pageerror', (e) => errores.push(e.message));

    await abrirVista(page, 'calendario', 'indexot');
    // el calendario es la funcionalidad más frágil (FullCalendar 2.2.5 + jQuery)
    expect(errores, `Errores de JS en el calendario: ${errores.join(' | ')}`).toEqual([]);
  });
});
