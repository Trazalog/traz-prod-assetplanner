# CONTEXT-PACK — traz-prod-assetplanner (workstream v3)

> Versión -> 1.0, fecha 2026-08-12
> Escrito contra: `traz-tools/doc/v3/CONTEXT-PACK.md` **v1.4** (último ADR: ADR-013) y `traz-tools/doc/migracion/assetplanner-a-traz-tools-man.md` del **2026-08-12** (PR #424).
> **Chequeo de staleness:** si alguno de esos dos avanzó respecto de lo declarado acá, PARÁ y reportá antes de usar este resumen.

## Objetivo

Resumen operativo del workstream de integración de AssetPlanner con traz-tools v3, para quien ejecute tareas en este repo (Claude Code o un developer). Se lee ANTES de cualquier tarea, junto con `STATE.md`. NO es la fuente de verdad: las decisiones canónicas viven en los documentos de `traz-tools` referenciados abajo. No cubre el flujo de soporte v2 (`develop` → `master`), que sigue operando aparte.

---

## 1. Qué está pasando en este repo

AssetPlanner corre en producción con clientes reales y tiene **dos frentes v3 activos**:

1. **Requerimiento inmediato (cliente en el corto plazo):** asset deja de usar su almacén y sus herramientas propias, y consume los de traz-tools vía REST. Sin migración masiva de datos (validado con conteos en producción, ver §3). Es el contenido de las fases F1–F6 de `STATE.md`.
2. **Migración del núcleo** a `traz-tools-man` (mediano plazo): plan completo en `traz-tools/doc/migracion/assetplanner-a-traz-tools-man.md`. Este requerimiento **adelanta su Etapa 5** y la vacía de migración de datos.

## 2. Decisiones vigentes

| # | Decisión | Fecha | Fuente |
|---|---|---|---|
| D1 | **Branching:** `develop-v3` (creada desde `develop`) es la base de todo el trabajo v3 en este repo, espejando el modelo de traz-tools. Un PR por fase del plan | 2026-08-12 | Rodolfo, sesión de kickoff |
| D2 | **Almacén de asset se reemplaza, no se migra.** Menús inhabilitados (no borrados) en `sismenu`; models de almacén pasan de SQL a REST contra `ALMDataService`. Ningún cliente usa el almacén operativo de asset (validado, §3) | 2026-08-12 | Requerimiento del PM + conteos |
| D3 | **Depósito único por convención:** en el setup de cada cliente se crea a mano establecimiento + depósito "Depósito \<empresa\>" en tools, se resuelve el `depo_id` UNA vez y se guarda en config de asset. El nombre es convención visual; el runtime usa SIEMPRE el id. Sin desplegables de depósito en pantallas de asset | 2026-08-12 | Requerimiento del PM |
| D4 | **Puente de empresas:** el vínculo vive SOLO en PostgreSQL (`core.empresas.empr_id_mysql`, lo escribe la registración freemium). Asset NO guarda referencia a tools. Falta crear la query inversa `getEmpresaByMysqlId` en `COREDataService` (fase F1) y asset la cachea en sesión/config | 2026-08-12 | Verificado en `COREDataService.dbs:379-405` |
| D5 | **DataServices = bus interno entre componentes.** Acceso puntual por id sin validación de usuario final está permitido para asset→tools. MCP sigue SIN usarlos directo (ahí la validación es obligatoria, ADR-009/013 de tools) | 2026-08-12 | Rodolfo |
| D6 | **Mismo Bonita para asset y tools.** Los pedidos de materiales de ambos usan el mismo motor y el mismo proceso. Post-cutover, los pedidos se crean SOLO desde tools; en el interinato asset puede crearlos desde el flujo ejecutar-OT vía REST | 2026-08-12 | Rodolfo |
| D7 | **Herramientas entra al mismo esquema que almacén** (reemplazo por `traz-comp-pan`/`PANDataservice`, "Pañol \<empresa\>" único). El único cliente real con datos es Caleras San Juan: 2 herramientas y 32 artículos → carga manual en el setup, no migración | 2026-08-12 | Conteos en producción (§3) |
| D8 | **Excepción al freeze:** el plan de migración congela features en asset; este requerimiento es LA excepción aprobada. Cualquier otra feature nueva en asset sigue prohibida sin aprobación | 2026-08-12 | Rodolfo |
| D9 | **Unificación WSO2 EI↔MI:** hoy los despliegues de tools salen de `traz-tools/_backend/api` (+`/dataservice`) sobre WSO2 EI 6.5; `ToolsAPIProject` (MI última versión) es solo MCP por ahora. Futuro: solo `ToolsAPIProject`. Funcionalmente DEBEN ser iguales — la sincronización es parte del trabajo, no un aparte | 2026-08-12 | Rodolfo |
| D10 | **Esquema de `assetv2` congelado** mientras asset esté en producción (premisa del plan de migración: la futura convivencia con `traz-tools-man` comparte esta base) | 2026-08-12 | Plan de migración §5.1 |

## 3. Datos duros que sostienen las decisiones (conteos en `assetv2` producción, 2026-08-12)

- **Almacén operativo: 0 filas** en notas de pedido, remitos, órdenes de insumos, lotes y envíos. Supuesto "nadie usa almacenes de asset" **validado**.
- **Catálogos con uso mínimo y concentrado:** `articles` 270 filas y `herramientas` 136, casi todo de empresas de prueba (ids 6/7/8, RuizSoft/RuizTech/RuizTech). Único cliente real con datos: **Caleras San Juan (id 1): 32 artículos, 2 herramientas, 10 filas en `tbl_otherramientas`** (histórico).
- Referencias históricas en `tbl_ot*`/`tbl_preventivo*` de empresas de prueba: se ignoran. Las de Caleras: remapear a mano o aceptar como histórico de solo lectura (definir en F4).

## 4. El gotcha más importante ahora mismo

**La copia EI de `ALMDataService.dbs` (la que HOY despliega tools a producción) está desactualizada y rota:** `getArticulos2` tiene `WHERE A.empr_id = 1` **hardcodeado** y le falta el fix de aislamiento del join a `alm_lotes` (corregido solo en la copia MI el 2026-08-11). **Sincronizar EI←MI es prerrequisito (fase F1)** — si asset consume la copia EI tal cual, todos los clientes verían los artículos de la empresa 1.

## 5. Restricciones duras

- `initialize`/`tools/list`, JWT, MCP: NO aplican a este repo — asset no habla MCP. Asset habla REST plano contra DataServices (D5).
- El `empr_id` de tools y el `id_empresa` de asset son numeraciones DISTINTAS. Nunca asumir que coinciden (el bug de las tools `alm_*` del 2026-08-11 en tools nació de esa confusión).
- `empr_id_mysql` en `core.empresas` no tiene migración SQL formal en ningún repo (bloqueante conocido de tools) y no es único ni indexado — la fase F1 debe contemplarlo.
- Los artefactos WSO2 de `api/` y `_backend/api/` de ESTE repo son copias derivadas; no editarlos acá (CLAUDE.md, Restricción 3).

## 6. Dónde está cada cosa

| Qué | Dónde |
|---|---|
| Estado vivo del workstream | `doc/v3/STATE.md` (este repo) |
| Estado global del proyecto v3 | `traz-tools/doc/v3/STATE.md` |
| Plan de migración completo (etapas, riesgos, pruebas) | `traz-tools/doc/migracion/assetplanner-a-traz-tools-man.md` |
| Arquitectura MCP/identidad | `traz-tools/doc/v3/TRAZALOG_v3_MCP_ARCHITECTURE.md` + `traz-tools/doc/adr/` |
| Artefactos WSO2 fuente de verdad | `traz-tools/_backend/api/` (EI 6.5, despliegue actual) y `traz-tools/_backend/api/ToolsAPIProject` (MI, destino final) |
| DataServices relevantes | `ALMDataService.dbs`, `PANDataservice.dbs`, `COREDataService.dbs` (en ambas copias de tools) |
