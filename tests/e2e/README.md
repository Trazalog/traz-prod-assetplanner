# Suite E2E de REQ-ASSET-ALM (fase F6)

## Objetivo

Pruebas automatizadas sobre las pantallas de AssetPlanner que verifican el requerimiento "asset consume el almacén y el pañol de traz-tools": que el menú ya no ofrezca almacén ni pañol propios, que los catálogos vengan de tools, que las pantallas de planes y OTs abran sin errores de JavaScript, y que el flujo ejecutar-OT cree el pedido en tools. Escrito para que lo corra cualquiera con una instancia de asset levantada. **No cubre** las verificaciones de datos/API puras (esas viven en el smoke documentado en `doc/v3/STATE.md`) ni las pantallas de tools.

---

## Requisitos

- Node 18+ y una instancia de AssetPlanner accesible por HTTP (local o de test).
- Un usuario de AssetPlanner de la empresa ya configurada según [`doc/v3/setup-cliente-alm-pan.md`](../../doc/v3/setup-cliente-alm-pan.md).
- El WSO2 del ambiente sirviendo `ALMDataService`, `PANDataService` y `COREDataService`.

## Instalación

**Dónde: terminal, en la raíz del repo de asset.**

```bash
cd tests/e2e
npm init -y
npm i -D @playwright/test
npx playwright install chromium     # o usar el Chrome del sistema (ver abajo)
```

Si no querés descargar el browser de Playwright y ya tenés Chrome instalado:

```bash
export PW_CHANNEL=chrome
```

## Configuración

Variables de entorno (las tres primeras son obligatorias):

| Variable | Qué es | Ejemplo |
|---|---|---|
| `ASSET_URL` | URL base de AssetPlanner, con la barra final | `http://localhost/assetplanner/` |
| `ASSET_USER` | Usuario de asset (tabla `sisusers`) | `admin` |
| `ASSET_PASS` | Su contraseña | |
| `TEST_OT` | OT con insumos declarados | `935` (default) |
| `TEST_ARTI_ID` / `TEST_ARTI_COD` / `TEST_ARTI_DESC` | Artículo conocido del catálogo de tools | `82` / `MP0001` / `Ajo semilla` |
| `TEST_HERR_ID` / `TEST_HERR_COD` / `TEST_HERR_MARCA` | Herramienta conocida del pañol de tools | `17` / `123456` / `Bahco` |
| `E2E_ESCRITURA` | Habilita el único test que crea datos reales | `1` |
| `PW_CHANNEL` | Usar el Chrome del sistema en vez del de Playwright | `chrome` |

Los defaults corresponden a la **empresa de prueba de DEV** (`id_empresa=1` en assetv2 ↔ `empr_id=1` en tools), verificados el 2026-08-15. Para otro ambiente o empresa, pisar los valores.

## Ejecución

**Dónde: terminal, en `tests/e2e/`.**

```bash
export ASSET_URL="http://localhost/assetplanner/"
export ASSET_USER="..." ASSET_PASS="..."

npx playwright test                      # toda la suite (sin los de escritura)
npx playwright test 01-menu.spec.js      # un archivo
npx playwright test --headed             # ver el browser
npx playwright show-report               # reporte HTML del último run
```

Para incluir el test que crea un pedido real + instancia de Bonita:

```bash
E2E_ESCRITURA=1 npx playwright test
```

> ⚠️ Ese test escribe en la base de tools y lanza un proceso en Bonita. Correrlo **solo contra ambientes de prueba**.

## Qué cubre cada archivo

| Archivo | Cubre | Qué verifica | Casos |
|---|---|---|---|
| `01-menu.spec.js` | F3/F4 | Que no aparezcan las 15 opciones de almacén y pañol, que el resto del menú de mantenimiento siga intacto, y que no queden enlaces a controllers de almacén en el sidebar | CP-01 |
| `02-catalogos-tools.spec.js` | F3/F4 | Que los endpoints de autocomplete devuelvan el catálogo de **tools** con el shape esperado, incluido el artículo y la herramienta conocidos (con la marca resuelta desde `core.tablas`) | CP-02, CP-03 |
| `03-planes-pantalla.spec.js` | F3/F4 | Que las pantallas de Preventivo, OTs y el calendario abran **sin errores de JavaScript**, y que el autocomplete de insumos despliegue sugerencias | — |
| `04-pedido-ot.spec.js` | F5 | Que la OT informe sus insumos desde los pedidos de tools y (opcional) que el flujo cree el pedido con Bonita | CP-23, CP-53 |
| `05-informe-consumo.spec.js` | **M1** | Que el informe muestre **pedido / entregado / pendiente** (entregado = cantidad − resto), y que la identidad pedido = entregado + pendiente se cumpla | CP-30, CP-31 |
| `06-herramientas-panol.spec.js` | **M2** | Que las listas de herramientas (planes **e** informe) muestren **solo las disponibles** del pañol asignado, ordenadas por nombre, excluyendo las de `TRANSITO` y las de otros pañoles | CP-50, CP-51, CP-52 |

Los casos `CP-XX` están descritos en [`../../doc/v3/casos-prueba-man.md`](../../doc/v3/casos-prueba-man.md). Los circuitos funcionales que estas pruebas cubren están en [`../../doc/v3/circuitos-man-alm-pan.md`](../../doc/v3/circuitos-man-alm-pan.md).

## Por qué varios tests golpean endpoints AJAX y no solo el DOM

Las vistas de asset se cargan por AJAX dentro de `#content` (`cargarView(controller, action, permission)`), y los autocompletes consumen endpoints JSON. El cambio de F3/F4 vive **en esos endpoints**: si el helper apunta al servicio equivocado o la empresa no está vinculada, el síntoma es una lista vacía y la pantalla se ve "bien". Verificar la respuesta es lo que detecta el fallo — de hecho es la clase de bug que se escapó hasta el smoke de F4 (la constante apuntaba a `PANDataservice` en vez de `PANDataService`).

## Troubleshooting

| Síntoma | Causa probable |
|---|---|
| Timeout en el login | `ASSET_URL` sin barra final, o la app no responde en esa URL |
| `getinsumo` devuelve `"nada"` | La empresa del usuario no está vinculada (`core.empresas.empr_id_mysql`) o falta el setup del cliente |
| El catálogo viene vacío pero el lookup anda | La empresa no tiene artículos cargados en tools — ver paso 7 del checklist de setup |
| Errores de JS en `03-*` | Deuda de jQuery: `.success()/.error()` o autocompletes rotos |
| El test de menú falla | Faltan correr `database/scripts/f3-*.sql` y `f4-*.sql` en ese ambiente |
| `login: waitForURL Timeout` | La app se sirve con `index.php` en la URL (sin `mod_rewrite`). El login necesita URLs limpias — el fixture ya usa `goto('login')`; verificá que Apache tenga el `.htaccess` de rewrite activo |
| Los tests de herramientas vienen vacíos | La constante `REST_TOOLS_PAN` apunta a `PANDataservice` (nombre de archivo) en vez de `PANDataService` (nombre del servicio); el pañol no está configurado (`PANO`); o no hay herramientas `ACTIVO` en ese pañol |

---

## Uso como suite de regresión (para CI/CD y developers)

Esta suite es el **seguro de regresión** de la integración de mantenimiento con almacén y pañol: se corre cada vez que se toca el módulo MAN, ALM o PAN (o los DataServices de tools que consumen) para confirmar que los circuitos siguen funcionando.

### Qué garantiza

Que después de un cambio siguen valiendo: el menú sin almacén/pañol, los catálogos servidos desde tools, el consumo real en el informe (M1), y el filtro de disponibilidad de herramientas (M2). Es exactamente el tipo de regresión que un cambio en un DataService o en el helper `tools_helper.php` puede romper sin que se note en pantalla (una lista vacía "se ve bien").

### Correr solo la regresión (sin los tests de escritura)

```bash
cd tests/e2e
export ASSET_URL="http://<host>/<ruta>/"   # con barra final
export ASSET_USER="..." ASSET_PASS="..."
PW_CHANNEL=chrome npx playwright test --workers=1
```

`--workers=1` es importante: la app usa una sola sesión PHP por usuario y, si se sirve con el servidor embebido de PHP (single-thread), varios workers se pisan.

### Integración con el CI/CD de v3

Encaja en el pipeline de v3 como test **E2E de regresión** ([`TRAZALOG_v3_CICD_STRATEGY.md`](../../../traz-tools/doc/v3/TRAZALOG_v3_CICD_STRATEGY.md) §6). Esbozo de job (GitHub Actions):

```yaml
# .github/workflows/man-regresion.yml (esbozo — el ambiente de test PHP es prerrequisito)
name: man-regresion
on: [workflow_dispatch]          # manual hasta tener staging PHP estable
jobs:
  e2e:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 20 }
      - name: Instalar Playwright
        run: cd tests/e2e && npm ci && npx playwright install --with-deps chromium
      - name: Regresión E2E
        env:
          ASSET_URL:  ${{ secrets.ASSET_TEST_URL }}
          ASSET_USER: ${{ secrets.ASSET_TEST_USER }}
          ASSET_PASS: ${{ secrets.ASSET_TEST_PASS }}
        run: cd tests/e2e && npx playwright test --workers=1
      - uses: actions/upload-artifact@v4
        if: always()
        with: { name: playwright-report, path: tests/e2e/playwright-report }
```

**Prerrequisitos del CI** (mismos que faltan hoy, ver `doc/migracion/...` y `STATE.md`):
1. Un **ambiente de test PHP** estable (Apache/PHP 7.x con `mod_rewrite`) con el repo desplegado y apuntando a una réplica de `assetv2`.
2. El WSO2 de ese ambiente sirviendo `ALMDataService`, `PANDataService`, `COREDataService`.
3. Una empresa de prueba configurada según [`../../doc/v3/setup-cliente-alm-pan.md`](../../doc/v3/setup-cliente-alm-pan.md), con sus secrets cargados en el CI.

Hasta tener eso, el job queda en `workflow_dispatch` (manual) y la regresión se corre a mano contra DEV con la VPN arriba.

### Para compartir con los developers

- La suite es **read-only por defecto** (no crea datos). Un dev la puede correr contra DEV en cualquier momento con las 3 variables de entorno.
- Los tests de **escritura** (crear pedido, vale de salida) están detrás de `E2E_ESCRITURA=1` y solo deben correrse contra ambientes de prueba.
- Al agregar una feature al módulo, **sumar el caso a [`casos-prueba-man.md`](../../doc/v3/casos-prueba-man.md) y su spec acá** es parte del Definition of Done (igual que en v3: cada feature trae su test).
- Los valores de prueba (empresa, artículo, herramienta, OT) son de la empresa de prueba de DEV y se pisan por variables de entorno para otro ambiente — ver la tabla de configuración arriba.
