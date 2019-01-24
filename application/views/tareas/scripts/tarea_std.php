<script>  //Script para Vista Standar
          
    evaluarEstado();    
    function evaluarEstado(){
       
			var asig = $('#asignado').val();       
			// si esta tomada la tarea
			if(asig != ""){
					habilitar();
			}else{
					deshabilitar();
			}
    }      
   
    function habilitar(){       
			// habilito btn y textarea       
			$("#btonsoltr").show();
			$("#hecho").show();       
			$("#guardarComentario").show();        
			$("#comentario").show();
			//desahilito btn tomar      
			$("#btontomar").hide();
			$("#formulario").show();
			$('#acciones_view').show();
    }
    function deshabilitar(){
			// habilito btn tomar
			$("#btontomar").show();
			// habilito btn y textarea  
			$("#btonsoltr").hide();       
			$("#hecho").hide();       
			$("#guardarComentario").hide();
			$("#comentario").hide();
			$("#formulario").hide();
			$('#acciones_view').hide();
    
    }    
    // Volver al atras
    $('#cerrar').click(function cargarVista() {
			WaitingOpen();
			$('#content').empty();
			$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
			WaitingClose();
    });

    /* Funciones BPM */
    //Ckeck Tarea realizada
    $('.btncolor').click(function(e) {
			//var id = <?php //echo $idorden?>; //tomo valor de id_orden
			console.log(id);
			var id_tarea = $(this).parents('tr').find('td').eq(1).html();
			console.log("Estoy finalizando una tarea");
			$.ajax({
					type: 'POST',
					data: {
							id_tarea: id_tarea,
					}, //Id tarea
					url: 'index.php/Taller/TareaRealizada', //index.php/
					success: function(data) {
							console.log(data);
							//alert("Se Finalizando la SUBTAREA");
							refresca(id);
					},
					error: function(result) {
							console.log(result);
							alert("NO se Finalizo la SUBTAREA");
							refresca(id);
					}
			});
    });
               
    function terminarTarea(){
			var ban = true;
			$('.getFormularioTarea').each(function( index ) {
			if($( this ).attr('data-open')=="true"){
					console.log( index + ": " + $( this ).attr('data-validado'));
					ban = ban && ($( this ).attr('data-validado') == "true");
			}
			});
			if(ban==false){alert("Para concluir esta actividad primero debe Validar el Formulario");return;}
			WaitingOpen('Cerrando Tarea');
			var idTarBonita = $('#idTarBonita').val();
			//alert(idTarBonita);
			$.ajax({
					type: 'POST',
					data: {
							'idTarBonita': idTarBonita,
					},
					url: 'index.php/Tarea/terminarTarea',
					success: function(data) {
										WaitingClose();
									// toma a tarea exitosamente
									if(data['reponse_code'] == 204){
											$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
									}
					},
					error: function(data) {
							//alert("Noo");
							console.log(data);
					},
					dataType: 'json'
			}); 
    }            
    // Boton Hecho generico
    function estado() {
			var idTarBonita = $('#idTarBonita').val();
			$.ajax({
					type: 'POST',
					data: {
							'idTarBonita': idTarBonita,
					},
					url: 'index.php/Tarea/estadoCuenta',
					success: function(result) {
							console.log(result);
							//alert("SII");
					},
					error: function(result) {
							alert("Noo");
							console.log(result);
					},
					dataType: 'json'
			});
    }
    //Funcion COMENTARIOS
    function guardarComentario() {
			console.log("Guardar Comentarios...");
			var id= $('#case_id').val();
			var comentario=$('#comentario').val();
            var nombUsr = $('#usrName').val();
            var apellUsr = $('#usrLastName').val();;
			$.ajax({
			type:'POST',
			data:{'processInstanceId':id, 'content':comentario},
			url:'index.php/Tarea/GuardarComentario',
			success:function(result){
				console.log("Submit");
				var lista =  $('#listaComentarios');
				lista.prepend('<hr/><li><h4>'+nombUsr+' '+apellUsr +'<small style="float: right">Hace un momento</small></h4><p>'+comentario+'</p></li>');
				$('#comentario').val('');
			},
			error:function(result){
				console.log("Error");
			}
			});
		}
    // Toma tarea en BPM
    function tomarTarea() {
			var idTarBonita = $('#idTarBonita').val();
			//alert(idTarBonita);
			$.ajax({
					type: 'POST',
					data: {
							idTarBonita: idTarBonita
					},
					url: 'index.php/Tarea/tomarTarea',
					success: function(data) {
									console.log(data['reponse_code']);
									// toma a tarea exitosamente
									if(data['reponse_code'] == 200){
											habilitar();
									}

					},
					error: function(result) {
							console.log(result);
					},
					dataType: 'json'
			});
    }
    // Soltar tarea en BPM
    function soltarTarea() {
			var idTarBonita = $('#idTarBonita').val();
			//alert(idTarBonita);
			$.ajax({
					type: 'POST',
					data: {
							idTarBonita: idTarBonita
					},
					url: 'index.php/Tarea/soltarTarea',
					success: function(data) {
							console.log(data['reponse_code']);
									// toma a tarea exitosamente
									if(data['reponse_code'] == 200){
											deshabilitar();
									}
					},
					error: function(result) {
							console.log(result);
					},
					dataType: 'json'
			});
    }

</script>