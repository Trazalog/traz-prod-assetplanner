CREATE 
VIEW `abmproveedores`AS 
SELECT
alm_proveedores.prov_id AS provid,
alm_proveedores.nombre AS provnombre,
alm_proveedores.cuit AS provcuit,
alm_proveedores.domicilio AS provdomicilio,
alm_proveedores.telefono AS provtelefono,
alm_proveedores.email AS provmail,
alm_proveedores.empr_id AS id_empresa,
alm_proveedores.fec_alta,
IF(alm_proveedores.eliminado = 1, "AN", "AC") AS estado
 
FROM
alm_proveedores