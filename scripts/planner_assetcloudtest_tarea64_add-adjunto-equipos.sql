--Agrego campo adjunto a equipos
ALTER TABLE `planner_assetcloudtest`.`equipos` 
ADD COLUMN `adjunto` VARCHAR(255) NULL AFTER `numero_serie`;
