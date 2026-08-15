# Casos de prueba funcionales — Mantenimiento ↔ Almacén ↔ Pañol

## Objetivo

Catálogo de casos de prueba que cubren la casuística funcional del módulo de mantenimiento en su relación con Almacén (ALM) y Pañol (PAN), incluyendo las mejoras M1 (consumo real en el informe) y M2 (herramientas disponibles del pañol + vale de salida). Sirve de referencia para las pruebas de regresión automatizadas (`tests/e2e/`) y para el testing manual de QC. Para cada caso indica precondición, pasos, resultado esperado y si está automatizado. **No cubre** el detalle de los circuitos (eso está en [`circuitos-man-alm-pan.md`](circuitos-man-alm-pan.md)) ni la instalación del entorno de pruebas (ver [`../../tests/e2e/README.md`](../../tests/e2e/README.md)).

> Los casos se numeran `CP-XX`. La columna **Auto** indica: ✅ automatizado en `tests/e2e/`, 🟡 automatizable pero requiere escritura (opt-in), ⬜ verificación manual de QC.

---

## 1. Datos de referencia (empresa de prueba)

| Dato | Valor (DEV, empresa de prueba) |
|---|---|
| Empresa | `id_empresa=1` (assetv2) ↔ `empr_id=1` (tools) |
| Depósito asignado (`DEPO`) | 2000 |
| Pañol asignado (`PANO`) | 10 |
| Artículo de tools conocido | `arti_id=82`, código `MP0001`, "Ajo semilla…" |
| Herramienta disponible conocida | `herr_id=17`, código `123456`, marca Bahco, pañol 10, estado ACTIVO |
| Estados de herramienta en pañol | `ACTIVO` = disponible · `TRANSITO` = fuera del pañol |
| Estados del pedido de materiales | Creada → Solicitado → Aprobado/Rechazado → Entregado/Ent. Parcial |

---

## 2. Casos de prueba

### Grupo A — Menú y catálogos (base de la migración)

| # | Caso | Precondición | Pasos | Resultado esperado | Auto |
|---|---|---|---|---|---|
| CP-01 | El menú no ofrece almacén ni pañol | Scripts `f3`/`f4` aplicados; usuario con permisos | Abrir el sistema y expandir el menú | No aparecen las 15 opciones de almacén/pañol; sí aparecen Mantenimiento/ABM/Reportes | ✅ |
| CP-02 | Catálogo de artículos desde tools | Empresa vinculada y con catálogo | Llamar `Preventivo/getinsumo` | Devuelve artículos de tools (incluye `MP0001`), shape `value/codigo/label` | ✅ |
| CP-03 | Catálogo de herramientas desde el pañol | Empresa con pañol y herramientas | Llamar `Preventivo/getHerramientasB` | Devuelve herramientas del pañol con marca resuelta | ✅ |

### Grupo B — Circuito de generación de OT (backlog / plan)

| # | Caso | Precondición | Pasos | Resultado esperado | Auto |
|---|---|---|---|---|---|
| CP-10 | Declarar insumos/herramientas en un backlog | — | Crear backlog, agregar insumo (art. de tools) y herramienta (del pañol) | Se guardan en `tbl_backloginsumos`/`tbl_backlogherramientas`; los autocompletes ofrecen catálogo de tools | 🟡 |
| CP-11 | Generar OT desde el backlog copia insumos/herramientas | Backlog con insumos y herramientas | Programar la OT desde el calendario (tipo=4) | Se crea `orden_trabajo`; se copian a `tbl_otinsumos` y `tbl_otherramientas`; **no** se crea pedido todavía | 🟡 |
| CP-12 | Generar OT desde un preventivo es igual que backlog | Preventivo con insumos/herramientas vencido | Programar la OT (tipo=3) | Mismo comportamiento que CP-11, pero copiando de `tbl_preventivo*` | 🟡 |
| CP-13 | Serie de preventivos genera N OTs sin N pedidos | Preventivo repetitivo | Programar en serie (`event_tipo=2`) | Se crean N OTs con sus `tbl_ot*`; **0 pedidos** en la generación | 🟡 |

### Grupo C — Pedido de materiales (ALM transaccional)

| # | Caso | Precondición | Pasos | Resultado esperado | Auto |
|---|---|---|---|---|---|
| CP-20 | El pedido nace al abrir "Ejecutar OT", no antes | OT con insumos declarados | Abrir el modal de ejecución de la OT | Se crea el pedido en tools (estado `Creada`) leyendo `tbl_otinsumos` | 🟡 |
| CP-21 | OT sin insumos no genera pedido | OT sin `tbl_otinsumos` | Abrir el modal de ejecución | No se crea pedido; el flujo no rompe | 🟡 |
| CP-22 | Ejecutar la OT lanza Bonita y deja el pedido Solicitado | Pedido `Creada` | Ejecutar la OT | El pedido pasa a `Solicitado` con `case_id` de Bonita | 🟡 |
| CP-23 | Aislamiento: el pedido de empresa A no es visible para B | Dos empresas con pedidos | Consultar `pedidos/orden/{ot}/{empr}` con empr distinto | No devuelve pedidos de otra empresa | ✅ |

### Grupo D — Informe de servicio y consumo real (M1)

| # | Caso | Precondición | Pasos | Resultado esperado | Auto |
|---|---|---|---|---|---|
| CP-30 | El endpoint de insumos devuelve pedido/entregado/pendiente | OT con pedido | Llamar `Ordenservicio/getInsumosPorOT` | Cada fila trae `pedido`, `entregado` (= cantidad − resto), `pendiente` | ✅ |
| CP-31 | Las 3 vistas del informe muestran las columnas de consumo | Informe con insumos | Abrir crear / revisar / conformidad | Cada tabla de insumos muestra columnas **Pedido / Entregado / Pendiente** | ✅ |
| CP-32 | Un pedido entregado muestra entregado > 0 | Pedido `Entregado` (resto < cantidad) | Ver el informe | Entregado = cantidad − resto (p.ej. 15/0 → entregado 15) | ✅ |
| CP-33 | Un pedido sin entregar muestra entregado 0 y pendiente = pedido | Pedido `Creada`/`Solicitado` | Ver el informe | Entregado 0, pendiente = cantidad | ✅ |

### Grupo E — Aprobación y entrega (ALM)

| # | Caso | Precondición | Pasos | Resultado esperado | Auto |
|---|---|---|---|---|---|
| CP-40 | Aprobar un pedido cambia su estado | Pedido `Solicitado` | Tarea Bonita "Aprueba pedido…" con OK | Estado `Aprobado` | ⬜ |
| CP-41 | Entregar descuenta stock y actualiza el resto | Pedido `Aprobado` | Tarea Bonita "Entrega pedido pendiente" | `alm_lotes` descuenta la cantidad; `resto` se actualiza; estado `Entregado`/`Ent. Parcial` | ⬜ |
| CP-42 | La pantalla de entrega muestra pedido/entregado/disponible | Pedido en entrega | Abrir la vista de entrega | Se ven las tres cantidades | ⬜ |

### Grupo F — Herramientas: disponibilidad y vale (M2)

| # | Caso | Precondición | Pasos | Resultado esperado | Auto |
|---|---|---|---|---|---|
| CP-50 | Las listas de herramientas solo muestran disponibles del pañol | Pañol con herramientas ACTIVO y TRANSITO | Llamar el catálogo de herramientas (informe y planes) | Solo aparecen las `ACTIVO` del pañol asignado (`PANO`); las `TRANSITO` y las de otros pañoles no | ✅ |
| CP-51 | Las herramientas se ofrecen ordenadas por nombre | Varias herramientas disponibles | Ver la lista | Orden alfabético por descripción | ✅ |
| CP-52 | El catálogo del informe usa el pañol de tools | — | Llamar `ordenservicio/getHerramienta` | Devuelve herramientas del pañol con shape `label/value/codherram/herrId` | ✅ |
| CP-53 | Guardar el informe crea el vale de salida | Informe con herramientas | Guardar el informe | Se crea la salida en `PANDataservice` (cabecera + detalle por herramienta) | 🟡 |
| CP-54 | Al usar una herramienta pasa a TRANSITO | Herramienta ACTIVO usada en informe | Guardar el informe | La herramienta queda `TRANSITO` y deja de ofrecerse en las listas | 🟡 |
| CP-55 | El vale no rompe el informe si el pañol de tools falla | Pañol de tools inaccesible | Guardar el informe | El informe se guarda igual; se loguea el error del vale | 🟡 |

### Grupo G — Casos negativos y de borde

| # | Caso | Precondición | Pasos | Resultado esperado | Auto |
|---|---|---|---|---|---|
| CP-60 | Empresa sin vínculo en tools | Usuario de empresa sin `empr_id_mysql` | Abrir cualquier lista de catálogo | Lista vacía + log de error de configuración (no fatal) | 🟡 |
| CP-61 | Empresa sin config de pañol (`PANO`) | Setup incompleto | Listar herramientas | Filtra solo por estado (no rompe); log si falta config | 🟡 |
| CP-62 | Herramienta histórica que ya no está en el pañol | Referencia a `herrId` inexistente | Ver herramientas de una OT vieja | Se muestra "(herramienta N no disponible en tools)", no se oculta | 🟡 |
| CP-63 | Artículo histórico que ya no está en el catálogo | Insumo con `artId` inexistente | Ver insumos de una OT vieja | Se muestra el fallback, no rompe | 🟡 |

---

## 3. Trazabilidad casos ↔ circuitos ↔ tests

| Grupo | Circuito (doc) | Spec de regresión |
|---|---|---|
| A — Menú/catálogos | §2, §3.1 | `01-menu`, `02-catalogos-tools` |
| B — Generación OT | Circuitos 1, 2, 6 | `03-planes-pantalla` |
| C — Pedido materiales | Circuito 6 | `04-pedido-ot` |
| D — Informe consumo (M1) | §7.1 | `05-informe-consumo` |
| E — Aprobación/entrega | Circuito 5 | (manual QC) |
| F — Herramientas (M2) | §7.2 | `06-herramientas-panol` |
| G — Negativos | transversal | repartidos |

Los casos ⬜ (aprobación/entrega vía Bonita) quedan como testing manual de QC porque dependen de la bandeja de Bonita y del avance del proceso, que no es determinístico para un test automatizado. Los 🟡 (escritura) están automatizados pero desactivados por defecto (se activan con `E2E_ESCRITURA=1`) porque crean datos reales.
