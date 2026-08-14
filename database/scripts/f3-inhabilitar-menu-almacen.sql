-- F3 (REQ-ASSET-ALM): inhabilitar las opciones de menú de almacén en AssetPlanner.
--
-- Qué hace: marca estado='IN' en los ítems de sismenu del almacén propio de asset
-- (viejo y embebido). NO borra filas — revertir es volver a 'AC'.
-- Requiere el código de F3 desplegado: Groups::mnuAll() filtra por estado a partir
-- de esa fase (antes, la columna estado no se consultaba y este script no tendría efecto).
--
-- Dónde se ejecuta: manualmente con mysql contra la base assetv2 del ambiente
-- (DEV 10.142.0.13:3306), DESPUÉS de desplegar el código de F3:
--   mysql -h <host> -u <user> -p assetv2 < f3-inhabilitar-menu-almacen.sql
--
-- Ítems (ids relevados en DEV el 2026-08-14 — verificar con el SELECT de abajo
-- antes de correr en otro ambiente, los ids podrían diferir):
--   59 Almacenes (grupo)            73 Ajuste Stock           76 Recep. Deposito
--   77 Salida Deposito              44 Compras (grupo)        46 Recepción pedidos
--   41 Administrar Ordenes (Envio)  34 ABM Deposito           72 ABM Plantilla Insumos
--   37 ABM Proveedor                61 Rep articulos pedidos
--
-- El grupo Pañol (16) y sus hijos NO se tocan acá: eso es la fase F4.

-- Verificación previa (los nombres deben coincidir con la lista de arriba):
SELECT id, parent, name, slug, estado FROM sismenu
 WHERE id IN (34, 37, 41, 44, 46, 59, 61, 72, 73, 76, 77);

UPDATE sismenu SET estado = 'IN'
 WHERE id IN (34, 37, 41, 44, 46, 59, 61, 72, 73, 76, 77);

-- Verificación posterior (debe devolver 11 filas, todas 'IN'):
SELECT id, name, estado FROM sismenu
 WHERE id IN (34, 37, 41, 44, 46, 59, 61, 72, 73, 76, 77);

-- Reversa (si hace falta volver atrás):
-- UPDATE sismenu SET estado = 'AC' WHERE id IN (34, 37, 41, 44, 46, 59, 61, 72, 73, 76, 77);
