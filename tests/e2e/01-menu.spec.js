// @ts-check
/**
 * F3/F4 — el menú de AssetPlanner ya no ofrece almacén ni pañol propios.
 * Verifica el efecto de los scripts database/scripts/f3-*.sql y f4-*.sql
 * junto con el filtro por `sismenu.estado` que agregó F3 en Groups::mnuAll().
 */
const { test, expect, DATA, textoMenu } = require('./fixtures');

test.describe('F3/F4 — menú sin almacén ni pañol', () => {
  test('no se ofrecen las opciones de almacén ni de pañol', async ({ authedPage: page }) => {
    const menu = await textoMenu(page);
    const presentes = DATA.menuOculto.filter((item) =>
      menu.toLowerCase().includes(item.toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, ''))
    );
    expect(presentes, `Ítems de almacén/pañol todavía visibles: ${presentes.join(', ')}`).toEqual([]);
  });

  test('el resto del menú de mantenimiento sigue intacto', async ({ authedPage: page }) => {
    const menu = await textoMenu(page);
    const faltantes = DATA.menuVisible.filter((item) => !menu.includes(item));
    expect(faltantes, `Ítems que deberían seguir y no están: ${faltantes.join(', ')}`).toEqual([]);
  });

  test('no quedan enlaces rotos a controllers de almacén', async ({ authedPage: page }) => {
    // los ítems se renderizan con onclick="cargarView('Controller', ...)"
    const html = await page.locator('.sidebar-menu, aside').first().innerHTML();
    const prohibidos = ['Ajustestock', 'MovimientoDepoRecep', 'MovimientoDepoSal', 'Deposito', 'Herramienta'];
    const encontrados = prohibidos.filter((c) => html.includes(`'${c}'`) || html.includes(`"${c}"`));
    expect(encontrados, `Enlaces a controllers de almacén/pañol en el menú: ${encontrados.join(', ')}`).toEqual([]);
  });
});
