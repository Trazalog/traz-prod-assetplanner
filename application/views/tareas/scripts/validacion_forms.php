<script> //Validacion de Formulario
	//IniciarValidador("genericForm");
	function IniciarValidador(idForm){
	$('#'+idForm).bootstrapValidator({ //VALIDADOR
			message: 'This value is not valid',
			feedbackIcons: {
				valid: 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
			},
			fields: {		
				fecha:{
					selector: '.fecha',
					validators:{
						date: {
						format: 'DD-MM-YYYY',
						message: '(*) Formato de Fecha Inválido'
					}
					}
				},
				number: {
					selector: '.numerico',
					validators: {
						integer: {
							message: '(*) Solo Valores Numéricos'
						}
					}
				}

			}
		}).on('success.form.bv', function(e) {
				// Prevent form submission
			
				e.preventDefault();
				//guardarFormulario(true);
			
		});
	}

	var validado=false;
	function ValidarCampos(){
			WaitingOpen('Validando Formulario');
			GuardarFormulario(true);
	}

	function CerrarModal(){
			$('.modal').modal('hide');
			WaitingOpen('Guardando Cambios');
			GuardarFormulario(false);
	}
	
	function validarCamposObligatorios(formOt){	

		$.ajax({
				type: 'POST',
				data: {formIdOt:formOt},
				url: 'index.php/Tarea/validarCamposObligatorios',
				success: function (result) {
									var tamaño = result.length;
									if (tamaño > 0) {
										for(var i = 0; i < result.length; i++){		
											var registro = $("*[data-formid = "+result[i]+"]").parents("tr");							
											registro.css('background-color', '#f2c87b');
										}	
										return false;
									} else {
										return true;
									}	
					 
					//WaitingClose();
				},
				error: function(result){
					// alert("Fallo la Validación del formularios en el Servidor. Por favor vuelva a intentar.");
				},
				dataType: 'json'
			});
	}




	// function ValidarObligatorios(validarOn){
	// 	console.log("Validando Campos Obligatorios..."+form_actual_id);
	// 	var petr_id = $('#idPedTrabajo').val();
	// 	var form_id = $('#idform').val();
	// 	$.ajax({
	// 			type: 'POST',
	// 			data: {'form_id':form_id,'petr_id':petr_id},
	// 			url: 'index.php/Tarea/ValidarObligatorios',
	// 			success: function (result) {
	// 				console.log(form_actual_id+"...OK");
	// 				WaitingClose();
	// 				var validado=(result==1);
	// 				form_actual_data.attr('data-validado',validado);
	// 				if(!validarOn){$('.modal').modal('hide');return;}
	// 				if(validado){$('.modal').modal('hide');}
	// 				else {
	// 					alert("Fallo Validación: Campos Obligatorios Incompletos. Por favor verifique que todos los campos obligatorios marcados con (*) esten completos.");
	// 				}
	// 		//WaitingClose();
	// 			},
	// 			error: function(result){
	// 				alert("Fallo la Validación del formularios en el Servidor. Por favor vuelva a intentar.");
	// 			}
	// 		});
	// }
</script>