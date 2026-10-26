# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Qué es traz-prod-assetplanner

**AssetPlanner** es la aplicación de mantenimiento industrial de Trazalog: gestión de equipos, órdenes de trabajo, solicitudes de servicio, planes preventivos/predictivos, backlog y KPIs. Corre **en producción** como app standalone (login propio, sin DNato) para clientes reales del sector minero/industrial de San Juan.

Está en curso su **integración con traz-tools v3** en dos frentes:
1. **Corto plazo** (requerimiento activo): asset deja de usar su propio almacén y herramientas, y consume los módulos de traz-tools (`traz-comp-almacenes`/`ALMDataService`, `traz-comp-pan`/`PANDataservice`) vía REST.
2. **Mediano plazo**: migración del núcleo completo como submódulo `traz-tools-man` de traz-tools. El plan vive en `traz-tools/doc/migracion/assetplanner-a-traz-tools-man.md`.

---

## Stack técnico

- **Frontend**: PHP / CodeIgniter 3.1.5 (NO HMVC — controllers/models/views clásicos bajo `application/`)
- **Base de datos**: MariaDB `assetv2` — **esquema CONGELADO** mientras dure la migración a tools (ver Restricciones)
- **Integración**: `application/libraries/REST.php` (cURL wrapper) contra WSO2
- **BPM**: Bonita — **la MISMA instancia que usa traz-tools** (decisión 2026-08-12)
- **Front**: jQuery 2.1.4, jQuery UI, AdminLTE, FullCalendar 2.2.5, DataTables

## Estructura del repo

```
/
├── application/
│   ├── controllers/        — 66 controllers CI3 clásicos
│   ├── models/             — 67 models (SQL directo vía $this->db)
│   ├── views/              — 77 dirs de vistas
│   ├── libraries/          — REST.php, BPM.php, Multi_menu.php, koolreport
│   └── config/             — constants.php, database.php
├── api/                    — Artefactos WSO2 propios (⚠️ derivados de traz-tools, ver Restricciones)
├── _backend/api/           — Ídem
├── database/               — Dumps y scripts históricos (referencia, NO fuente de verdad del esquema)
└── doc/v3/                 — CONTEXT-PACK.md y STATE.md de la integración v3 (este workstream)
```

---

## 🔒 Metodología de Git — OBLIGATORIA

### Modelo de ramas

| Rama | Propósito |
|---|---|
| `master` | Producción — recibe merges de `develop` vía tags `v2.9.x` (flujo v2 existente, NO tocar) |
| `develop` | Soporte v2 en producción — bugfixes de clientes actuales (flujo de Pablo Marrelli) |
| `develop-v3` | **Integración con tools v3** — rama base para TODO el trabajo de integración/migración |
| `<tipo>/<id>-<desc>` | Ramas de trabajo — PR a `develop-v3` (v3) o `develop` (soporte v2) |

### Reglas

1. PROHIBIDO commit o push directo a `master`, `develop` y `develop-v3`. Todo entra por Pull Request.
2. Trabajo v3: `git checkout develop-v3 && git pull`, crear `<tipo>/<fase>-<desc>` (tipos: feat, fix, docs, chore, refactor).
3. **Un PR por fase del plan** (ver `doc/v3/STATE.md`): cada fase F0…F6 tiene al menos su propio PR contra `develop-v3`, nunca una mega-rama con todo.
4. Formato de commit: `tipo(scope): descripción [FASE]` — ej. `feat(alm): models de almacén via REST a ALMDataService [F3]`.
5. NO mergear PRs sin confirmación explícita de Rodolfo.
6. El flujo v2 (`pmarrelli` → `develop` → `master` + tags) sigue intacto y no es asunto de este workstream. No sincronizar `develop` → `develop-v3` a mano sin coordinarlo.
7. Antes de un PR: verificar sintaxis (`php -l` sobre lo tocado), cero marcadores de conflicto, cero secretos nuevos (este repo ya tiene credenciales legacy commiteadas — no agregar más).

### Formato obligatorio de descripción de PR

```markdown
## Qué cambia
[1-2 líneas, en términos funcionales]

## Por qué
[fase del plan / decisión que lo origina]

## Cómo lo verifiqué
[php -l / pruebas manuales / curls contra el DEV, con resultado]
```

---

## 🧭 Metodología de trabajo — antes y después de cada tarea

> Adaptación de la metodología de `traz-tools` (CICD_STRATEGY §5-bis) a este repo. La fuente canónica del proceso es ese documento; esto es el resumen operativo local.

### Antes de empezar CUALQUIER tarea

1. Leé `doc/v3/CONTEXT-PACK.md` completo (resumen operativo local).
2. Leé `doc/v3/STATE.md` para saber en qué fase está el workstream y qué quedó pendiente.
3. **Chequeo de staleness:** el CONTEXT-PACK local declara contra qué versión del CONTEXT-PACK de `traz-tools` y de qué fecha del plan de migración fue escrito. Si `traz-tools/doc/v3/CONTEXT-PACK.md` tiene versión más nueva, o `doc/migracion/assetplanner-a-traz-tools-man.md` cambió después, PARÁ y reportá la desincronización antes de continuar.

### Jerarquía de fuentes

1. **Plan y decisiones de la integración** → `traz-tools/doc/migracion/assetplanner-a-traz-tools-man.md` + la tabla de decisiones del CONTEXT-PACK local.
2. **Arquitectura de identidad y datos** → `traz-tools/doc/v3/TRAZALOG_v3_MCP_ARCHITECTURE.md` + `traz-tools/doc/adr/`.
3. **Proceso** → `traz-tools/doc/v3/TRAZALOG_v3_CICD_STRATEGY.md` §5-bis.

Ante ambigüedad o tema no cubierto: PARÁ. No improvises decisiones de arquitectura — las toma Rodolfo (con workshop previo si es clase 🔴).

### Al terminar CUALQUIER tarea (Definition of Done)

1. Actualizá `doc/v3/STATE.md`: fase/tarea a su estado final, "próxima acción", decisión nueva si la hubo.
2. Si la tarea cambió una decisión de la tabla del CONTEXT-PACK local: actualizalo en el MISMO PR, con bump de versión.
3. Abrí el PR con el formato obligatorio.
4. Si la tarea tocó algo que el plan de migración de `traz-tools` da por cierto (inventarios, supuestos, riesgos): anotá en la descripción del PR que ese doc necesita update, para hacerlo en el repo de tools.

### Reglas de escalamiento

| Tipo de duda | Qué hacés |
|---|---|
| Técnica menor (dos formas válidas de implementar) | Decidís vos, lo documentás en el PR |
| Funcional o de negocio (afecta a clientes en producción, datos, o el modelo comercial) | PARÁS y preguntás a Rodolfo con opciones + recomendación |
| Arquitectura (contradice o no está cubierto por el plan/decisiones) | PARÁS, lo marcás "requiere decisión de arquitectura" |

**Regla de oro: ante la duda de si algo es menor o funcional, preguntá.** Este repo tiene clientes reales en producción.

### Clasificación de riesgo

- Solo docs/scripts sin efecto en runtime → 🟢, ejecutás con tu criterio.
- Código de producción (controllers, models, views, menú, config) → 🟡, ciclo estándar con PR y validación.
- Esquema de BD, identidad/login, credenciales, o algo que huela a arquitectura → 🔴, NO implementes — requiere workshop con Rodolfo.

---

## Restricciones duras de este repo

1. **El esquema de `assetv2` está CONGELADO.** Asset sigue en producción y a futuro compartirá la base con `traz-tools-man`. No se agregan/modifican columnas ni tablas sin decisión 🔴.
2. **Freeze de features.** Solo bugfixes para clientes actuales (por `develop`) y el trabajo de integración v3 (por `develop-v3`, excepción aprobada 2026-08-12). Cualquier otra feature: escalar.
3. **Los artefactos WSO2 de `api/` y `_backend/api/` de ESTE repo son copias derivadas** — la fuente de verdad evoluciona en `traz-tools` (`_backend/api/` para EI 6.5 hoy, `ToolsAPIProject` como destino final). No editarlos acá sin coordinar la unificación.
4. **Menús se inhabilitan, no se borran** (tabla `sismenu`): los cambios de visibilidad son datos reversibles, no DELETEs ni código muerto.
5. **Credenciales legacy en el repo** (`constants.php`, configs): no agregar nuevas; las existentes están inventariadas en el plan de migración para rotación.
6. **No romper el flujo v2.** `develop` y el ciclo de releases `v2.9.x` siguen operando para soporte; el trabajo v3 no debe pisarlo.

## Convenciones de código (para código nuevo o tocado)

- **Logging**: `log_message('DEBUG', '#TRAZA | ASSET | <Clase> | <metodo>() ...')`.
- **Llamadas a tools**: siempre vía `application/libraries/REST.php`; URLs base y `empr_id`/`depo_id`/`pano_id` de tools salen de config, nunca hardcodeados ni resueltos por nombre en runtime.
- **PHP nuevo**: PSR-12. No introducir SQL por concatenación de strings (usar query builder o binding); el legacy existente se corrige al tocarlo.
- **No usar `$_POST` directo**: `$this->input->post()`.
