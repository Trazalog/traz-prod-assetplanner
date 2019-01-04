<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('cargarCabecera')){
    // id de pedido es el petr_id de la tabla trj_pedido_trabajo se obtiene con el bpm_id de esa tabla
    function cargarCabecera($idPedido){
      //get main CodeIgniter object
			$ci =& get_instance();			
			//load databse library
			$ci->load->database();
			
			//get data from database			
			$ci->db->from('trj_pedido_trabajo as A');
			$ci->db->join('admcustomers as B','A.clie_id=B.cliId');
			$ci->db->where('petr_id',$idPedido);
			$query = $ci->db->get();
			
			if($query->num_rows() > 0){
					$result = $query->row_array();
			}
			echo '        
						<div id="collapseDivCli" class="box box-default collapsed-box box-solid">
							<div class="box-header with-border">
								<h3 id="tituloInfo" class="box-title">Cliente: '.$result['cliName'].' / Mas Detalles</h3>

								<div class="box-tools pull-right">
								<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" onclick="mostrarCliente()">
										<i class="fa fa-plus"></i>
								</button>
							</div>
									<!-- /.box-tools -->
							</div>
								<!-- /.box-header -->
								<div class="box-body">
										<div class="row">
												<div class="col-xs-12">
														<label style="margin-top: 7px;">Domicilio: </label>
														<input type="text" id="domicilio" class="form-control"  value="'.$result['cliAddress'].'" disabled/>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">Teléfono: </label>
																<input type="text" id="telefono" class="form-control" value="'.$result['cliMovil'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">Celular: </label>
																<input type="text" id="celular" class="form-control" value="'.$result['cliPhone'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">Contacto: </label>
																<input type="text" id="contacto" class="form-control" value="'.$result['cliEmail'].'" disabled/>
														</div>
												</div>
										</div>

								</div>
								<!-- /.box-body -->
						</div>
						<div id="collapseDiv" class="box box-default collapsed-box box-solid">
								<div class="box-header with-border">
										<h3 id="pedidoInfo" class="box-title">N° Interno: '.$result['cod_interno'].'</h3>

										<input type="text" id="cod_interno" class="form-control hidden" value="'.$result['cod_interno'].'">
										<input type="text" id="id_pedido" class="form-control hidden" value="'.$idPedido.'">

										<div class="box-tools pull-right">
												<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" >
														<i class="fa fa-plus"></i>
												</button>
										</div>
										<!-- /.box-tools -->
								</div>
								<!-- /.box-header -->
								<div class="box-body">
										<div class="row">
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label>Parte / Vehículo: </label>
																<input type="text" id="parte" class="form-control obligatorio" value="'.$result['parte_vehiculo'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label>Patente: </label>
																<input type="text" id="patente" class="form-control" value="'.$result['patente'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label>N° de Motor: </label>
																<input type="text" id="num_motor" class="form-control obligatorio" value="'.$result['num_motor'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label>Indice: </label>
																<input type="text" id="indice" class="form-control obligatorio" value="'.$result['indice'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label>Motor: </label>
																<input type="text" id="motor" class="form-control obligatorio" value="'.$result['motor'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">N° de Chásis: </label>
																<input type="text" id="num_chasis" class="form-control" value="'.$result['num_chasis'].'" disabled/>
														</div>
												</div>
										</div>
										<div class="row">
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">Condición : </label>
																<input type="text" id="condicion" class="form-control" value="'.$result['condicion'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">Familia de Productos : </label>
																<input type="text" id="familia_productos" class="form-control" value="'.$result['familia_producto'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">Subfamilia : </label>
																<input type="text" id="subfamilia" class="form-control" value="'.$result['subfamilia'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label style="margin-top: 7px;">Fecha Compromiso Entrega Informe: </label>
																<input type="text" id="fecha_entrega" class="form-control" value="'.$result['fec_entrega'].'" disabled/>
														</div>
												</div>
												<div class="col-xs-12 col-sm-4">
														<div class="form-group">
																<label>Observaciones:</label>
																<textarea id="observacion" class="form-control" disabled>'.$result['observacion'].'</textarea>
														</div>
												</div>
										</div>
										<!--FIN ROW   -->
								</div>
						</div>
						<!-- /.box-body -->
				</div>
				<!-- /.box-body -->';
} } 

?>