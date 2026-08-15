-- F4 (REQ-ASSET-ALM): inhabilitar el menú de Pañol de AssetPlanner.
--
-- Las pantallas de pañol/herramientas pasan a verse en traz-tools (traz-comp-pan).
-- Marca estado='IN' — NO borra filas; revertir es volver a 'AC'.
-- Requiere el código de F3 desplegado (Groups::mnuAll() filtra por estado desde esa fase).
--
-- Dónde se ejecuta: manualmente con mysql contra la base assetv2 del ambiente
-- (DEV 10.142.0.13:3306), DESPUÉS de desplegar el código de F3/F4:
--   mysql -h <host> -u <user> -p assetv2 < f4-inhabilitar-menu-panol.sql
--
-- Ítems (ids relevados en DEV el 2026-08-14 — verificar con el SELECT antes de
-- correr en otro ambiente):
--   16 Pañol (grupo)   23 Herramientas   24 Salida Herramientas
--   25 Entrada Herramientas   26 Trazabilidad Componentes

-- Verificación previa:
SELECT id, parent, name, slug, estado FROM sismenu WHERE id IN (16, 23, 24, 25, 26);

UPDATE sismenu SET estado = 'IN' WHERE id IN (16, 23, 24, 25, 26);

-- Verificación posterior (5 filas, todas 'IN'):
SELECT id, name, estado FROM sismenu WHERE id IN (16, 23, 24, 25, 26);

-- Reversa:
-- UPDATE sismenu SET estado = 'AC' WHERE id IN (16, 23, 24, 25, 26);
