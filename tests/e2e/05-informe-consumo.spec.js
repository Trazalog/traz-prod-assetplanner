// @ts-check
/**
 * M1 — El informe de servicio muestra el consumo real: pedido / entregado /
 * pendiente (entregado = cantidad - resto). Cubre CP-30 a CP-33.
 *
 * El origen del dato es `Ordenservicio/getInsumosPorOT`, que enriquece cada
 * fila del pedido de tools con esos tres valores. Las vistas del informe
 * pintan las columnas correspondientes.
 */
const { test, expect, DATA, abrirVista } = require('./fixtures');

test.describe('M1 — consumo real en el informe', () => {
  test('CP-30: getInsumosPorOT devuelve pedido / entregado / pendiente', async ({ authedPage: page }) => {
    const resp = await page.request.post('index.php/Ordenservicio/getInsumosPorOT', {
      form: { id_ot: DATA.ot },
    });
    expect(resp.status()).toBe(200);

    const body = await resp.text();
    expect(body, 'no debe ser un fatal de PHP').not.toContain('<b>Fatal error');
    const filas = JSON.parse(body);
    expect(Array.isArray(filas)).toBeTruthy();

    // si la OT tiene pedido, cada fila trae los tres campos y el cálculo cierra
    if (filas.length) {
      const f = filas[0];
      expect(f, 'falta la columna pedido').toHaveProperty('pedido');
      expect(f, 'falta la columna entregado').toHaveProperty('entregado');
      expect(f, 'falta la columna pendiente').toHaveProperty('pendiente');

      // CP-32/CP-33: la identidad pedido = entregado + pendiente siempre se cumple
      const pedido = Number(f.pedido);
      const entregado = Number(f.entregado);
      const pendiente = Number(f.pendiente);
      expect(entregado + pendiente, 'entregado + pendiente debe igualar lo pedido')
        .toBeCloseTo(pedido, 5);
      expect(entregado, 'entregado no puede ser negativo').toBeGreaterThanOrEqual(0);
      expect(pendiente, 'pendiente no puede ser negativo').toBeGreaterThanOrEqual(0);
    }
  });

  test('CP-31: la vista de conformidad del informe muestra las columnas de consumo', async ({ authedPage: page }) => {
    // la vista de conformidad se renderiza server-side; verificamos las columnas
    // abriendo el informe de una OT. Si la OT no tiene informe, el test se salta.
    const errores = [];
    page.on('pageerror', (e) => errores.push(e.message));

    // el endpoint que arma la vista de conformidad
    const resp = await page.request.post('index.php/Ordenservicio/verInforme', {
      form: { id_ot: DATA.ot },
      failOnStatusCode: false,
    });
    const html = await resp.text();

    // Si hay informe, la tabla de insumos debe traer las cabeceras nuevas.
    // Si no hay informe para esa OT, no aplica (no es un fallo).
    test.skip(!/Orden de Insumos|modInsum/.test(html), 'La OT no tiene informe de conformidad');
    expect(html).toContain('Pedido');
    expect(html).toContain('Entregado');
    expect(html).toContain('Pendiente');
  });
});
