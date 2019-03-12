--Agrego campo adjunto a equipos
ALTER TABLE `planner_assetcloudtest_multiempresa`.`equipos` 
ADD COLUMN `adjunto` VARCHAR(255) NULL AFTER `numero_serie`;
