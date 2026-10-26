# Setup de un cliente de AssetPlanner para consumir Almacén y Pañol de traz-tools

## Objetivo

Checklist para configurar a mano, una vez por cliente, todo lo que AssetPlanner necesita del lado de traz-tools antes de que ese cliente use el almacén (`traz-comp-almacenes`) y el pañol (`traz-comp-pan`) de tools: empresa vinculada, establecimiento, depósito único, pañol único, catálogo inicial y config por empresa. Lo ejecuta quien haga el onboarding (hoy Rodolfo), completo y en orden — cada paso dice DÓNDE se ejecuta. **No cubre** los cambios de código de asset (fases F3-F5, ver `STATE.md`) ni el alta de la infraestructura WSO2 (ver `traz-tools/doc/infra/`).

---

**Prerrequisitos (verificar antes de arrancar):**

1. **F1 mergeada Y desplegada** en el WSO2 del ambiente: el CAR/artefactos con la sincronización de `ALMDataService` y el lookup `getEmpresaByMysqlId` (traz-tools PR #426). Sin esto, las verificaciones REST de este checklist fallan con 404 o devuelven datos de la empresa 1.
2. **Migración `empr_id_mysql` aplicada** en el PostgreSQL del ambiente: `traz-tools/scripts/sql/2026-08-core-empresas-empr-id-mysql.sql` (idempotente; en DEV ya está verificada).
3. Acceso de red al ambiente (VPN para DEV) y credenciales de las bases.

**Endpoints por ambiente** (usar el que corresponda en TODOS los pasos; los ejemplos de este doc usan DEV):

| Qué | DEV | PROD (completar cuando exista) |
|---|---|---|
| WSO2 EI (DataServices) | `http://10.142.0.13:8280/services` | — |
| PostgreSQL tools | `10.142.0.13:5432`, base `tools_prod_t` | — |
| MariaDB assetv2 | `10.142.0.13:3306`, base `assetv2` | — |
| App tools (pantallas) | según ambiente | — |

**Convenciones de nombres (decisión D3/D7):** el depósito se llama `Depósito <NombreEmpresa>` y el pañol `Pañol <NombreEmpresa>`. El nombre es para humanos; **el runtime usa SIEMPRE los ids** (`depo_id`, `pano_id`) que este checklist deja registrados en el paso 6.

---

## Datos de entrada (completar antes de empezar)

| Dato | Valor |
|---|---|
| Nombre de la empresa | |
| `id_empresa` en assetv2 (MariaDB) | |
| CUIT | |
| Usuarios que van a operar pantallas de tools (nombre + email) | |

---

## Paso 1 — Vincular la empresa (assetv2 ↔ tools)

**Dónde: terminal con `psql` contra el PostgreSQL de tools del ambiente.**

1. Verificar si la empresa ya está vinculada:

   ```sql
   SELECT empr_id, nombre, descripcion, empr_id_mysql FROM core.empresas WHERE empr_id_mysql = <ID_ASSET>;
   ```

   - **Devuelve una fila** → vinculada. Anotar el `empr_id` y saltar al paso 2.
   - **Vacío** → seguir.

2. Verificar si la empresa existe en tools sin vínculo (buscar por nombre/CUIT):

   ```sql
   SELECT empr_id, nombre, cuit, empr_id_mysql FROM core.empresas WHERE eliminado IS NOT TRUE AND (nombre ILIKE '%<parte del nombre>%' OR cuit = '<CUIT>');
   ```

   - **Existe** → vincular: `UPDATE core.empresas SET empr_id_mysql = <ID_ASSET> WHERE empr_id = <EMPR_ID>;`
   - **No existe** → crearla y vincularla en un paso (los demás campos se completan después desde las pantallas de tools si hace falta):

   ```sql
   INSERT INTO core.empresas (nombre, descripcion, cuit, empr_id_mysql) VALUES ('<NombreEmpresa>', '<NombreEmpresa>', '<CUIT>', <ID_ASSET>) RETURNING empr_id;
   ```

3. **Verificación (obligatoria)** — desde una terminal con acceso al WSO2 del ambiente, probar el lookup que va a usar asset en runtime:

   ```bash
   curl -s http://10.142.0.13:8280/services/COREDataService/empresa/porAssetId/<ID_ASSET>
   ```

   Debe devolver `{"empresa":{"empr_id":"<EMPR_ID>","descripcion":"..."}}`. Si devuelve vacío o 404, no seguir: o falta el deploy de F1 o el UPDATE no se aplicó.

> ⚠️ La unicidad importa: un `id_empresa` de asset no puede apuntar a dos empresas de tools. El índice único del prerrequisito 2 lo garantiza — si el UPDATE falla por duplicado, hay una inconsistencia previa que resolver antes de seguir.

**Anotar: `EMPR_ID` = ______**

---

## Paso 2 — Acceso de los usuarios a las pantallas de tools

Los usuarios del cliente van a ver las pantallas de almacén y pañol **en tools**, no en asset (decisión del requerimiento, punto 5). Necesitan poder loguearse en tools.

**Dónde: portal de Dnato del ambiente (alta de usuarios) + portal de Bonita si falta el grupo.**

1. Dar de alta los usuarios del cliente en Dnato, asociados a la empresa `EMPR_ID`.
2. **Verificación**: loguearse en la app de tools con uno de esos usuarios. Debe entrar y ver el menú.
3. Si el login funciona pero el menú sale vacío o fallan las bandejas: falta el grupo de Bonita de la empresa (formato `{empr_id}-{nombre}`, ej. `9000-Termotanques` — ver `traz-tools/doc/v3/deployment-gcp.md` §7.0-quater). Crearlo en el portal de Bonita del ambiente y reintentar.

> Nota: si la empresa se creó por la registración freemium, esto ya existe. El caso manual del paso 1.2 es el que puede requerir crear el grupo a mano.

---

## Paso 3 — Establecimiento

El depósito y el pañol cuelgan de un establecimiento (`prd.establecimientos`), así que va primero.

**Dónde: terminal con `curl` contra el WSO2 del ambiente.**

```bash
curl -s -X POST http://10.142.0.13:8280/services/ALMDataService/establecimientos -H "Content-Type: application/json" -d '{"_postestablecimientos":{"nombre":"<NombreEmpresa>","longitud":"","latitud":"","calles":"","altura":"","localidad":"","pais":"Argentina","usuario":"setup","empr_id":"<EMPR_ID>"}}'
```

**Verificación** (psql): `SELECT esta_id, nombre FROM prd.establecimientos WHERE empr_id = <EMPR_ID>;`

Alternativa por pantalla: app de tools → módulo Producción → Establecimientos (controller `traz-prod-trazasoft/general/Establecimiento.php`).

**Anotar: `ESTA_ID` = ______**

---

## Paso 4 — Depósito único "Depósito \<NombreEmpresa\>"

No hay pantalla ni query de alta de depósito en `ALMDataService` — se crea por SQL.

**Dónde: terminal con `psql` contra el PostgreSQL de tools del ambiente.**

```sql
INSERT INTO alm.alm_depositos (descripcion, nombre, esta_id, empr_id, estado, eliminado) VALUES ('Depósito <NombreEmpresa>', 'Depósito <NombreEmpresa>', <ESTA_ID>, <EMPR_ID>, 'AC', false) RETURNING depo_id;
```

**Verificación** (curl — es la misma consulta que va a usar asset):

```bash
curl -s http://10.142.0.13:8280/services/ALMDataService/mcp/depositos/<EMPR_ID>
```

Debe listar el depósito recién creado con su `depo_id` y el establecimiento.

**Anotar: `DEPO_ID` = ______**

---

## Paso 5 — Pañol único "Pañol \<NombreEmpresa\>"

El pañol no tiene ABM en pantalla — se crea por REST contra `PANDataservice`.

**Dónde: terminal con `curl` contra el WSO2 del ambiente.**

```bash
curl -s -X POST http://10.142.0.13:8280/services/PANDataservice/panol -H "Content-Type: application/json" -d '{"_postpanol":{"descripcion":"Pañol <NombreEmpresa>","usuario_app":"setup","empr_id":"<EMPR_ID>","esta_id":"<ESTA_ID>","nombre":"Pañol <NombreEmpresa>"}}'
```

Devuelve `{"respuesta":{"pano_id":"<PANO_ID>"}}`.

**Verificación**: `curl -s http://10.142.0.13:8280/services/PANDataservice/panol/empresa/<EMPR_ID>`

**Anotar: `PANO_ID` = ______**

---

## Paso 6 — Registrar la config por empresa (la que va a leer asset)

Los tres ids quedan guardados en `core.tablas` (tabla genérica clave-valor de tools, con soporte por empresa — el trigger `set_tabla_id_bui` arma la clave). Es lo que F3 va a leer en runtime en lugar de resolver nada por nombre.

**Dónde: terminal con `curl` contra el WSO2 del ambiente.** Un POST por id:

```bash
curl -s -X POST http://10.142.0.13:8280/services/COREDataService/tablas -H "Content-Type: application/json" -d '{"_posttablas":{"tabla":"ASSET","valor":"DEPO","valor2":"","valor3":"","descripcion":"<DEPO_ID>","empr_id":"<EMPR_ID>"}}'
curl -s -X POST http://10.142.0.13:8280/services/COREDataService/tablas -H "Content-Type: application/json" -d '{"_posttablas":{"tabla":"ASSET","valor":"PANO","valor2":"","valor3":"","descripcion":"<PANO_ID>","empr_id":"<EMPR_ID>"}}'
curl -s -X POST http://10.142.0.13:8280/services/COREDataService/tablas -H "Content-Type: application/json" -d '{"_posttablas":{"tabla":"ASSET","valor":"ESTA","valor2":"","valor3":"","descripcion":"<ESTA_ID>","empr_id":"<EMPR_ID>"}}'
```

**Verificación** — leer la config como la va a leer asset (`getTablaValorXEmp`):

```bash
curl -s http://10.142.0.13:8280/services/COREDataService/tabla/ASSET/valor/DEPO/empresa/<EMPR_ID>
curl -s http://10.142.0.13:8280/services/COREDataService/tabla/ASSET/valor/PANO/empresa/<EMPR_ID>
```

Cada uno debe devolver el id guardado en `descripcion`.

> La clave `ASSET` + `DEPO`/`PANO`/`ESTA` es la convención que asume F3. Si se cambia acá, cambiarla también en el código de F3.
>
> Nota (smoke 2026-08-14): los POST a DataServices necesitan la envoltura `_post<path>` en el body (sin ella el DSS responde `Value type miss match`). El round-trip completo quedó verificado en DEV con la empresa de prueba 1 (fila `1-ASSETDEPO` → depósito 2000, se dejó cargada para las pruebas de F6).

---

## Paso 7 — Catálogo inicial (artículos y herramientas)

Solo si el cliente ya tenía datos de catálogo en asset. Para **Caleras San Juan** (`id_empresa=1` en assetv2): 32 artículos y 2 herramientas (conteo del 2026-08-12).

**7a. Extraer lo que hay en asset — dónde: terminal con `mysql` contra assetv2 del ambiente:**

```sql
SELECT artId, artBarCode, artDescription, artCoste, punto_pedido, unidadmedida FROM articles WHERE id_empresa = <ID_ASSET> AND artEstado != 'AN';
SELECT herrId, herrcodigo, herrmarca, herrdescrip FROM herramientas WHERE id_empresa = <ID_ASSET> AND equip_estad != 'AN';
```

**7b. Cargar artículos — dónde: app de tools con un usuario de la empresa → módulo Almacenes → Artículos** (controller `traz-comp-almacenes/Articulo.php`). Carga manual, uno por uno — además de cargar datos, valida que las pantallas funcionan para esta empresa.

**7c. Cargar herramientas — dónde: app de tools → módulo Pañol → Herramientas** (controller `traz-comp-pan/Herramienta.php`), asignándolas al pañol del paso 5.

> ⚠️ La marca de la herramienta en tools es una referencia a `core.tablas` (no texto libre como en asset, donde además marca y modelo viajan mezclados — ej. `'Escalera 7 peldaño - Ayinco'`). Cargar por pantalla resuelve esto: la pantalla ofrece las marcas existentes y el desdoblamiento marca/modelo se decide a ojo en el momento.

**Verificación** (curl):

```bash
curl -s http://10.142.0.13:8280/services/ALMDataService/articulos/<EMPR_ID>
curl -s http://10.142.0.13:8280/services/PANDataservice/herramientas/empresa/<EMPR_ID>
```

Los conteos deben coincidir con lo extraído en 7a (menos lo que se haya decidido no migrar).

> Las referencias históricas de asset (ej. las 10 filas de `tbl_otherramientas` de Caleras que apuntan a `herrId` viejos) NO se tocan en el setup — su tratamiento se define en F4.

---

## Paso 8 — Verificación final end-to-end

1. **Lookup**: `curl .../COREDataService/empresa/porAssetId/<ID_ASSET>` → devuelve `EMPR_ID`. ✅
2. **Config**: los 3 curls del paso 6 devuelven `DEPO_ID`, `PANO_ID`, `ESTA_ID`. ✅
3. **Catálogo**: los 2 curls del paso 7 listan lo cargado. ✅
4. **Aislamiento** (importante): repetir el curl de artículos con el `EMPR_ID` de OTRA empresa — no debe incluir nada de esta. ✅
5. **Pantallas**: login en tools con un usuario del cliente → ve sus artículos en Almacenes y sus herramientas en Pañol. ✅

## Registro de clientes configurados

Completar una fila por cliente al terminar (este archivo se actualiza por PR, como todo):

| Fecha | Empresa | `ID_ASSET` | `EMPR_ID` | `ESTA_ID` | `DEPO_ID` | `PANO_ID` | Catálogo cargado | Quién |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |
