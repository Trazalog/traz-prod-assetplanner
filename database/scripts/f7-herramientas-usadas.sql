-- F7 REQ-ASSET-ALM: herramientas usadas en la OT (lista construida desde vales de panol).
-- Excepcion aprobada al freeze del esquema de assetv2 (la lista vive en asset).
-- Idempotente. Reversa al pie.

CREATE TABLE IF NOT EXISTS tbl_otvales (
  valeot_id  INT AUTO_INCREMENT PRIMARY KEY,
  otId       INT NOT NULL,
  sapa_id    INT NOT NULL,                 -- vale de salida en pan.salida_panol (tools)
  origen     VARCHAR(12) NOT NULL,         -- PANOLERO | MANTENEDOR | SUPERVISOR
  usrId      INT NOT NULL,
  fecha      DATETIME NOT NULL,
  id_empresa INT NOT NULL,
  UNIQUE KEY uq_vale (sapa_id, id_empresa),
  KEY idx_ot (otId, id_empresa)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS tbl_otherramientasusadas (
  otherrusada_id INT AUTO_INCREMENT PRIMARY KEY,
  otId       INT NOT NULL,
  herrId     INT NOT NULL,                 -- herr_id de pan.herramientas (tools)
  sapa_id    INT NOT NULL,
  activa     TINYINT(1) NOT NULL DEFAULT 1,
  id_empresa INT NOT NULL,
  UNIQUE KEY uq_herr_vale (otId, herrId, sapa_id, id_empresa),
  KEY idx_ot (otId, id_empresa)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- texto libre en herramientas declaradas de la OT (herrId=0 cuando es libre)
-- (idempotente: solo si no existe la columna)
SET @c := (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='tbl_otherramientas' AND column_name='descripcion_libre');
SET @sql := IF(@c=0, 'ALTER TABLE tbl_otherramientas ADD COLUMN descripcion_libre VARCHAR(255) NULL', 'SELECT 1');
PREPARE st FROM @sql; EXECUTE st; DEALLOCATE PREPARE st;

-- Reversa:
-- DROP TABLE IF EXISTS tbl_otvales;
-- DROP TABLE IF EXISTS tbl_otherramientasusadas;
-- ALTER TABLE tbl_otherramientas DROP COLUMN descripcion_libre;

-- ============================================================================
-- F6 (lado TOOLS - correr en PostgreSQL de tools, NO en assetv2)
-- ----------------------------------------------------------------------------
-- Alta de la lista configuraciones_panol en core.tablas, con el modo de
-- asociacion de OT al entregar herramientas. Modos: OBLIGATORIA | OPTATIVA | NO_APLICA.
-- OJO: hay un trigger en core.tablas que antepone 'empr_id-' a tabl_id y tabla,
-- por eso se insertan SIN el prefijo (el trigger agrega '1-').
-- Reemplazar empr_id=1 por la empresa real del cliente.
--
-- INSERT INTO core.tablas (tabl_id, tabla, valor, valor2, valor3, descripcion, fec_alta, usuario, eliminado, empr_id)
-- VALUES ('configuraciones_panolASOCIAR_OT','configuraciones_panol','ASOCIAR_OT','','','OPTATIVA', now(),'setup', false, 1);
--
-- Lectura del modo (lo usa el modal del panolero):
--   GET /services/COREDataService/tabla/configuraciones_panol/valor/ASOCIAR_OT/empresa/{empr_id}
--   -> {"configuracion":{"valor":"OPTATIVA"}}
-- ============================================================================
