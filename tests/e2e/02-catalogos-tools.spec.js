// @ts-check
/**
 * F3/F4 — los catálogos que consume asset vienen de traz-tools, no de sus
 * tablas locales `articles` / `herramientas`.
 *
 * Estos tests golpean los endpoints AJAX que usan las pantallas (los mismos
 * que llaman los autocompletes), que es donde vive el cambio de F3/F4. Si el
 * helper apunta al servicio equivocado o la empresa no está vinculada, fallan
 * acá — que es exactamente el bug que se escapó hasta el smoke de F4.
 */
const { test, expect, DATA } = require('./fixtures');

test.describe('F3 — catálogo de artículos desde tools', () => {
  test('el autocomplete de insumos devuelve artículos del catálogo de tools', async ({ authedPage: page }) => {
    const resp = await page.request.get('index.php/Preventivo/getinsumo');
    expect(resp.status(), 'getinsumo debe responder 200').toBe(200);

    const body = await resp.text();
    expect(body, 'getinsumo devolvió "nada" → el catálogo vino vacío').not.toBe('nada');

    const items = JSON.parse(body);
    expect(Array.isArray(items) && items.length, 'el catálogo no puede venir vacío').toBeTruthy();

    // shape que esperan los autocompletes de asset
    expect(items[0]).toHaveProperty('value');
    expect(items[0]).toHaveProperty('codigo');
    expect(items[0]).toHaveProperty('label');

    // y tiene que estar el artículo conocido de TOOLS
    const esperado = items.find((i) => String(i.value) === DATA.articulo.id);
    expect(esperado, `no vino el artículo ${DATA.articulo.id} del catálogo de tools`).toBeTruthy();
    expect(esperado.codigo).toBe(DATA.articulo.codigo);
    expect(esperado.label).toContain(DATA.articulo.descripcion);
  });

  test('traer un insumo puntual resuelve contra tools', async ({ authedPage: page }) => {
    const resp = await page.request.post('index.php/Preventivo/traerinsumo', {
      form: { id_insumo: DATA.articulo.id },
    });
    expect(resp.status()).toBe(200);
    const body = await resp.text();
    expect(body).toContain(DATA.articulo.codigo);
  });
});

test.describe('F4 — catálogo de herramientas desde el pañol de tools', () => {
  test('el autocomplete de herramientas devuelve el pañol de tools', async ({ authedPage: page }) => {
    const resp = await page.request.get('index.php/Preventivo/getHerramientasB');
    expect(resp.status()).toBe(200);

    const items = JSON.parse(await resp.text());
    expect(Array.isArray(items) && items.length, 'el pañol no puede venir vacío').toBeTruthy();
    expect(items[0]).toHaveProperty('value');
    expect(items[0]).toHaveProperty('label');

    const esperada = items.find((i) => String(i.value) === DATA.herramienta.id);
    expect(esperada, `no vino la herramienta ${DATA.herramienta.id} del pañol de tools`).toBeTruthy();
    expect(esperada.codigo).toBe(DATA.herramienta.codigo);
    // la marca en tools se resuelve desde core.tablas (en asset era texto libre)
    expect(esperada.marca).toBe(DATA.herramienta.marca);
  });

  test('el listado de herramientas responde con el shape viejo', async ({ authedPage: page }) => {
    const resp = await page.request.get('index.php/Preventivo/getherramienta');
    expect(resp.status()).toBe(200);
    const body = await resp.text();
    expect(body).not.toBe('nada');
    const items = JSON.parse(body);
    expect(items[0]).toHaveProperty('herrId');
    expect(items[0]).toHaveProperty('herrcodigo');
    expect(items[0]).toHaveProperty('herrdescrip');
  });
});
