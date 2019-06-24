CREATE 
VIEW `abmdeposito`AS 
SELECT
alm_depositos.depo_id AS `depositoId`,
alm_depositos.descripcion AS `depositodescrip`,
alm_depositos.direccion AS `direccion`,
alm_depositos.GPS AS `GPS`,
alm_depositos.loca_id AS `id_localidad`,
alm_depositos.esta_id AS `id_provincial`,
alm_depositos.pais_id AS `id_pais`,
alm_depositos.empr_id AS `id_empresa`,
alm_depositos.fec_alta,
IF(alm_depositos.eliminado = 1, "AN", "AC") AS estado
FROM
alm_depositos





 



 
