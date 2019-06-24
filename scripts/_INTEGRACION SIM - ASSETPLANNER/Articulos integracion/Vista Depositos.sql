CREATE 
VIEW `abmdeposito`AS 
SELECT
alm_depositos.depo_id,
alm_depositos.descripcion,
alm_depositos.direccion,
alm_depositos.GPS,
alm_depositos.estado_id,
alm_depositos.loca_id,
alm_depositos.esta_id,
alm_depositos.pais_id,
alm_depositos.empr_id,
alm_depositos.fec_alta,
alm_depositos.eliminado
FROM
alm_depositos