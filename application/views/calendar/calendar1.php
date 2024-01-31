<input type="hidden" id="permission" value="<?php echo $permission;?>">

<section class="content">
    <style>
    input.prevent {
        border: none;
        padding-left: 5px;
        width: 100%;
    }

    .selmes {
        margin-bottom: 10px;
    }

	/* Estilo para preventivos no asignados, resalta el borde*/
	.tipo-3-border {
    	border: 2px solid blue; 
	}	
    </style>

    <!-- CALENDARIO -->
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-body">
                <div class="fa fa-fw fa-print text-light-blue" style="cursor: pointer; margin-left:10px;"
                    title="Imprimir"></div>
                <button class="btn btn-link" title="Filtrar OT" onclick="openPanel()">
					<i class="fa fa-fw fa-filter text-light-blue"></i>
				</button>
                <div id="calendar"></div>
            </div><!-- /.box-body -->
        </div><!-- /. box -->
	</div><!-- /.col -->
	
    <div id="tablas">

    </div>


</section><!-- /.content -->

<script>

$('#panel-derecho-body').load('<?php echo base_url() ?>index.php/Calendario/panelFiltro');

// Trae tablas con tareas al costado del Calendar
function getTablas(month_, year_) {
    var mes = parseInt(month_) + 1;
    var year = parseInt(year_);
    var permission = '<?php echo $permission ?>';
    //var permission = $('#permission').val();
    $.ajax({
        url: 'index.php/Calendario/getTablas',
        type: "POST",
        data: {
            mes: mes,
            year: year,
            permission: permission
        },
        success: function(data) {
            $('#tablas').html(data);
        },
        error: function(data) {
            alert('Error. No se encontraron tablas');
        }
    });
}

var mes = "";


function ini_events(ele) {
    ele.each(function() {
        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };
        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);
        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 1070,
            revert: true, // will cause the event to go back to its
            revertDuration: 0 //  original position after the drag
        });
    });
}
ini_events($('#external-events div.external-event'));

/* initialize the calendar
-----------------------------------------------------------------*/
//Date for the calendar events (dummy data)
	var date = new Date();
	var d = date.getDate(),
					m = date.getMonth(),
					y = date.getFullYear();

	$('#calendar').fullCalendar({
					header: {
									left: 'prev,next today',
									center: 'title',
									right: 'month,agendaWeek,agendaDay'
					},
					buttonText: {
									today: 'Hoy',
									month: 'Mes',
									week: 'Semana',
									day: 'Día'
					},
					// desde aca busca los preventivos
					events: function(start, end, timezone, callback) {
									//WaitingOpen('Cargando trabajo');
									var date_ = new Date($("#calendar").fullCalendar('getDate'));
									var month_ = date_.getMonth();
									var year_ = date_.getFullYear();
									var evento = $.ajax({
													url: 'index.php/Calendario/getcalendarot',
													data: {
																	month: month_,
																	year: year_
													},
													dataType: 'json',
													type: 'POST',
													success: function(doc) {
																	console.log(doc);

																	var events = [];
																	getTablas(month_, year_);
																	$(doc).each(function() {
																					var tarea = $(this).attr('descripcion');
																					// console.log('Tarea: ');
																					// console.log(tarea);
																					var desde = $(this).attr('fecha_program'); //ultimo preventivo hecho
																					var from = new Date(desde);
																					// sumo los minutos
																					var minutos = parseInt(from.getMinutes());
																					var duracion = parseInt($(this).attr('duracion'));
																					var totalminutos = minutos + duracion;

																					var hasta = new Date(from);
																					hasta = hasta.setMinutes(totalminutos);
																					var to = new Date(hasta);

																					var Color = '';
																					switch ($(this).attr('tipo')) {
																									case '1':
																													Color = '#3c8dbc'; //Orden Trabajo (celeste)
																													break;
																									case '2':
																													Color = '#f56954'; //Correctivo (rojo)
																													break;
																									case '3':
																													Color = '#39CCCC'; //Preventivo (turquesa)
																													break;
																									case '4':
																													Color = '#ff851b'; //Backlog (naranja)
																													break;
																									case '5':
																													Color = '#00a65a'; //Predictivo (verde)
																													break;
																									case '6':
																													Color = '#D81B60'; //Correctivo Programado (fucsia)
																													break;
																					};

																					events.push({
																									// title: $(this).attr('descripcion') + ',' + $(this).attr('id_tarea'),
																									//start:to,
																									start: from,
																									end: to,
																									title:  $(this).attr('id_orden') + ' | ' +$(this).attr('codigo') +' | '+ $(this).attr('descripcion'),
																									codigo: $(this).attr('nro'),
																									equipo: $(this).attr('codigo'),
																									id_orden: $(this).attr('id_orden'),
																									allDay: false,
																									backgroundColor: Color,
																									
																									//le agrego una clase a los preventivos sin asignar para poder darles un estilo distinto de css
																									className: ($(this).attr('tipo') === '3' && !$(this).attr('id_usuario_a')) ? 'tipo-3-border' : undefined,
																									
																									//Datos Filtro
																									area: $(this).attr('area'),
																									grupo: $(this).attr('grupo'),
																									sector: $(this).attr('sector'),
																									origen: $(this).attr('origen')
																					});

																	});
																	callback(events);
																	WaitingClose();
																	//filtro();
													},
													error: function(doc) {
																	WaitingClose();
																	alert('Sin datos para este mes');
																	//alert("Error en ajax calendario:" + doc);
													}
									});
					},

					eventClick: function(event) {
									// levanta modal con detalle Orden Trabajo
									verDetalleOT(event.id_orden);
					},

					editable: true,
					droppable: true, // this allows things to be dropped onto the calendar !!!

					drop: function(date, allDay) { // this function is called when something is dropped
									// retrieve the dropped element's stored Event Object
									var originalEventObject = $(this).data('eventObject');
									// we need to copy it, so that multiple events don't have a reference to the same object
									var copiedEventObject = $.extend({}, originalEventObject);
									// assign it the date that was reported
									copiedEventObject.start = date;
									copiedEventObject.allDay = allDay;
									copiedEventObject.backgroundColor = $(this).css("background-color");
									copiedEventObject.borderColor = $(this).css("border-color");
									// render the event on the calendar
									// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
									$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
									// is the "remove after drop" checkbox checked?
									if ($('#drop-remove').is(':checked')) {
													// if so, remove the element from the "Draggable Events" list
													$(this).remove();
									}
					},
					// Triggered when dragging stops and the event has moved to a different day/time.
					eventDrop: function(event, delta, revertFunc) {
									//alert("La Tarea: " + event.title + " cambio su programacion al dia " + event.start.format());
									var resultado = "";
									var nuevoDia = event.start.format();
									var id_OT = event.id_orden;
									if (!confirm("Realmente desea hacer este cambio?")) {
													revertFunc();
									} else {
													resultado = updateDia(id_OT, nuevoDia);
													if (resultado == 'false') {
																	revertFunc();
																	alert("No pudo realizarse el cambio");
													} else {
																	//alert("Cambio exitoso");
													}
									}
					},
					// Triggered when resizing stops and the event has changed in duration.          
					eventResize: function(event, delta, revertFunc) {
									var result = "";
									var duracion = delta;
									var id_OT = event.id_orden;
									duracion = duracion / 60000;
									//alert("Se agrego o resto: " + duracion + " cambio su duración y finalizará  " + event.end.format("h:mm:ss a"));
									if (!confirm("Realmente desea hacer este cambio?")) {
													revertFunc();
									} else {
													result = updateHora(id_OT, duracion);
													if (result == 'false') {
																	revertFunc();
																	alert("No pudo realizarse el cambio");
													} else {
																	//alert("Cambio exitoso");
													}
									}
					},

					eventRender: function eventRender(event, element, view) {
			return ($('#flt-equipos').val() == '' || (['all', event.equipo].indexOf($('#flt-equipos').val()) >= 0)) && 
							($('#flt-areas').val() == '' || (['all', event.area].indexOf($('#flt-areas').val()) >= 0)) &&
																($('#flt-grupos').val() == '' || (['all', event.grupo].indexOf($('#flt-grupos').val()) >= 0)) &&
																($('#flt-sectores').val() == '' || (['all', event.sector].indexOf($('#flt-sectores').val()) >= 0)) &&
																($('#flt-origenes').val() == '' || (['all', event.origen].indexOf($('#flt-origenes').val()) >= 0));
					}
	});

/* ADDING EVENTS */
	var currColor = "#3c8dbc"; //Red by default
	//Color chooser button
	var colorChooser = $("#color-chooser-btn");
	$("#color-chooser > li > a").click(function(e) {
					e.preventDefault();
					//Save color
					currColor = $(this).css("color");
					//Add color effect to button
					$('#add-new-event').css({
									"background-color": currColor,
									"border-color": currColor
					});
	});
	$("#add-new-event").click(function(e) {
					e.preventDefault();
					//Get value and make sure it is not null
					var val = $("#new-event").val();
					if (val.length == 0) {
									return;
					}

					//Create events
					var event = $("<div />");
					event.css({
									"background-color": currColor,
									"border-color": currColor,
									"color": "#fff"
					}).addClass("external-event");
					event.html(val);
					$('#external-events').prepend(event);

					//Add draggable funtionality
					ini_events(event);

					//Remove event from text input
					$("#new-event").val("");
	});


/* EJECUTAR TAREA EN BPM */
	// Muestra modal con detalle de orden y btn para ejecutar tarea
	function verDetalleOT(id_orden) {
					WaitingOpen();
					$('#modalInformeServicios').empty();
					$("#modalInformeServicios").load("<?php echo base_url(); ?>index.php/Calendario/verEjecutarOT/" + id_orden + "/");
					$('#modalInforme').modal('show');
					WaitingClose();
	}


/* ./ EJECUTAR TAREA EN BPM */

$(".fa-print").click(function(e) {
    $("#calendar").printArea();
});

//  Datatables listas
$('#correctivo').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": true,
    "language": {
        "lengthMenu": "Ver _MENU_ filas por página",
        "zeroRecords": "No hay registros",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "No hay registros disponibles",
        "infoFiltered": "(filtrando de un total de _MAX_ registros)",
        "sSearch": "Buscar:  ",
        "oPaginate": {
            "sNext": "Sig.",
            "sPrevious": "Ant."
        }
    }
});

$('#preventivo').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": true,
    "language": {
        "lengthMenu": "Ver _MENU_ filas por página",
        "zeroRecords": "No hay registros",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "No hay registros disponibles",
        "infoFiltered": "(filtrando de un total de _MAX_ registros)",
        "sSearch": "Buscar:  ",
        "oPaginate": {
            "sNext": "Sig.",
            "sPrevious": "Ant."
        }
    }
});

$('#preventhoras').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": true,
    "language": {
        "lengthMenu": "Ver _MENU_ filas por página",
        "zeroRecords": "No hay registros",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "No hay registros disponibles",
        "infoFiltered": "(filtrando de un total de _MAX_ registros)",
        "sSearch": "Buscar:  ",
        "oPaginate": {
            "sNext": "Sig.",
            "sPrevious": "Ant."
        }
    }
});

$('#backlog').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": true,
    "language": {
        "lengthMenu": "Ver _MENU_ filas por página",
        "zeroRecords": "No hay registros",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "No hay registros disponibles",
        "infoFiltered": "(filtrando de un total de _MAX_ registros)",
        "sSearch": "Buscar:  ",
        "oPaginate": {
            "sNext": "Sig.",
            "sPrevious": "Ant."
        }
    }
});

$('#predictivo').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": true,
    "language": {
        "lengthMenu": "Ver _MENU_ filas por página",
        "zeroRecords": "No hay registros",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "No hay registros disponibles",
        "infoFiltered": "(filtrando de un total de _MAX_ registros)",
        "sSearch": "Buscar:  ",
        "oPaginate": {
            "sNext": "Sig.",
            "sPrevious": "Ant."
        }
    }
});



///// Datepicker para modales
$("#fecha_progr_pred").datepicker({
    Format: 'dd/mm/yy',
    startDate: '-3d',
    //minDate: new Date(),
    //firstDay: 1
}).datepicker("setDate", new Date());

$("#fecha_progr_correct").datepicker({
    Format: 'dd/mm/yy',
    startDate: '-3d',
    //minDate: new Date(),
    //firstDay: 1
}).datepicker("setDate", new Date());

$("#fecha_progr_prevent").datepicker({
    Format: 'dd/mm/yy',
    startDate: '-3d',
    //minDate: new Date(),
    //firstDay: 1
}).datepicker("setDate", new Date());

$("#fecha_progr_back").datepicker({
    Format: 'dd/mm/yy',
    startDate: '-3d',
    //minDate: new Date(),
    //firstDay: 1
}).datepicker("setDate", new Date());

$("#fecha_progr_prevent_horas").datepicker({
    Format: 'dd/mm/yy',
    startDate: '-3d',
    //minDate: new Date(),
    //firstDay: 1
}).datepicker("setDate", new Date());


//////////  CORRECTIVO (Listoooo)
	var tarea = "";
	var fecha_solicit = "";
	var id_sol = "";
	var id_eq = "";
	var desc_causa = "";

	// Genera Orden de Trabajo y la guarda automaticamente
	$('.fa-stop-circle').click(function() {


	});

	function fill_Correc(dato,eval) {
					//alert(dato);

					//Luis Zorrilla - Modal Cargar IdTarea y Tomar tarea
					$('#modal-correctivo').modal("show");
					var data= $(eval).closest('tr').attr('id');
					var idTareaBonita = data.split("-");
					var idTarea = idTareaBonita[1];
					console.log(idTarea);
					$('#idTarBonita').val(idTarea);
					//Luis Zorrilla - Modal Cargar IdTarea y Tomar tarea 
					tomarTareaTabla();
					
					$.ajax({
									type: 'POST',
									data: {
													id: dato
									},
									url: 'index.php/Calendario/getCorrectPorId',
									success: function(data) {

													console.log('correctivos: ');
													console.log(data);
													tarea = 0; // id_tarea (por defecto 1, no se sabe la tarea a realizar)
													fecha_solicit = data[0]['f_solicitado'];
													desc_causa = data[0]['causa'];
													id_sol = data[0]['id_solicitud'];
													id_eq = data[0]['id_equipo'];
									},
									error: function(data) {

													console.log(data);
									},
									dataType: 'json'
					});
	}


	// Limpia variables
	function CancCorrec() {
					tarea = "";
					fecha_solicit = "";
					id_sol = "";
					id_eq = "";
					desc_causa = "";
	}

	// Guarda OT desde Correctivo (Solicitud de Servicio)
	function setOtCorrectivo() {

					var progr_corr = $('#fecha_progr_correct').val();
					//  alert(progr_corr);
					var hor_corr = $('#hora_progr_correct').val();
					//llamado a nueva funcion para toma la tarea

					var isExecuted = validarHorario(progr_corr,progr_corr);

					console.log('Excute: '+isExecuted); 

					if(isExecuted){
									
									$.ajax({
													type: 'POST',
													data: {
																	event_tipo: 1, // evento unico
																	id_sol: id_sol,
																	id_tarea: tarea,
																	fecha_progr: progr_corr,
																	hora_progr: hor_corr,
																	fecha_inicio: fecha_solicit,
																	descripcion: desc_causa,
																	tipo: 2, // correctivo
																	ide: id_eq,
																	mes: mes,
																	cant_meses: 0 // cantidad de meses a repetir esta OT
													},
													url: 'index.php/Calendario/guardar_agregar',
													success: function(data) {

																	setTimeout("cargarView('Calendario', 'indexot', '" + $('#permission').val() + "');", 0);
													},
													error: function(result) {

																	console.log(result);
													}
									});
					}else{
									alert('Escoga un nuevo horario o fecha');
					}
	}
//////////  / CORRECTIVO (Listoooo)

//////////  / TOMAR TAREA (Listoooo)
	function tomarTareaTabla() {

					var idTarBonita = $('#idTarBonita').val();
				
					var post = {
									type: 'POST',
									data: {
													idTarBonita: idTarBonita
									},
									url: 'index.php/Tarea/tomarTarea',
									success: function (data) {

													// toma a tarea exitosamente
													if (data.status) {
																	console.log("Tarea Tomada");
													} else {
																	alert(data.msj)
													}

									},
									error: function (result) {
													console.log(result);
									},
									dataType: 'json'
					};

					if (conexion()) $.ajax(post);
					else {
									ajax(post);
									
					}
					//Guardar Estado en Sesion
					var task = $('#task').val() + '_tomar';
					var id = 'tomar';
					var value = true;
					guardarEstado(task, value, id);
	}

////////////Soltar Tarea Tabla (Listooooo)
// Soltar tarea en BPM
	function soltarTareaTabla() {
					var idTarBonita = $('#idTarBonita').val();
					var post = {
									type: 'POST',
									data: {
													idTarBonita: idTarBonita
									},
									url: 'index.php/Tarea/soltarTarea',
									success: function (data) {

													// toma a tarea exitosamente
													if (data.status) {
																	console.log("Solar Tarea");
													} else {
																	alert(data.msj)
													}
									},
									error: function (result) {
													console.log(result);
									},
									dataType: 'json'
					};

					if (conexion()) $.ajax(post);
					else {
									ajax(post);
									deshabilitar();
					}

					//Guardar Estado en Sesion
					var task = $('#task').val() + '_tomar';
					var id = 'tomar';
					var value = false;
					guardarEstado(task, value, id);
	}


//////////  PREVENTIVO (Listoooo)
	var id_tar = "";
	var fec_sol_prev = "";
	var id_prev = "";
	var id_equ = "";
	var desc_tarea = "";

	function fill_Prevent(dato) {
					$.ajax({
									data: {
													id: dato
									},
									dataType: 'json',
									type: 'POST',
									url: 'index.php/Calendario/getPrevPorId',
									success: function(data) {
													id_tar = data[0]['id_tarea'];
													fec_sol_prev = data[0]['ultimo'];
													id_prev = data[0]['prevId'];
													id_equ = data[0]['id_equipo'];
													desc_tarea = data[0]['descripcion'];
									},
									error: function(data) {
													console.error("Error al trear preventivos por Id");
													console.table(data);
									},
					});
	}

	function setOtPreventivo() {
					var progr_corr = $('#fecha_progr_prevent').val();
					var hora_prog_prevent = $('#hora_prog_prevent').val();
					var event_Preventivo = $('#event_Preventivo').val();
					var cant_meses_prev = $('#cant_meses_prev').val();

					var isExecuted = validarHorario(progr_corr,hora_prog_prevent);

					console.log('Excute: '+isExecuted); 

					if(isExecuted){

									$.ajax({
													type: 'POST',
													data: {
																	id_sol: id_prev,
																	id_tarea: id_tar,
																	fecha_progr: progr_corr,
																	hora_progr: hora_prog_prevent,
																	fecha_inicio: fec_sol_prev,
																	descripcion: desc_tarea,
																	tipo: 3, // preventivo
																	ide: id_equ,
																	event_tipo: event_Preventivo,
																	cant_meses: cant_meses_prev
													},
													url: 'index.php/Calendario/guardar_agregar',
													success: function(data) {
																	setTimeout("cargarView('Calendario', 'indexot', '" + $('#permission').val() + "');", 0);
																	alert("Se ha guardado Correctamente");
													},
													error: function(result) {
																	console.log(result);
													}
									});
					}else{
									alert('Escoga un nuevo horario fecha');
					}
	}

	function CancPrevent() {
					id_tar = "";
					fec_sol_prev = "";
					id_prev = "";
					id_equ = "";
					desc_tarea = "";
	}

	//habilita/deshabilita el campo cantidad
	$('#event_Preventivo').change(function() {
					if ($(this).val() == 0) {
									$('#cant_meses_prev').attr('disabled', true);
					} else {
									$('#cant_meses_prev').attr('disabled', false);
					}
	});
//////////  / PREVENTIVO 

//////////  PREVENTIVO POR HORAS CAMBIAR VARIABLE IDP UREGNTTE
	var id_tarhs = "";
	var fec_sol_prevhs = "";
	var id_prevhs = "";
	var id_equhs = "";
	var desc_tareahs = "";
	var proximo_servicio = "";
	var ultima_lectura = "";

	//$('.fa-history').click(function(){
	$(document).on("click", ".fa-history", function() {
					id_prevhs = $(this).parents("tr").find("td").eq(1).html();
					id_equhs = $(this).parents("tr").find("td").eq(2).html();
					id_tarhs = $(this).parents("tr").find("td").eq(3).html();
					desc_tareahs = $(this).parents("tr").find("td").eq(5).html();
					fec_sol_prevhs = $(this).parents("tr").find("td").eq(6).html();
					proximo_servicio = $(this).parents("tr").find("td").eq(9).html();
					ultima_lectura = $(this).parents("tr").find("td").eq(10).html();
	});

	function validarHorario(fecha,hora){

					var isExecuted = true;
					if(hora == '00:00'){
									console.log('1: '+hora);
									//alert();
									isExecuted = confirm("Esta Seguro de la Asignación? Hora: "+hora+' Para la Fecha: '+fecha);    
					}else{
									isExecuted = true;
					}

					return isExecuted;
	}

	function setOtPrevHoras() {
					var progr_corr_hs = $('#fecha_progr_prevent_horas').val();
					var hora_progr_prevH = $('#hora_progr_prevH').val();

					var isExecuted = validarHorario(progr_corr_hs,hora_progr_prevH);

					console.log('Excute: '+isExecuted); 

					if(isExecuted){
									$.ajax({
													type: 'POST', //parametros:parametros
													data: {
																	id_sol: id_prevhs,
																	id_tarea: id_tarhs,
																	fecha_progr: progr_corr_hs,
																	hora_progr: hora_progr_prevH,
																	fecha_inicio: fec_sol_prevhs,
																	descripcion: desc_tareahs,
																	idp: id_sol,
																	tipo: 3, // preventivo
																	ide: id_equhs,
																	//lectura_programada: proximo_servicio,
																	event_tipo:1,
																	lectura_ejecutada: ultima_lectura
													},
													url: 'index.php/Calendario/guardar_agregar',
													success: function(data) {
													
																	setTimeout("cargarView('Calendario', 'indexot', '" + $('#permission').val() + "');", 0);
																	alert("Se ha guardado Correctamente");
													},
													error: function(result) {
																	console.log(result);
													}
									});
					}else{
									alert('Escoga un nuevo horario o fecha');
					}
					
	}

	function CancPrevHoras() {
					id_tarhs = "";
					fec_sol_prevhs = "";
					id_prevhs = "";
					id_equhs = "";
					desc_tareahs = "";
	}
//////////  / PREVENTIVO POR HORAS 

//////////  BACKLOG (Listoooo)
	var id_de_tar = "";
	var fec_sol_back = "";
	var desc_tarea_back = "";
	var id_back = "";
	var id_equi = "";
	var duracion = "";

	function fill_Backlog(dato) {
					console.log('Rellenar Backlog...');
					$.ajax({
									type: 'POST',
									data: {
													id: dato
									},
									url: 'index.php/Calendario/getBackPorId',
									success: function(data) {
debugger;
													id_de_tar = parseInt(data[0]['id_tarea']);
													fec_sol_back = data[0]['fecha'];
													id_back = data[0]['backId'];
													id_equi = data[0]['id_equipo'];
													//tarea = data[0]['descripcion'];
													id_sol = data[0]['sore_id'];
													duracion = data[0]['back_duracion'];

													// - Si hay T.STD(solamente) ha grabado id_tarea sin T.CUSTOM
													// - Si hay T.CUSTOM(solamente) graba id_tarea 0 y tarea_opcional
													// - Si hay AMBAS graba id_tarea y tarea_opcional
													desc_tarea_back = data[0]['tarea_opcional'];

													alert("Se ha guardado Correctamente");
									},
									error: function(data) {

													console.log(data);
									},
									dataType: 'json'
					});
	}

	function setOtBacklog() {
					var progr_back = $('#fecha_progr_back').val();
					var hora_progr_back = $('#hora_progr_back').val();

					var isExecuted = validarHorario(progr_back,hora_progr_back);

					console.log('Excute: '+isExecuted); 

					if(isExecuted){

									$.ajax({
													type: 'POST',
													data: {
																	event_tipo: 1, // evento unico
																	id_sol: id_back,
																	id_tarea: id_de_tar,
																	fecha_progr: progr_back,
																	hora_progr: hora_progr_back,
																	fecha_inicio: fec_sol_back,
																	descripcion: desc_tarea_back,
																	tipo: 4, // backlog
																	ide: id_equi,
																	duracion: duracion
													},
													url: 'index.php/Calendario/guardar_agregar',
													success: function(data) {
													
																	setTimeout("cargarView('Calendario', 'indexot', '" + $('#permission').val() + "');", 0);
																	alert("Se ha guardado Correctamente");
													},
													error: function(result) {
																	console.log(result);
													}
									});
					}else{
									alert('Escoga un nuevo horario o fecha');
					}
	}

	function CancBacklog() {
					id_de_tar = "";
					fec_sol_back = "";
					desc_tarea_back = "";
					id_back = "";
					id_equi = "";
	}
//////////  / BACKLOG ()

//////////  PREDICTIVO ()

	// Variables globales para llenar al enviar
	var tarea_descrip = ""; //id tarea
	var idp = ""; // id predictivo
	var ide = ""; // id equipo
	var fecha_inicio = "";
	var descripTarea = "";

	function fill_Predictivo(dato) {
					$.ajax({
									type: 'POST', //parametros:parametros
									data: {
													id: dato
									},
									url: 'index.php/Calendario/getPredictPorId',
									success: function(data) {

													tarea_descrip = data[0]['tarea_descrip']; // id de tarea
													fecha_inicio = data[0]['fecha'];
													idp = data[0]['predId'];
													ide = data[0]['id_equipo'];
													descripTarea = data[0]['descripcion'];
													alert("Se ha guardado Correctamente");
									},
									error: function(data) {

													console.log(data);
									},
									dataType: 'json'
					});
	}

	// Limpia variables
	function CancPred() {
					tarea_descrip = ""; //id tarea
					idp = ""; // id predictivo
					ide = ""; // id equipo
					fecha_inicio = "";
	}

	////Guarda OT desde Predictivo
	function setOtPredictivo() {

					var progr_pred = $('#fecha_progr_pred').val();
					var hora_pred = $('#hora_progr_pred').val();
					var event_Predic = $('#event_Predictivo').val();
					var cant_meses_predic = $('#cant_meses_predic').val();

					var isExecuted = validarHorario(progr_pred,hora_pred);

					console.log('Excute: '+isExecuted); 

					if(isExecuted){

									$.ajax({
													type: 'POST', //parametros:parametros
													data: {
																	id_sol: idp,
																	id_tarea: tarea_descrip,
																	fecha_progr: progr_pred,
																	hora_progr: hora_pred,
																	fecha_inicio: fecha_inicio,
																	descripcion: descripTarea,
																	tipo: 5, //predictivo
																	ide: ide,
																	event_tipo: event_Predic,
																	cant_meses: cant_meses_predic
													},
													url: 'index.php/Calendario/guardar_agregar', //index.php/
													success: function(data) {

																	setTimeout("cargarView('Calendario', 'indexot', '" + $('#permission').val() + "');", 0);
																	alert("Se ha guardado Correctamente");
													},
													error: function(result) {

																	console.log(result);
													}
									});
					}else{
									alert('Escoga un nuevo horario o fecha');
					}
	}

	//habilita/deshabilita el campo cantidad
	$('#event_Predictivo').change(function() {

					if ($(this).val() == 0) {

									$('#cant_meses_predic').attr('disabled', true);
					} else {
									$('#cant_meses_predic').attr('disabled', false);
					}
	});
//////////  / PREDICTIVO ()

//////////  ACTUALIZA DIA Y HORA

	function updateDia(id_OT, nuevoDia) {

					var resultado = $.ajax({
									type: 'POST', //parametros:parametros
									data: {
													id: id_OT,
													prog: nuevoDia
									},
									url: 'index.php/Calendario/updateDiaProg',
									success: function(data) {

													console.log(data);
									},
									error: function(data) {

													console.log(data);
									},
									dataType: 'json'
					});
					return resultado;
	}

	function updateHora(id_OT, duracion) {

					var resultad = $.ajax({
									type: 'POST',
									data: {
													id: id_OT,
													duracion: duracion
									}, // duracion adicional
									url: 'index.php/Calendario/updateDuracion',
									success: function(data) {
													//alert('sucess');
													console.log(data);
													alert("Se ha guardado Correctamente");
									},
									error: function(data) {

													console.log(data);
									},
									dataType: 'json'
					});

					return resultad;
	}
//////////  / ACTUALIZA DIA Y HORA
</script>
<!-- Guardado de datos y validaciones -->


<!--  MODAL VER OT Y EJECUTAR   -->
<div class="modal bs-example-modal-lg" id="modalInforme" tabindex="-1" role="dialog"
    aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="box">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12 col-md-12" id="modalInformeServicios">


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





<!-- Modal Correctivo-->
<div class="modal fade" id="modal-correctivo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Creación de Orden de Trabajo</h4>
            </div>
            <div class="modal-body">
                <h5>Seleccione la fecha de Programación</h5>
                <div class="col-xs-4 hidden">Tarea:
                    <input type="hidden" id="idTarBonita" name="idTarBonita" class="form-control input-md" />
                </div>
                <div class="col-xs-4">Fecha:
                    <input type="text" id="fecha_progr_correct" name="fecha_progr_correct" class="form-control input-md" />
                </div>
                <div class="col-xs-4">Hora:
                    <input type="time" name="hora_progr_correct" id="hora_progr_correct" class="form-control input-md">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="CancCorrec()">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setOtCorrectivo()">Generar Orden</button>
                <!--
                    <button type="button" id='btontomar' class="btn btn-success" data-dismiss="modal" onclick="tomarTareaTabla()">Tomar Tarea</button>
                    <button type="button" id='btonsoltr' class="btn btn-danger grupNoasignado" data-dismiss="modal" onclick='soltarTareaTabla()'>Soltar tarea</button>
                -->
            </div>
        </div>
    </div>
</div>

<!-- Modal Preventivo-->
<div class="modal fade" id="modal-preventivo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Creación de Orden de Trabajo</h4>
            </div>
            <div class="modal-body">
                <h5>Seleccione la fecha de Programación</h5>
                <div class="col-xs-4">Fecha:
                    <input type="text" id="fecha_progr_prevent" name="fecha_progr_prevent"
                        class="form-control input-md" />
                </div>
                <div class="col-xs-4">Hora:
                    <input type="time" name="hora_prog_prevent" id="hora_prog_prevent" class="form-control input-md">
                </div>
                <br><br>
                <div class="clearfix"></div>
                <h5>Seleccione programación</h5>
                <div class="col-xs-4">Tipo de Evento
                    <select class="form-control input-md" id="event_Preventivo">
                        <option value="1">Unico</option>
                        <option value="2">Mensual</option>
                    </select>
                </div>
                <div class="col-xs-4">Cantidad Meses
                    <input type="text" name="cant_meses_prev" id="cant_meses_prev" class="form-control input-md"
                        disabled="disabled">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"
                    onclick="CancPrevent()">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setOtPreventivo()">Generar
                    Orden</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Preventivo P/ Horas-->
<div class="modal fade" id="modal-preventivoH" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Creación de Orden de Trabajo</h4>
            </div>
            <div class="modal-body">
                <h5>Seleccione la fecha de Programación</h5>
                <div class="col-xs-4">Fecha:
                    <input type="text" id="fecha_progr_prevent_horas" name="fecha_progr_prevent_horas"
                        class="form-control input-md" />
                </div>
                <div class="col-xs-4">Hora:
                    <input type="time" name="hora_progr_prevH" id="hora_progr_prevH" class="form-control input-md">
                </div>

            </div>

            <div class="clearfix"></div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"
                    onclick="CancPrevHoras()">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setOtPrevHoras()">Generar
                    Orden</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Backlog-->
<div class="modal fade" id="modal-backlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Creación de Orden de Trabajo</h4>
            </div>
            <div class="modal-body">

                <h5>Seleccione la fecha de Programación</h5>
                <div class="col-xs-4">Fecha:
                    <input type="text" id="fecha_progr_back" name="fecha_progr_back" class="form-control input-md" />
                </div>
                <div class="col-xs-4">Hora:
                    <input type="time" name="hora_progr_back" id="hora_progr_back" name="hora_progr_back"
                        class="form-control input-md">
                </div>

            </div>
            <div class="clearfix"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"
                    onclick="CancBacklog()">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setOtBacklog()">Generar
                    Orden</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Predictivo-->
<div class="modal fade" id="modal-fecha" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Creación de Orden de Trabajo</h4>
            </div>
            <div class="modal-body">
                <h5>Seleccione la fecha de Programación</h5>
                <div class="col-xs-4">Fecha:
                    <input type="text" id="fecha_progr_pred" name="fecha_progr_pred" class="form-control input-md" />
                </div>
                <div class="col-xs-4">Hora:
                    <input type="time" name="hora_progr_pred" id="hora_progr_pred" class="form-control input-md">
                </div>
                <br><br>
                <div class="clearfix"></div>
                <h5>Seleccione programación</h5>
                <div class="col-xs-4">Tipo de Evento
                    <select class="form-control input-md" id="event_Predictivo">
                        <option value="1">Unico</option>
                        <option value="2">Mensual</option>
                    </select>
                </div>
                <div class="col-xs-4">Cantidad Meses
                    <input type="text" name="cant_meses_predic" id="cant_meses_predic" class="form-control input-md"
                        disabled="disabled">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"
                    onclick="CancPred()">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setOtPredictivo()">Generar
                    Orden</button>
            </div>
        </div>
    </div>
</div>

<?php
	$this->load->view('calendar/filtro');
?>