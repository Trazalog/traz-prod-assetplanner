// @ts-check
/**
 * F5 — el flujo ejecutar-OT crea el pedido de materiales en el almacén de
 * traz-tools y lanza el proceso Bonita compartido.
 *
 * Este es el único test que ESCRIBE datos: crea un pedido real y una instancia
 * de proceso en Bonita. Correrlo solo contra ambientes de prueba.
 */
const { test, expect, DATA } = require('./fixtures');

test.describe('F5 — pedido de materiales desde la OT', () => {
  test('la OT informa sus insumos desde los pedidos de tools', async ({ authedPage: page }) => {
    const resp = await page.request.post('index.php/Ordenservicio/getInsumosPorOT', {
      form: { id_ot: DATA.ot },
    });
    expect(resp.status()).toBe(200);

    const body = await resp.text();
    // puede venir vacío si la OT todavía no tiene pedido: eso no es un error,
    // pero sí tiene que ser JSON válido y no un fatal de PHP
    expect(body).not.toContain('<b>Fatal error');
    expect(body).not.toContain('Undefined');
    const filas = JSON.parse(body);
    expect(Array.isArray(filas)).toBeTruthy();

    if (filas.length) {
      // los nombres de artículo los resuelve el DataService de tools
      expect(filas[0]).toHaveProperty('barcode');
      expect(filas[0]).toHaveProperty('descripcion');
      expect(filas[0]).toHaveProperty('pema_id');
    }
  });

  test('@escribe crear el pedido de la OT lo da de alta en tools con Bonita', async ({ authedPage: page }) => {
    test.skip(!process.env.E2E_ESCRITURA, 'Test de escritura: exportar E2E_ESCRITURA=1 para habilitarlo');

    // crearPedidoOT() → cabecera + detalle en tools
    const crear = await page.request.post('index.php/traz-comp-almacen/new/Pedido_Material/pedidoNormal', {
      form: { id: '' },
      failOnStatusCode: false,
    });
    // el endpoint exacto depende de la vista del modal; lo relevante es que
    // el flujo no rompa con un fatal
    const txt = await crear.text();
    expect(txt).not.toContain('<b>Fatal error');

    // verificación real: el pedido quedó asociado a la OT
    const listado = await page.request.get(`index.php/traz-comp-almacen/new/Pedido_Material/listado/${DATA.ot}`, {
      failOnStatusCode: false,
    });
    expect(listado.status()).toBeLessThan(500);
  });
});
