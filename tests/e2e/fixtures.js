// @ts-check
/**
 * Datos y helpers compartidos de la suite E2E de REQ-ASSET-ALM.
 *
 * Los valores por defecto son los de la empresa de prueba de DEV (id_empresa=1
 * en assetv2 ↔ empr_id=1 en tools), verificados el 2026-08-15. Se pueden pisar
 * por variables de entorno para correr contra otro ambiente o empresa.
 */
const { test: base, expect } = require('@playwright/test');

const DATA = {
  // artículo del catálogo de TOOLS (no existe en la tabla `articles` de asset)
  articulo: {
    id: process.env.TEST_ARTI_ID || '82',
    codigo: process.env.TEST_ARTI_COD || 'MP0001',
    descripcion: process.env.TEST_ARTI_DESC || 'Ajo semilla',
  },
  // herramienta del pañol de TOOLS
  herramienta: {
    id: process.env.TEST_HERR_ID || '17',
    codigo: process.env.TEST_HERR_COD || '123456',
    marca: process.env.TEST_HERR_MARCA || 'Bahco',
  },
  // OT con insumos declarados en tbl_otinsumos
  ot: process.env.TEST_OT || '935',

  // Ítems de menú que DEBEN desaparecer (F3: almacén, F4: pañol)
  menuOculto: [
    'Almacenes', 'Ajuste Stock', 'Recep. Deposito', 'Salida Deposito',
    'Compras', 'Recepci', // "Recepción pedidos" (el acento viaja en latin1)
    'Administrar Ordenes', 'ABM Deposito', 'ABM Plantilla Insumos',
    'ABM Proveedor', 'Rep articulos pedidos',
    'Herramientas', 'Salida Herramientas', 'Entrada Herramientas',
    'Trazabilidad Componentes',
  ],
  // Ítems que deben SEGUIR estando (control: no rompimos el menú)
  menuVisible: ['Mantenimiento', 'Equipos', 'Preventivo', 'Backlog', 'Ordenes de trabajo'],
};

/** Login en AssetPlanner. La app postea por AJAX y redirige a `dash`. */
async function loginAsset(page) {
  const user = process.env.ASSET_USER;
  const pass = process.env.ASSET_PASS;
  if (!user || !pass) throw new Error('Faltan ASSET_USER / ASSET_PASS');

  await page.goto('index.php/login');
  await page.fill('#usrName', user);
  await page.fill('#usrPassword', pass);
  await Promise.all([
    page.waitForURL(/dash/, { timeout: 30_000 }),
    page.click('#login'),
  ]);
  // el menú lateral es la señal de que la sesión quedó armada
  await expect(page.locator('.sidebar-menu, aside')).toBeVisible();
}

/**
 * Navega a una vista del módulo. La app carga las vistas por AJAX dentro de
 * #content vía cargarView(controller, action, permission).
 */
async function abrirVista(page, controller, action = 'index', permission = 'Add-Edit-Del-') {
  await page.evaluate(
    ([c, a, p]) => window.cargarView(c, a, p),
    [controller, action, permission]
  );
  await page.waitForLoadState('networkidle');
}

/** Texto completo del sidebar, normalizado para comparar sin depender del acento. */
async function textoMenu(page) {
  const t = await page.locator('.sidebar-menu, aside').first().innerText();
  return t.normalize('NFD').replace(/[̀-ͯ]/g, '');
}

const test = base.extend({
  // página ya logueada, para no repetir el login en cada test
  authedPage: async ({ page }, use) => {
    await loginAsset(page);
    await use(page);
  },
});

module.exports = { test, expect, DATA, loginAsset, abrirVista, textoMenu };
