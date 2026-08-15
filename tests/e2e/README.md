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

| Archivo | Fase | Qué verifica |
|---|---|---|
| `01-menu.spec.js` | F3/F4 | Que no aparezcan las 15 opciones de almacén y pañol, que el resto del menú de mantenimiento siga intacto, y que no queden enlaces a controllers de almacén en el sidebar |
| `02-catalogos-tools.spec.js` | F3/F4 | Que los endpoints de autocomplete devuelvan el catálogo de **tools** con el shape esperado, incluido el artículo y la herramienta conocidos (con la marca resuelta desde `core.tablas`, que en asset era texto libre) |
| `03-planes-pantalla.spec.js` | F3/F4 | Que las pantallas de Preventivo, OTs y el calendario abran **sin errores de JavaScript**, y que el autocomplete de insumos despliegue sugerencias — cubre la deuda de jQuery que dejó la migración de 2024 |
| `04-pedido-ot.spec.js` | F5 | Que la OT informe sus insumos desde los pedidos de tools y (opcional) que el flujo cree el pedido con Bonita |

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
