# STATE.md — Estado vivo del workstream v3 de AssetPlanner

## Objetivo

Tablero de estado del trabajo v3 en ESTE repo (integración con traz-tools: almacén, herramientas, y preparación de la migración del núcleo). Se actualiza al final de CADA tarea como parte del Definition of Done. NO cubre el soporte v2 (`develop`/`master`), ni el estado global del proyecto v3 — ese vive en `traz-tools/doc/v3/STATE.md` y este archivo solo lo complementa.

> **Reglas de actualización** (mismas que el STATE de tools): Claude Code lo actualiza al cerrar cada tarea; se mantiene la estructura de secciones; es un tablero, no una bitácora.

---

**Workstream actual:** Requerimiento "asset consume ALM+PAN de tools" (cliente en el corto plazo) — adelanta la Etapa 5 del plan de migración.
**Última actualización:** 2026-08-14 por Claude Code (F0 mergeada; F1 completada y en PR en traz-tools).

### Fases del plan y su estado

> Regla: **cada fase entra por su propio PR (mínimo uno) contra `develop-v3`**. Una fase no arranca si la anterior que la bloquea no está mergeada.

| Fase | Descripción | Repo donde se ejecuta | Clase | Estado | Rama / PR |
|---|---|---|---|---|---|
| F0 | Metodología y fundaciones: `develop-v3` creada, CLAUDE.md + CONTEXT-PACK + STATE | asset | 🟢 | **Mergeada** (branch protection de `develop-v3` configurada por Rodolfo el 2026-08-14) | PR #322 |
| F1 | Sincronizar `ALMDataService` EI←MI + `getEmpresaByMysqlId` en `COREDataService` (ambas copias) + migración formal de `empr_id_mysql` | **traz-tools** | 🟡 | **Completada, en PR (bloquea F3-F5 hasta el merge).** 84 queries idénticas en ambas copias; fix de aislamiento en las 3 queries de artículos verificado contra Postgres DEV (empresa 87: 7.534 → 4.532 de stock); lookup probado (match y no-match); `scripts/sql/2026-08-core-empresas-empr-id-mysql.sql` idempotente, **aplicación manual pendiente en TEST/PROD**; CAR del MI buildea con los fixes. El hardcode `empr_id = 1` de la copia EI quedó eliminado | traz-tools PR #426 (mergear después del #425) |
| F2 | Checklist de setup por cliente: verificar vínculo `empr_id_mysql`, crear establecimiento + "Depósito \<empresa\>" + "Pañol \<empresa\>" en tools, cargar catálogo del cliente (Caleras: 32 artículos, 2 herramientas), registrar `empr_id`/`depo_id`/`pano_id` en config de asset. Documento autocontenido con DÓNDE se ejecuta cada paso | asset (doc) + manual | 🟢 | Pendiente | — |
| F3 | Asset almacén → tools: inhabilitar menús de almacén en `sismenu`; models de almacén de SQL a REST (`REST.php` → `ALMDataService`); resolución de `empr_id` tools en sesión | asset | 🟡 | Pendiente — requiere F1 | — |
| F4 | Asset herramientas → tools: ídem contra `PANDataservice`; autocompletes de herramientas en planes/OTs consumen REST; definir tratamiento de las 10 referencias históricas de Caleras en `tbl_otherramientas` (remapeo manual o histórico de solo lectura) | asset | 🟡 | Pendiente — requiere F1 | — |
| F5 | Flujo ejecutar-OT: pedido de materiales vía REST contra el mismo Bonita (`Calendario.php:632-646`, `Tarea.php:684`, `view_OtEjecutar_modal.php`); pantallas de visualización de almacén → tools | asset | 🟡 | Pendiente — requiere F3 | — |
| F6 | Prueba integral en DEV + piloto con el cliente del requerimiento | ambos | 🟡 | Pendiente — requiere F2-F5 | — |

### Próxima acción

1. Aprobar y mergear en `traz-tools`: **#425** (landeo del registro REQ-ASSET-ALM que quedó huérfano tras el merge de #424) y después **#426** (F1).
2. Rodolfo: aplicar `scripts/sql/2026-08-core-empresas-empr-id-mysql.sql` a mano en TEST cuando corresponda (DEV ya verificado sin duplicados).
3. Escribir el checklist de F2 (doc, no depende de F1) y arrancar F3 en este repo apenas #426 esté mergeado.

### Decisiones recientes (últimas 5)

| Fecha | Decisión | Referencia |
|---|---|---|
| 2026-08-12 | **Verificación en producción completada (read-only): almacén operativo de asset en CERO absoluto** (pedidos, remitos, órdenes de insumos, lotes, envíos: 0 filas). Catálogos con uso mínimo: el único cliente real con datos es Caleras San Juan (32 artículos, 2 herramientas, 10 refs históricas en `tbl_otherramientas`); el resto es de empresas de prueba. Habilita D2 y D7: reemplazo sin migración masiva, con carga manual del catálogo de Caleras en el setup | CONTEXT-PACK §3, script `verify-asset-herr-alm-usage.sh` (scratchpad de la sesión) |
| 2026-08-12 | **Encontrado el gotcha que bloquea consumir ALM hoy: la copia EI de `ALMDataService.dbs` tiene `getArticulos2` con `WHERE A.empr_id = 1` hardcodeado y sin el fix de aislamiento** del 2026-08-11 (que está solo en la copia MI). La sincronización EI←MI pasa de "mejora pendiente" a prerrequisito (F1) | CONTEXT-PACK §4 |
| 2026-08-12 | **No existe lookup inverso `empr_id_mysql → empr_id`**: la registración freemium escribe el vínculo solo en `core.empresas.empr_id_mysql` (el INSERT en assetv2 no guarda nada de tools). Hay que crear `getEmpresaByMysqlId` en `COREDataService` (F1). La columna además no es única ni está indexada, y sigue sin migración SQL formal | `COREDataService.dbs:379-405` |
| 2026-08-12 | **`develop-v3` creada en este repo desde `develop`** (que está contenida en `master`; master solo suma los 16 merges de tags `v2.9.x`). Todo el trabajo v3 entra por PR contra ella, un PR por fase | D1, CLAUDE.md |
| 2026-08-12 | **Requerimiento aprobado por el PM con 7 respuestas clave**: puente de empresas por lookup REST (no tocar esquema asset), depósito por id resuelto en setup, unificación EI↔MI progresiva, DataServices como bus interno sin validación por usuario para acceso por id, mismo Bonita, inhabilitar (no borrar) menús, y excepción explícita al freeze | CONTEXT-PACK §2 (D1-D10) |

### Bloqueos

- **F1 en PR (traz-tools #426) — F3-F5 siguen bloqueadas hasta su merge.** El hardcode `empr_id=1` ya está corregido en la rama.
- Heredados de tools (informativos): la migración formal de `empr_id_mysql` ya existe como script (F1) pero falta aplicarla en TEST/PROD; credenciales legacy en configs de ambos repos pendientes de rotación (inventariadas en el plan de migración).
