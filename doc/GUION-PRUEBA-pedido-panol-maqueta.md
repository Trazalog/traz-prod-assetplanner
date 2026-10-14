# Guión de prueba — Pedido y pañol en la OT (maqueta)

## Objetivo
Guía para que el Product Manager vea con sus propios ojos, corriendo **localmente**, los agregados de
la maqueta "Pedido y pañol en la OT": F3 texto libre, F4 entregas de almacén, F5 herramientas usadas,
F6 pañolero asocia OT. Indica qué usuarios, equipos, herramientas y artículos usar, y **por qué camino
exacto** se llega a cada pantalla. NO cubre el despliegue a DEV/PROD.

> **Importante (corregido 2026-10-14):** la opción **"Informe de Servicios" NO está en el menú "⋯"**
> de cada fila (está comentada en el código base de develop-v3). El informe completo —con asociar/
> quitar vales— se abre **solo dentro de la tarea Bonita "Confecciona informe"**, que aparece cuando la
> OT se ejecuta. Para ver entregas y herramientas **sin ejecutar nada**, se usa el modal **Ejecutar OT**
> (ver Guión A).

---

## Qué está levantado
Todo corre en esta máquina contra las bases DEV (VPN arriba):

| Componente | URL | Qué es |
|---|---|---|
| **AssetPlanner** | http://127.0.0.1:8080 | Frontend asset (repo real, rama `feat/pedido-panol-ot-maqueta`) |
| **Tools / pañol** | http://127.0.0.1:8081 | Frontend tools para el modal del pañolero (F6) |
| **WSO2 MI** | http://localhost:8290 | DataServices (PAN/ALM/MAN/CORE) |

---

## Usuarios
| Usuario | Pass | Rol | Dónde |
|---|---|---|---|
| `dolores@gmail.com` | `12345` | Admin (ve todo) | Asset :8080 |
| `mantest1` | `123` | Mantenedor (usrId 1) | Asset :8080 |
| `suptest1` | `123` | Supervisor (usrId 2) | Asset :8080 |
| *(pañolero)* | — | dev-login: abrir http://127.0.0.1:8081/Login/dev | Tools :8081 |

Empresa: **Empresa Test** (asset id 1 ↔ tools empr_id 1).

---

## Datos de prueba ya cargados
- **OT 935** (equipo **RNS-00**, Planificada) — la OT rica:
  - Pedido **1486**, artículo **VDE2 230 440469_edit**: Pedido 13 / Entregado 8 / Pendiente 5.
  - Entregas parciales **N°290** (REM-0771) y **N°291** (REM-0779), retiró Rivas Jorge.
  - Herramientas usadas: **0004** (mantenedor) y **HID-12** (pañolero).
- Vales por DNI (buscador): DNI **123** → 6 vales.
- Herramienta **devuelta** (para ver "días de uso" con devolución): código **123456**, vale **74**.
- OT asignada para el pañolero (F6): usrId **2** tiene la OT **365** sin cerrar.

---

## GUIÓN A — Ver entregas y herramientas en el flujo, sin ejecutar nada (~4 min)
En **Asset** (http://127.0.0.1:8080), logueado como `dolores@gmail.com` / `12345`.

1. Menú **Mantenimiento → Órdenes de trabajo**. La tabla arranca vacía: poné **Estado = Planificada**
   y **Filtrar** → aparece la **OT 935**.
2. En la fila de la 935, botón **"⋯" → "Asignar Resp y Tareas"**. Abre el modal **Ejecutar OT**.
   - Pestaña **Pedido Materiales**: ves el pedido y abajo **"Entregas del Pedido"** (N°290 y N°291).
     **(F4)**
   - Pestaña **Herramientas**: la tabla de **herramientas usadas** con **días de uso** (0004 y HID-12).
     **(F5, lectura)**
   - *(Este modal es solo para mirar; no toques "Confirmar"/"Ejecutar" salvo que quieras avanzar la OT.)*
3. En la fila de la 935, **"⋯" → "Ver OT"** → pestaña **Herramientas** → campo **"Herramienta fuera del
   maestro (texto libre)"** → escribí algo → **Agregar texto libre** → se suma una fila. **(F3)**

---

## GUIÓN B — El informe completo, con asociar/quitar vales (el circuito real, ~8 min)
El informe rico (buscar vales por DNI, asociar, quitar, el candado de permisos) vive en la tarea
**"Confecciona informe"**, que aparece **después de ejecutar la OT**. El recorrido real:

4. En la 935, **"⋯" → "Asignar Resp y Tareas"** → asigná un responsable y confirmá (la OT pasa a *en
   curso* y se crea/actualiza el pedido de materiales).
5. Entrá a **Mis Tareas** (bandeja) → tomá la tarea **"Confecciona informe"** de esa OT.
   - Pestaña **Insumos**: Pedido/Entregado/Pendiente + **Entregas del pedido** con **"ver detalle"**
     (lote, depósito, cantidad; **sin precio**).
   - Pestaña **Herramientas**: tabla de usadas + botón **"Asociar vale"** → **DNI 123** → Buscar → 6
     vales → **Asociar**. Mirá el **🔒** en el vale del pañolero (no lo podés quitar) y el **tacho** en
     el del mantenedor.
6. Después: la tarea **"Verificar informe"** (supervisor `suptest1`) y **"Presta conformidad"** cierran
   el ciclo; ahí también se ven los dos bloques.

> Si no querés ejecutar la 935 (para no mover su estado), avisame y preparo una OT aparte para este
> recorrido.

---

## GUIÓN C — El pañolero asocia la OT al entregar (F6, en Tools :8081)
7. Abrí http://127.0.0.1:8081/Login/dev (sesión del pañolero).
8. http://127.0.0.1:8081/traz-comp-pan/Movimientoherramientas → **Nueva Salida**.
   - Bloque **"Asociar a Orden de Trabajo (optativa)"** (modo leído de `configuraciones_panol`).
   - **usrId del mantenedor = 2** → **Buscar OTs** → aparece la **OT 365** → seleccionala → guardá: el
     vale queda asociado en asset con origen **PANOLERO**.

> El frontend de tools servido así se ve **sin estilos** (el layout lo pone el SSO dnato, ausente en
> local). La funcionalidad es la real.

---

## Cómo quedó verificado (e2e automático)
`tests/e2e/07-ciclo-ot-herramientas-entregas.spec.js` — 12/12 en verde: entregas (pedido=entregado+
pendiente; "entregado" = suma real de entregas; sin precio), herramientas usadas (días de uso en las
dos ramas: devuelta y sin devolver; asociar/dedup/quitar; permisos def.8; sin-DNI), estado vacío y
los paneles en cada pantalla del ciclo.

## Cosas a tener en cuenta
- El listado de OT vacío al entrar es normal: hay que filtrar.
- El informe tarda un poco en armar las herramientas usadas (consulta el pañol por cada una).
- Reportá capturas de bugs/estética y las corregimos.
