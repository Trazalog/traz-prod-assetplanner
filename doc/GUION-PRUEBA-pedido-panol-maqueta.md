# Guión de prueba — Pedido y pañol en la OT (maqueta)

## Objetivo
Guía para que el Product Manager pruebe con sus propios ojos los agregados de la maqueta
**"Pedido y pañol en la OT"** (F3 texto libre, F4 entregas, F5 herramientas usadas, F6 pañolero
asocia OT) corriendo **localmente**. Indica qué usuarios, equipos, herramientas y artículos usar.
NO cubre el despliegue a DEV/PROD ni la tarea Bonita de ejecución real (se usan atajos locales).

---

## Qué está levantado (verificado)
Todo corre en esta máquina contra las **bases DEV** (vía VPN, que ya está arriba):

| Componente | URL | Qué es |
|---|---|---|
| **AssetPlanner** | http://127.0.0.1:8080 | Frontend asset (repo real `traz-prod-assetplanner`, rama `feat/pedido-panol-ot-maqueta`) |
| **Tools (pañol)** | http://127.0.0.1:8081 | Frontend tools para el modal del pañolero (F6) |
| **WSO2 MI** | http://localhost:8290 | DataServices (PAN/ALM/MAN/CORE) → Postgres/MySQL DEV |

> Si alguno no responde, avisá y lo vuelvo a levantar (son procesos locales de la sesión).

---

## Usuarios
| Usuario | Pass | Rol | Dónde |
|---|---|---|---|
| `dolores@gmail.com` | `12345` | Admin (ve todo) | Asset :8080 |
| `mantest1` | `123` | Mantenedor (usrId 1) | Asset :8080 |
| `suptest1` | `123` | Supervisor (usrId 2) | Asset :8080 |
| *(pañolero)* | — | Se entra con **dev-login**: abrir http://127.0.0.1:8081/Login/dev | Tools :8081 |

Empresa de prueba: **Empresa Test** (asset id 1 ↔ tools empr_id 1).

---

## Datos de prueba ya cargados
- **OT 935** (equipo **RNS-00**, estado Planificada) — es la OT rica: tiene pedido, entregas y herramientas usadas.
  - Pedido **1486**, artículo **VDE2 230 440469_edit** (barcode 7897046705111): Pedido 13 / Entregado 8 / Pendiente 5.
  - Entregas parciales **N°290** (REM-0771) y **N°291** (REM-0779), retiró Rivas Jorge (DNI 28455312).
  - Herramientas usadas: **0004** (herramientita, mantenedor) y **HID-12** (Hidrolavadora, pañolero).
- **Vales de pañol por DNI** (para el buscador): DNI **123** → 6 vales; DNI **222** → 3 vales.
- **Herramientas de pañol**: `0004`, `123456`, `HID-12`, `co-00001`.
- **OT asignada para el pañolero (F6)**: usrId **2** tiene la OT **365** sin cerrar.

---

## GUIÓN A — Ver los agregados sobre la OT 935 (camino rápido, ~5 min)
Todo en la **consola web de Asset** (http://127.0.0.1:8080), logueado como `dolores@gmail.com` / `12345`.

1. **Entrar al listado de OT**: menú lateral **Mantenimiento → Órdenes de trabajo**.
   - La tabla arranca **vacía a propósito**: poné **Estado = Planificada** y tocá **Filtrar**. Aparece la OT **935** (y 934-942).
2. **Abrir el informe**: en la fila de la **935**, botón **"⋯" → "Informe de Servicios"**.
   - **(F4)** Pestaña **Insumos**: ves **Insumos Usados** (Pedido 13 / Entregado 8 / Pendiente 5) y abajo **Entregas del Pedido** (290 y 291). Tocá **"ver detalle"** en una entrega → modal con lote/depósito/cantidad (el **precio no se muestra**, a propósito).
   - **(F5)** Pestaña **Herramientas**: tabla **Herramientas Usadas** con **días de uso** (0004 = ~51 días, HID-12 = ~14). Fijate el **🔒** en la fila del pañolero (HID-12): el mantenedor no la puede quitar; y el **tacho** en la del mantenedor (0004), que sí.
     - Tocá **"Asociar vale"** → poné **DNI = 123**, rango de fechas amplio, **Buscar** → aparecen 6 vales con botón **Asociar**. Asociá uno y mirá cómo se agrega a la tabla de usadas.
3. **(F3) Texto libre**: volvé al listado, en la 935 **"⋯" → "Ver OT"** → pestaña **Herramientas** → campo **"Herramienta fuera del maestro (texto libre)"** → escribí algo (ej. *"Zuncho de izaje 3 t (prestado)"*) → **Agregar texto libre** → se suma una fila marcada como texto libre.

---

## GUIÓN B — Vista del supervisor y de conformidad (~3 min)
Mismo listado, misma OT 935. (El supervisor real sería `suptest1`/`123`; para ver las pantallas alcanza con dolores.)

4. **Verificar informe (supervisor)**: abrí la 935 por la tarea de verificación (o el informe) → pestañas nuevas **Insumos** y **Herramientas**. Acá el buscador de vales es **sin DNI** (ve todos del período) y el supervisor **sí puede quitar el vale del pañolero** (no el del mantenedor).
5. **Presta conformidad / Ver informe**: en el acordeón, los paneles nuevos **"Insumos y Entregas"** y **"Herramientas Usadas"** (solo lectura, con días de uso).
6. **Ejecutar OT**: en la 935 **"⋯"** → dentro del modal, pestaña **Pedido Materiales** (entregas) y pestaña nueva **Herramientas**.

---

## GUIÓN C — El pañolero asocia la OT al entregar (F6, en Tools :8081)
7. **Entrar como pañolero**: abrí http://127.0.0.1:8081/Login/dev (forja la sesión del pañolero).
8. **Abrir el pañol**: http://127.0.0.1:8081/traz-comp-pan/Movimientoherramientas → botón **Nueva Salida**.
   - En el modal, abajo de la lista de herramientas, aparece el bloque **"Asociar a Orden de Trabajo (optativa)"** — el modo *optativa/obligatoria/no_aplica* se lee de la config `configuraciones_panol`.
   - Poné **usrId del mantenedor = 2** → **Buscar OTs** → aparece la **OT 365**. Seleccionala.
   - Completá la salida y guardá: el vale queda asociado a la OT en asset con **origen PANOLERO** (lo ves después en el informe de esa OT, pestaña Herramientas).

> Nota: el frontend de tools servido así se ve **sin los estilos del layout** (el wrapper lo pone el SSO dnato, que localmente no está). La funcionalidad es la real; lo estético no representa producción.

---

## Cosas a tener en cuenta al mirar
- **El listado de OT vacío al entrar es normal** — hay que filtrar. (No es un bug.)
- El **fix del menú "Informe de Servicios"** (que pasaba mal el id de la OT) está aplicado **solo en el serve local, sin commitear** — pendiente tu OK para llevarlo al repo (es `list.php`, módulo compartido).
- Los **días de uso** cambian con el tiempo real (la devolución se deduce por trazabilidad).
- Reportá capturas de bugs/estética y las vamos corrigiendo.
