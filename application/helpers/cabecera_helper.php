<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('cargarCabecera')){
    // id de pedido es el petr_id de la tabla trj_pedido_trabajo se obtiene con el bpm_id de esa tabla
    function cargarCabecera($id_OT = 0, $id_SS = 0, $id_EQ = null){
		// equipo
			$ci =& get_instance();			
			//load databse library
			$ci->load->database();			
			if($id_EQ != null){
				
				//get main CodeIgniter object
				//get data from database		
				$ci->db->select('equipos.descripcion AS descripcionEquipo,
												equipos.fecha_ingreso,												
												equipos.codigo,
												equipos.ubicacion,
												equipos.estado,
												admcustomers.cliRazonSocial AS cliente,
												marcasequipos.marcadescrip AS marca,');	
				$ci->db->from('equipos');	
				$ci->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');	
				$ci->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');	
				$ci->db->where('equipos.id_equipo', $id_EQ);
				$query = $ci->db->get();			
				if($query->num_rows() > 0){
						$result = $query->row_array();
				}
			}
			// Solic Servicios			
			if($id_SS != 0){
				$ci->db->select('solicitud_reparacion.id_solicitud,
												solicitud_reparacion.solicitante,
												solicitud_reparacion.causa,
												solicitud_reparacion.f_solicitado,
												equipos.codigo AS equipo,
												sector.descripcion AS descripcionSector,
												grupo.descripcion AS descripcionGrupo');	
				$ci->db->from('solicitud_reparacion');
				$ci->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
				$ci->db->join('sector', 'equipos.id_sector = sector.id_sector');
				$ci->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo');			
				$ci->db->where('solicitud_reparacion.id_solicitud', $id_SS);
				$querySS = $ci->db->get();			
				if($querySS->num_rows() > 0){
						$resultSS = $querySS->row_array();
				}
				$ci->load->model('Sservicios');
				$adjuntos = $ci->Sservicios->getAdjuntosSolServicio($id_SS);
			}	
			// OT
			if($id_OT != 0){
				$ci->db->select('tareas.descripcion AS tareaDescrip,
												orden_trabajo.descripcion AS otDescrip,
												orden_trabajo.fecha_program AS fecha,
												orden_trabajo.id_orden,
												orden_trabajo.duracion,
												admcustomers.cliRazonSocial AS cliente,
												orden_trabajo.estado');	
				$ci->db->from('orden_trabajo');		
				$ci->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea','left');		
				$ci->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
				$ci->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');	
				$ci->db->where('orden_trabajo.id_orden', $id_OT);
				$queryOT = $ci->db->get();			
				if($queryOT->num_rows() > 0){
						$resultOT = $queryOT->row_array();
						// var_dump($resultOT);
						if($resultOT['tareaDescrip'] == null){
							$resultOT['tareaDescrip'] = $resultOT['otDescrip'];
						}
				}
			}		

			// Info Equipo 
			if($id_EQ != null)
			echo '        
						<div id="collapseDivCli" class="box box-default collapsed-box box-solid">
							<div class="box-header with-border">
								<h3 id="tituloInfo" class="box-title">Equipo: '.$result['codigo'].' - '.$result['descripcionEquipo'].' / Mas Detalles</h3>
								<div class="box-tools pull-right">
								<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" onclick="mostrarCliente()">
										<i class="fa fa-plus"></i>
								</button>
							</div>
									<!-- /.box-tools -->
							</div>
								<!-- /.box-header -->
								<div class="box-body">
										
									<div class="col-xs-12 col-sm-4">
										<div class="form-group">
												<label style="margin-top: 7px;">Marca: </label>
												<input type="text" id="" class="form-control" value="'.$result['marca'].'" disabled/>
										</div>						
									</div>
									<div class="col-xs-12 col-sm-4">
										<div class="form-group">
												<label style="margin-top: 7px;">Código: </label>
												<input type="text" id="codigo" class="form-control" value="'.$result['codigo'].'" disabled/>
										</div>
									</div>
									<div class="col-xs-12 col-sm-4">
										<div class="form-group">
												<label style="margin-top: 7px;">Cliente: </label>
												<input type="text" id="cliente" class="form-control" value="'.$result['cliente'].'" disabled/>
										</div>
									</div>	
									<div class="col-xs-12 col-sm-4">
										<label style="margin-top: 7px;">Ubicación: </label>
										<input type="text" class="form-control"  value="'.$result['ubicacion'].'" disabled/>
									</div>
									<div class="clearfix"></div>
									<div class="col-xs-12 col-sm-4">
										<label style="margin-top: 7px;">Descripción: </label>
										<input type="text" class="form-control"  value="'.$result['descripcionEquipo'].'" disabled/>
									</div>									
									<div class="col-xs-12 col-sm-4">
										<label style="margin-top: 7px;">Fecha Ingreso: </label>
										<input type="text" class="form-control"  value="'.$result['fecha_ingreso'].'" disabled/>
									</div>
									<div class="col-xs-12 col-sm-4">
										<label style="margin-top: 7px;">Estado: </label>';
										if ($result['estado'] == 'AC') {
											echo  '<input type="text" class="form-control"  value="Activo" disabled/>';
										}
										if ($result['estado'] == 'IN') {
											echo  '<input type="text" class="form-control"  value="Inactivo" disabled/>';
										}
										if ($result['estado'] == 'AL') {
											echo  '<input type="text" class="form-control"  value="Alta" disabled/>';
										}										
									echo '</div>	
								</div>
								<!-- /.box-body -->
						</div>
					
						<!-- /.box-body -->
				</div>
			<!-- /.box-body -->';

			// Solicitud Servicios
			if($id_SS != 0){
				if($adjuntos != null){
					$adjuntosGallery = '';
					$baseUrl = base_url();
					foreach ($adjuntos as $key => $value) {
						$href = $baseUrl . $value->url . $value->nombre;
						$adjuntosGallery += '<div class="col-md-3 col-xs-6">
							<a href="'.$href.'" target="_blank">
							<img src="'.$href.'" class="img-responsive" style="width: 100%; height: 100px;">
							</a>
						</div>';
					}
				}
				echo '        
				<div id="collapseDivCli" class="box box-default collapsed-box box-solid">
					<div class="box-header with-border">
						<h3 id="tituloInfo" class="box-title">Solicitud de Servicios Nº '.$resultSS['id_solicitud'].' / Mas Detalles</h3>
						<div class="box-tools pull-right">
						<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" onclick="mostrarCliente()">
								<i class="fa fa-plus"></i>
						</button>
					</div>
							<!-- /.box-tools -->
					</div>
						<!-- /.box-header -->
						<div class="box-body">
								
							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										<label style="margin-top: 7px;">Solicitante: </label>
										<input type="text"  class="form-control" value="'.$resultSS['solicitante'].'" disabled/>
								</div>						
							</div>
							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										<label style="margin-top: 7px;">Fecha: </label>
										<input type="text"  class="form-control" value="'.$resultSS['f_solicitado'].'" disabled/>
								</div>						
							</div>
							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										<label style="margin-top: 7px;">Causa: </label>
										<input type="text"  class="form-control" value="'.$resultSS['causa'].'" disabled/>
								</div>						
							</div>
							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										<label style="margin-top: 7px;">Equipo: </label>
										<input type="text" id="codigo" class="form-control" value="'.$resultSS['equipo'].'" disabled/>
								</div>
							</div>
							<div class="col-xs-12 col-sm-4">
								<label style="margin-top: 7px;">Grupo: </label>
								<input type="text" id="domicilio" class="form-control"  value="'.$resultSS['descripcionGrupo'].'" disabled/>
							</div>
							<div class="col-xs-12 col-sm-4">
								<label style="margin-top: 7px;">Sector: </label>
								<input type="text" class="form-control"  value="'.$resultSS['descripcionSector'].'" disabled/>
							</div>
							
							

							
						<div class="col-md-12">
							<div class="panel-group" id="panelAdj" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOneSolServicio">
										<h4 class="panel-title">
										<a role="button" data-toggle="collapse" data-parent="#panelAdj" href="#collapseadj" aria-expanded="false" aria-controls="collapseadj">
											Adjuntos
										</a>
										</h4>
									</div>
									<div id="collapseadj" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOneSolServicio">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-12 col-xs-12 col-lg-12">
													<div id="adjuntosGallery">
														'.$adjuntosGallery.'
													</div>
												</div>
											</div><!-- /.row -->
										</div><!-- ./panel-body -->
									</div><!-- ./panel-collapse -->
								</div><!-- ./panel-default -->
							</div><!-- ./panel-group -->
						</div><!-- ./col-md-12 -->
						</div>
						<!-- /.box-body -->
				</div>
			
				<!-- /.box-body -->
				</div>
				<!-- /.box-body -->';
			}

			// Orden Trabajo
			if($id_OT != 0){
				echo '        
				<div id="collapseDivCli" class="box box-default collapsed-box box-solid info-ot">
					<div class="box-header with-border">
						<h3 id="tituloInfo" class="box-title">Orden de Trabajo N°: '.$resultOT['id_orden'].' / Mas Detalles</h3>
						<div class="box-tools pull-right">
						<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" onclick="mostrarCliente()">
								<i class="fa fa-plus"></i>
						</button>
					</div>
							<!-- /.box-tools -->
					</div>
						<!-- /.box-header -->
						<div class="box-body">

							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										<label style="margin-top: 7px;">Nº Orden Trabajo: </label>
										<input type="text" id="ot" class="form-control" value="'.$resultOT['id_orden'].'" disabled/>
								</div>						
							</div>								
							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										<label style="margin-top: 7px;">Descripción: </label>
										<input type="text"  class="form-control" value="'.$resultOT['otDescrip'].'" disabled/>
								</div>						
							</div>
							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										 <label style="margin-top: 7px;">Cliente: </label>
										 <input type="text" class="form-control" value="'.$resultOT['cliente'].'" disabled/>
								</div>
							</div>	
							<div class="col-xs-12 col-sm-4">
								<div class="form-group">
										<label style="margin-top: 7px;">Fecha Programación: </label>
										<input type="text" id="codigo" class="form-control" value="'.$resultOT['fecha'].'" disabled/>
								</div>
							</div>
							<div class="col-xs-12 col-sm-4">
								<label style="margin-top: 7px;">Duración: </label>
								<input type="text" id="duracion" class="form-control"  value="'.$resultOT['duracion'].'" disabled/>
							</div>							
							
							<div class="col-xs-12 col-sm-4">
								<label style="margin-top: 7px;">Estado: </label>';								
								if ($resultOT['estado'] == 'S') {								
									echo  '<input type="text" class="form-control"  value="Solicitada" disabled/>';
								}
								if($resultOT['estado'] == 'PL'){    
									echo  '<input type="text" class="form-control"  value="Planificada" disabled/>';
								}
								if($resultOT['estado'] == 'AS'){									
									echo  '<input type="text" class="form-control"  value="Asignada" disabled/>';
								}
								if ($resultOT['estado'] == 'C') {								
									echo  '<input type="text" class="form-control"  value="Curso" disabled/>';
								}
								if ($resultOT['estado'] == 'T') {								
									echo  '<input type="text" class="form-control"  value="Terminada" disabled/>';
								}
								if ($resultOT['estado'] == 'CE') {								
									echo  '<input type="text" class="form-control"  value="Cerrada" disabled/>';
								}  
								if ($resultOT['estado'] == 'CN') {
									echo  '<input type="text" class="form-control"  value="Conforme" disabled/>';
								} 							
							echo '</div>
							<div class="col-xs-12 col-sm-12">
								<label style="margin-top: 7px;">Tarea: </label>
								<textarea id="info-tarea" class="form-control" rows="7" disabled>'.$resultOT['tareaDescrip'].'</textarea>
							</div>
						</div>
						
						<!-- /.box-body -->
				</div>
			
					<!-- /.box-body -->
				</div>
				<!-- /.box-body -->';
			}				
} } 

?>