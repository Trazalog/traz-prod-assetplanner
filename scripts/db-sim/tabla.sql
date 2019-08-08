CREATE TABLE `planner_assetcloud_integracion`.`sim_form_evaluacion_desempeño` (
  `fode_id` INT NOT NULL AUTO_INCREMENT,
  `operario` VARCHAR(45) NULL,
  `cliente` VARCHAR(45) NULL,
  `fecha_hora` DATETIME NULL,
  `fec_alta` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`fode_id`));


INSERT INTO `planner_assetcloud_integracion`.`frm_formularios` (`form_id`, `nombre`, `habilitado`, `id_empresa`) VALUES ('9000', 'Evaluacion Desempeño', '1', '9');


INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `GRUP_ID`, `ORDEN`) VALUES ('9001', 'Rejas y portones', '9001', '1');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `GRUP_ID`, `ORDEN`) VALUES ('9002', 'Veredas', '9001', '2');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `GRUP_ID`, `ORDEN`) VALUES ('9003', 'Cartelería, luminarias, paredes y cornisas', '9001', '3');


INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9007', 'Telas de araña', '2', '9001', '7');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9008', 'Observaciones', '4', '9001', '8');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9009', 'Cerramientos, herrajes, paredes, vidrios y espejos', '2', '9001', '9');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9010', 'Observaciones', '4', '9001', '10');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9011', 'Mobiliario, adornos y artefactos eléctricos (PC, impresora, etc.)', '2', '9001', '11');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9012', 'Observaciones', '4', '9001', '12');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9013', 'Cestos de basura', '2', '9001', '13');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9014', 'Observaciones', '4', '9001', '14');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9015', 'Pisos', '2', '9001', '15');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9016', 'Observaciones', '4', '9001', '16');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9017', 'Odorización', '2', '9001', '18');
INSERT INTO `planner_assetcloud_integracion`.`frm_valores` (`VALO_ID`, `NOMBRE`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES ('9018', 'Observaciones', '4', '9001', '19');
