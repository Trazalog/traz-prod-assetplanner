# STATE.md — Estado vivo del workstream v3 de AssetPlanner

## Objetivo

Tablero de estado del trabajo v3 en ESTE repo (integración con traz-tools: almacén, herramientas, y preparación de la migración del núcleo). Se actualiza al final de CADA tarea como parte del Definition of Done. NO cubre el soporte v2 (`develop`/`master`), ni el estado global del proyecto v3 — ese vive en `traz-tools/doc/v3/STATE.md` y este archivo solo lo complementa.

> **Reglas de actualización** (mismas que el STATE de tools): Claude Code lo actualiza al cerrar cada tarea; se mantiene la estructura de secciones; es un tablero, no una bitácora.

---

**Workstream actual:** Requerimiento "asset consume ALM+PAN de tools" (cliente en el corto plazo) — adelanta la Etapa 5 del plan de migración.
**Última actualización:** 2026-08-14 por Claude Code (F4: herramientas de asset → REST, en PR).

### Fases del plan y su estado

> Regla: **cada fase entra por su propio PR (mínimo uno) contra `develop-v3`**. Una fase no arranca si la anterior que la bloquea no está mergeada.

| Fase | Descripción | Repo donde se ejecuta | Clase | Estado | Rama / PR |
|---|---|---|---|---|---|
| F0 | Metodología y fundaciones: `develop-v3` creada, CLAUDE.md + CONTEXT-PACK + STATE | asset | 🟢 | **Mergeada** (branch protection de `develop-v3` configurada por Rodolfo el 2026-08-14) | PR #322 |
| F1 | Sincronizar `ALMDataService` EI←MI + `getEmpresaByMysqlId` en `COREDataService` (ambas copias) + migración formal de `empr_id_mysql` | **traz-tools** | 🟡 | **Completada, en PR (bloquea F3-F5 hasta el merge).** 84 queries idénticas en ambas copias; fix de aislamiento en las 3 queries de artículos verificado contra Postgres DEV (empresa 87: 7.534 → 4.532 de stock); lookup probado (match y no-match); `scripts/sql/2026-08-core-empresas-empr-id-mysql.sql` idempotente, **aplicación manual pendiente en TEST/PROD**; CAR del MI buildea con los fixes. El hardcode `empr_id = 1` de la copia EI quedó eliminado | traz-tools PR #426 (mergear después del #425) |
| F2 | Checklist de setup por cliente | asset (doc) + manual | 🟢 | **Completada, en PR.** `doc/v3/setup-cliente-alm-pan.md`: 8 pasos autocontenidos (vínculo de empresa, usuarios Dnato/Bonita, establecimiento, depósito, pañol, config, catálogo, verificación end-to-end), cada uno con DÓNDE se ejecuta, comando y verificación. Decisión técnica tomada: **la config por empresa (`DEPO_ID`/`PANO_ID`/`ESTA_ID`) vive en `core.tablas` de tools** (clave `ASSET`+`DEPO`/`PANO`/`ESTA`, vía `setTabla`/`getTablaValorXEmp` — el trigger `set_tabla_id_bui` arma la clave), NO en el esquema congelado de asset. Contratos verificados contra los `.dbs` y las bases de DEV (columnas reales de `articles`/`herramientas`, trigger de `core.tablas`, seriales). **La ejecución manual del checklist para el primer cliente queda pendiente** (requiere F1 desplegada) | `docs/f2-checklist-setup-cliente` — PR abierto |
| F3 | Asset almacén → tools | asset | 🟡 | **Completada, en PR.** Nuevo `application/helpers/tools_helper.php` (lookup `tools_empr_id()` cacheado en sesión, `tools_config()` con la clave `ASSET`+`DEPO`/`PANO`/`ESTA`, catálogo con cache por request) + constantes `REST_TOOLS_*`. Los 9 puntos del núcleo que leían `articles` pasaron a REST conservando el shape de salida (autocomplete `getinsumo`, `traerinsumo`, y los 7 getters gemelos `getXInsumos` de Preventivos/Predictivos/Backlogs/Otrabajos/Calendarios — el detalle `tbl_*insumos` sigue local, sólo el catálogo va a tools). Menú: `Groups::mnuAll()` ahora honra `sismenu.estado` (antes la columna no se consultaba) + script `database/scripts/f3-inhabilitar-menu-almacen.sql` (11 ítems a `IN`, reversible). Hallazgo del relevamiento: **assetv2 tiene un espejo local de las tablas `alm_*` de tools** (port embebido del módulo de almacenes) con 107 pedidos, todos de empresas de prueba (el último de 2024) — el supuesto D2 se sostiene; ese espejo se abandona en F5. `agregar_insumo` (alta on-the-fly) quedó fuera: ya estaba rota en producción (llama a un model sin cargar) y el alta pasa a pantallas de tools. **Smoke contra DEV ejecutado en verde (2026-08-14, tras el redeploy de los `.dbs`)**: lookup con match y sin match, catálogo por empresa (311/7/13 artículos para empresas 1/87/777, sin cruces), artículo por id, depósitos, y el round-trip de config (POST `_posttablas` → trigger arma `1-ASSETDEPO` → lectura devuelve el valor). Dos correcciones salidas del smoke: (1) el helper pasa a `/articulos/empresa/{empr_id}` — `/articulos/{empr_id}` está DUPLICADO en el DataService y responde el primero; (2) los POST del checklist de F2 necesitan la envoltura `_post<path>` (corregido en el doc). Detectado además un error de la F1: el segundo resource `/articulos/{empr_id}` de la copia EI quedó apuntando a `getArticulos` en vez de `getArticulos2` (fix en PR aparte en traz-tools) | `feat/f3-almacen-rest` — PR abierto |
| F4 | Asset herramientas → tools | asset | 🟡 | **Completada, en PR.** El helper suma el bloque de herramientas (`tools_herramientas`/`_map`/`_merge`/`_autocomplete`/`_full` contra `PANDataservice /herramientas/empresa/{empr_id}`). Los 10 lectores del catálogo `herramientas` del núcleo pasan a REST conservando shape: los 7 getters gemelos `getXHerramientas` (Preventivos/Predictivos/Backlogs/Otrabajos×2/Calendarios×3) + `getherramienta`, `getHerramientasB` y `getProductos` (que de paso corrige su bug `$i=$i++`). Las referencias históricas se muestran con fallback `(herramienta N no disponible en tools)` — resuelve la duda de las 10 filas de Caleras: histórico visible, sin remapeo. Menú Pañol (16/23/24/25/26) → `database/scripts/f4-inhabilitar-menu-panol.sql`. Las escrituras locales (`tbl_*herramientas`, `setHerramInsPorTarea`, `insert_herramienta`) NO se tocan: siguen en MariaDB con el id de tools. ⚠️ **El PAN del EI de DEV está desactualizado** (404 en `/herramientas/empresa/{empr_id}`) — redeployar `PANDataservice.dbs` para el smoke | `feat/f4-herramientas-rest` — PR abierto |
| F5 | Flujo ejecutar-OT: pedido de materiales vía REST contra el mismo Bonita (`Calendario.php:632-646`, `Tarea.php:684`, `view_OtEjecutar_modal.php`); pantallas de visualización de almacén → tools | asset | 🟡 | Pendiente — requiere F3 | — |
| F6 | Prueba integral en DEV + piloto con el cliente del requerimiento | ambos | 🟡 | Pendiente — requiere F2-F5 | — |

### Próxima acción

1. Aprobar y mergear en `traz-tools`: **#425** (landeo del registro REQ-ASSET-ALM que quedó huérfano tras el merge de #424) y después **#426** (F1).
2. Rodolfo: aplicar `scripts/sql/2026-08-core-empresas-empr-id-mysql.sql` a mano en TEST cuando corresponda (DEV ya verificado sin duplicados).
4. Ejecutar el checklist de F2 (`doc/v3/setup-cliente-alm-pan.md`) para el cliente del requerimiento.
5. Aplicar `database/scripts/f3-inhabilitar-menu-almacen.sql` en DEV después de desplegar el código de F3.
6. Arrancar F4 (herramientas → `PANDataservice`): el relevamiento ya identificó sus funciones (`getHerramientasB`, `getProductos`, model `Herramientas.php`, menú Pañol).

### Decisiones recientes (últimas 5)

| Fecha | Decisión | Referencia |
|---|---|---|
| 2026-08-14 | **La config por empresa que asset necesita en runtime (`DEPO_ID`/`PANO_ID`/`ESTA_ID`) se guarda en `core.tablas` de tools, no en asset.** Razones: el esquema de `assetv2` está congelado (D10), `core.tablas` ya soporta valores por empresa (`empr_id` + trigger `set_tabla_id_bui` que arma la clave) y tiene lectura/escritura REST existentes (`getTablaValorXEmp`/`setTabla`). Convención: tabla `ASSET`, valores `DEPO`/`PANO`/`ESTA`, el id viaja en `descripcion`. Decisión técnica menor tomada en F2 — F3 debe leer con esa clave | `doc/v3/setup-cliente-alm-pan.md` paso 6 |
| 2026-08-12 | **Verificación en producción completada (read-only): almacén operativo de asset en CERO absoluto** (pedidos, remitos, órdenes de insumos, lotes, envíos: 0 filas). Catálogos con uso mínimo: el único cliente real con datos es Caleras San Juan (32 artículos, 2 herramientas, 10 refs históricas en `tbl_otherramientas`); el resto es de empresas de prueba. Habilita D2 y D7: reemplazo sin migración masiva, con carga manual del catálogo de Caleras en el setup | CONTEXT-PACK §3, script `verify-asset-herr-alm-usage.sh` (scratchpad de la sesión) |
| 2026-08-12 | **Encontrado el gotcha que bloquea consumir ALM hoy: la copia EI de `ALMDataService.dbs` tiene `getArticulos2` con `WHERE A.empr_id = 1` hardcodeado y sin el fix de aislamiento** del 2026-08-11 (que está solo en la copia MI). La sincronización EI←MI pasa de "mejora pendiente" a prerrequisito (F1) | CONTEXT-PACK §4 |
| 2026-08-12 | **No existe lookup inverso `empr_id_mysql → empr_id`**: la registración freemium escribe el vínculo solo en `core.empresas.empr_id_mysql` (el INSERT en assetv2 no guarda nada de tools). Hay que crear `getEmpresaByMysqlId` en `COREDataService` (F1). La columna además no es única ni está indexada, y sigue sin migración SQL formal | `COREDataService.dbs:379-405` |
| 2026-08-12 | **`develop-v3` creada en este repo desde `develop`** (que está contenida en `master`; master solo suma los 16 merges de tags `v2.9.x`). Todo el trabajo v3 entra por PR contra ella, un PR por fase | D1, CLAUDE.md |

### Bloqueos

- **F1 en PR (traz-tools #426) — F3-F5 siguen bloqueadas hasta su merge.** El hardcode `empr_id=1` ya está corregido en la rama.
- Heredados de tools (informativos): la migración formal de `empr_id_mysql` ya existe como script (F1) pero falta aplicarla en TEST/PROD; credenciales legacy en configs de ambos repos pendientes de rotación (inventariadas en el plan de migración).
