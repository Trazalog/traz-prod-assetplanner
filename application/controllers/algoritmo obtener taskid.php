
		$case_id = $this->Otrabajos->ObtenerCaseIDxOT($id);
	
		
		// if($case_id == null) {echo 0; 
		// 	return;}
		// 	$res = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar"');
		// if($res == 0)
		// 	$res = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar" 2');
		// echo $res;

	// si es OT generada desde un back(item menu), predvent o predict


// caso que sea desde backlog
		- con id de ot traer tipo e id de solicitud repar 
    
			si el tipo es 4 o 2 (backlog o correctivo)
				- con id sol de repar traer caseid
				- busca taskid (con caseid)
				
				si es 2(urgente)
				// pasa a ejecutar urgente
				$res = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar"');
				- retorna el taskid
				sino (4 no urgente)
					si(tiene soreid) // vino de solicitud servicios
						$res = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar" 2');
					sino(viene del item del menu)
						lanza proceso
						guarda caseid en OT
						con caseid busca taskid
						// pasa a ejecutar (no urgente)
						$res = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar" 2');
						retorna el taskid

			sino el 3 o 5
				lanza proceso
				guarda caseid en OT
				con caseid busca taskid
				// pasa a ejecutar (no urgente)
				$res = $this->bpm->ObtenerTaskidXNombre($case_id,'Esperando cambio estado "a Ejecutar" 2');
				retorna el taskid
