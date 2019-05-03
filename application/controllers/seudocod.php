
<?php
//Obtener TaskID por OtID
  public function ObtenerTaskIDxOT(){ 	
		
		$id = (int)$this->input->post('ot');	
		$caseId = $this->Otrabajos->getCaseIdOT($id);
		// dump($caseId,  'case en comtroller:');
		// dump_exit($caseId);
		// SI EL PROCESO ESTA LANZADO
		if ($caseId != NULL) {
			# code...
		} else {
			# code...
		}
		
		$this->load->library('BPM');
		$origenOT = $this->Otrabajos->getDatosOrigenOT($id);
		//dump($origenOT, 'origen ot: ');
		$tipo = $origenOT[0]['tipo'];
		//dump($tipo, 'tipo: ');
		$id_solicitud = $origenOT[0]['id_solicitud'];
		//dump($id_solicitud, 'id solicitud; ');
		// si viene de correctivo
		if ($tipo == 2) {		
			$task_id = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar"');
			echo $task_id;
			return;
		} 
		
		// si viene de backlog
		if ($tipo == 4) {
			//busco origen del backlog(tiene sore_id o no)
			$idSolRep = $this->Otrabajos->getIdSolReparacion($id_solicitud);
			//dump($idSolRep, 'sore_id: ');			
			if($idSolRep == NULL){	//viene de item menu
				// lanzar proceso
				$contract = array(
											"idSolicitudServicio"	=>	0,
											"idOT"  => 	$id
										);
				$responce = $this->bpm->LanzarProceso($contract);
				// guardo el caseid en OTrabajo
				if($responce['status']){					
					$case_id = $responce['case_id'];
					$this->Otrabajos->setCaseidenOT($case_id, $id);					
				}				
				//retornaR el taskid
				//dump($task_id, 'task id en controller: ');			
			}else{	// backlog generado desde una SServicios
				
				// con id solicitud busco el case desde solicitud de reparacion
				$case_id = $this->Otrabajos->getCaseIdenSServicios($id_solicitud);
				//dump($case_id, ' id case en controller: ');
				$task_id = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar" 2');
				// guarda case_id en Otrabajo
				//dump($task_id, 'task en 2: ');	// BIEN!				
				$this->Otrabajos->setCaseidenOT($case_id, $id);
				echo $task_id;
				return;			
			}
	}
		// si viene de preventivo y predictivo
		//FIXME: LANZA PROCESO C/VEZ QUE HAGO CLICK EN OT DE CALENDARIO (VALIDAR QUE NO ESTE LANZADO EL PROCESO YA)
		//rr$case_idEnOt = $this->Otrabajos->validarProcesoEnOT($id);
		//dump($id, 'id de ot: ');
		//dump($case_idEnOt, 'case id en OT');

		// hay proceso lanzado con id case guardado en otrabajo
		//rrif ($case_idEnOt != NULL) {
				// lanzar proceso
				$contract = array(
					"idSolicitudServicio"	=>	0,
					"idOT"  => 	$id
				);
				$responce = $this->bpm->LanzarProceso($contract);
				// guardo el caseid en OTrabajo
				if($responce['status']){					
					$case_id = $responce['case_id'];
					$this->Otrabajos->setCaseidenOT($case_id, $id);					
				}
				// retorna task id 		
				//$task_id = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar" 2');
				//echo $task_id;
				return;
//rr
		// } else {
		// 	// retorna task id 		
		// 	$task_id = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar" 2');
		// 	//dump($task_id, 'task en 3:');
		// 	echo $task_id;
		// 	return;
		// }

	}