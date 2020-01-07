--SQL | Agregar Columnas GPS
ALTER TABLE `orden_trabajo` 
ADD COLUMN `latitud` VARCHAR(45) ,
ADD COLUMN `longitud` VARCHAR(45);

-- SQL | Borrar Tablas FRM
DROP TABLE `frm_valores_validos`, `frm_valores`, `frm_tipos_dato`, `frm_instancias_formulario`, `frm_grupos`, `frm_formularios_completados`, `frm_formularios`, `frm_categorias`;

-- SQL | Equipos
ALTER TABLE `historial_lecturas` 
ADD COLUMN `obs` TINYINT NULL AFTER `estado`;