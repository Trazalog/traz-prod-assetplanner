<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Componente extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Componentes');
	}

	public function index($permission)
	{	
		$data['list']       = $this->Componentes->listadoABM();
		$data['permission'] = $permission;
		$this->load->view('componente/listabm', $data);
	}


	// Listo
	public function asigna($permission)
	{	
		$data['list']       = $this->Componentes->componentes_List();
		$data['permission'] = $permission;
		$this->load->view('componente/list', $data);
	}

	//Carga vista agregar relacion comp/equipo
	public function cargarcomp($permission)
	{ 
        $data['permission'] = $permission;          
        $this->load->view('componente/view_', $data);
    }

	// Trae equipos segun empresa logueada - Listo
	public function traerequipo()
	{
		$equipo = $this->Componentes->traerequipo();
		if($equipo)
		{	
			$arre = array();
	        foreach ($equipo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);			
		}
		else echo "nada";
	}

    // Elimina la Asociacion compon/equipo
	public function baja_comp()
	{    
		$idequip = $_POST['idequipo'];
		$idcomp  = $_POST['datos'];		
		$result  = $this->Componentes->delete_asociacion($idequip, $idcomp);
		print_r($result);	
	}

    // Devuelve descripcion de equipo segun id - Listo
	public function getequipo()
	{	
		$id     = $_POST['idequipo'];
		$equipo = $this->Componentes->getequipo($id);
		if($equipo)
		{
			$arre = array();
	        foreach ($equipo as $row )
	        {
	            $arre['datos'] = $row;
	        }
			print_r(json_encode($arre)) ;
		}
		else echo "nada";
	}
		
	// Trae marcas para modal agregar componente - Chequeado
	public function getmarca()
	{
		$marca = $this->Componentes->getmarca();
		if($marca)
		{	
			$arre = array();
	        foreach ($marca as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Trae componentes segun empresa (no equipos)
		// public function getcomponente()
		// {	
		// 	$compo = $this->Componentes->getcomponente();	
		// 	if($compo){	
		// 		$arre = array();
		//         foreach ($compo as $row ) 
		//         {   
		//            $arre[] = $row;
		//         }
		// 		echo json_encode($arre);
		// 	}
		// 	else echo "nada";
		// }

		// Trae sistemas
		// public function getsistema()
		// {	
		// 	$compo = $this->Componentes->getsistema();	
		// 	if($compo){	
		// 		$arre = array();
		//         foreach ($compo as $row ) 
		//         {   
		//            $arre[] = $row;
		//         }
		// 		echo json_encode($arre);
		// 	}
		// 	else echo "nada";
		// }

	// Agrega componente nuevo - Listo
	public function agregar_componente()
	{
		$datos = $_POST['parametros'];
		//print_r($datos);
        if ($datos >0) {
			$descripcion = $datos['descripcion'];
			//$equipId     = $datos['id_equipo'];
			$fechahora   = date("Y-m-d H:i:s");
			$informacion = $datos['informacion'];
			$marca       = $datos['marcaid'];
			$pdf         = $datos['pdf'];
			$insert = array(
				'id_equipo'   => -1 ,
				'descripcion' => $descripcion,
				'informacion' => $informacion,
				'fechahora'   => $fechahora,
				'marcaid'     => $marca
			);
	     	$result = $this->Componentes->agregar_componente($insert);
	     	print_r(json_encode($result));
	     	if ($result){
	     		$ultimoId = $this->db->insert_id(); 
				//print_r($ultimoId);
	     		$path = "assets/files/equipos/".$ultimoId.".pdf"; 
	     		file_put_contents($path,base64_decode($pdf));
				//actualizar path en base de datos
	     		$update = array(
	     			'pdf' => $path
	     		);
	     		$comp = $this->Componentes->updatecomp($ultimoId,$update);
				//print_r($comp);
	     		return $comp;
	     	}
	    }
  	}

  	// Asocia equipo/componente - Listo
	public function guardar_componente()
	{	
		$idequipo = $_POST['idequipo'];
		$compo    = $_POST['comp'];
		$codigo   = $_POST['codigo'];
		$sistema  = $_POST['sistemaid'];
		$ba       = $_POST['x'];
		$ede      = $_POST['ge'];
		$j        = 1;
		
		dump($sistema, 'sist: ');
		
	  for ($i=0; $i < $ba ; $i++)
	  {     
	 	    if($compo[$j])
	 	    {
	        	$datos2 = array(
													'id_equipo'     => $idequipo, 
													'id_componente' => $compo[$j],
													'codigo'        => $codigo[$j],
													'estado'        => 'AC',
													'sistemaid'     => $sistema[$j]
														);	
	        	//print_r($datos2);
						$res = $this->Componentes->insert_componente($datos2);
						
						
	        }
	        $j++;
	    }
		return $res;    
	}

	// Trae componentes segun id de equipo - Listo
  public function getcompo(){
		$id    = $_POST['idequipo']; 
		$compo = $this->Componentes->getcompo($id);
		if($compo!=0)
		{	
			$arre = array();
	        foreach ($compo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		return $compo;
	}


	//llenar modal editar
	public function getEditar(){
		$idComponenteEquipo = $this->input->post('idCompEq');
		$dataCompEq = $this->Componentes->getEditar($idComponenteEquipo);
		$data = array();
        foreach ($dataCompEq[0] as $clave=>$valor ) 
        {   
           $data[$clave] = $valor;
        }
		/*$componentesAsociados = $this->Componentes->getcompo($data['id_equipo']);
		$data2 = array();
        foreach ($componentesAsociados as $clave2=>$valor2 ) 
        {   
           $data2[$clave2] = $valor2;
        }
		$data['componentesAsociados'] = $componentesAsociados;*/
		echo json_encode($data);
	}

	//
	// public function editarCompEq()  // Ok
	// {
	// 	$id     = $this->input->post('idCompEq');
	// 	$datos  = $this->input->post('data');
	// 	$result = $this->Componentes->updateEditar($datos,$id);
	// 	print_r(json_encode($result));	
	// }

	//
	// public function agregarComponente() // 
	// {
	// 	$descripcion   = $this->input->post("descrip1");
	// 	$informacion   = $this->input->post("info");
	// 	$marcaid       = $this->input->post("ma");
	// 	$fechahora     = date("Y-m-d H:i:s");

	// 	// si trae archivo 
	// 	if(isset($_FILES) && $_FILES['pdf']['size'] > 0)
	// 	{
	// 		$config = [
	// 			"overwrite"     => true,
	// 			"upload_path"   => "./assets/files/equipos",
	// 			'allowed_types' => "pdf",
	// 			'file_name'     => "temp"
	// 		];
	// 		$this->load->library("upload",$config);
		
	// 		if ($this->upload->do_upload('pdf')) {

	// 			$datos = array(
	// 				"descripcion" => $descripcion,
	// 				'id_equipo'   => -1 ,
	// 				'fechahora'   => $fechahora,
	// 				"informacion" => $informacion,
	// 				"marcaid"     => $marcaid,           
	// 				"pdf"         => "temp".$this->upload->data('file_ext'),
	// 				"estado"      => "AC"
	// 			);
	// 			if($this->Componentes->agregar_componente($datos) == true)
	// 			{
	// 				$ultimoId = $this->db->insert_id();
	// 				$path = "assets/files/equipos/comp".$ultimoId.".pdf"; 
	// 	     		file_put_contents($path, file_get_contents($_FILES["pdf"]["tmp_name"]) );
	// 				//actualizar path en base de datos
	// 	     		$update = array(
	// 	     			'pdf' => "comp".$ultimoId.".pdf"
	// 	     		);
	// 	     		$comp = $this->Componentes->updatecomp($ultimoId,$update);
	// 				echo json_encode(true);
	// 			}
	// 			else
	// 			{
	// 				echo json_encode(false);
	// 			}
	// 		}
	// 		else
	// 		{
	// 			echo json_encode(false);
	// 		}

	// 	}
	// 	else
	// 	{
	// 		$datos = array(
	// 			"descripcion" => $descripcion,
	// 			'id_equipo'   => -1 ,
	// 			'fechahora'   => $fechahora,
	// 			"informacion" => $informacion,
	// 			"marcaid"     => $marcaid,           
	// 			"estado"      => "AC"
	// 		);
	// 		if($this->Componentes->agregar_componente($datos) == true)
	// 		{
	// 			echo json_encode(true);
	// 		}
	// 		else
	// 		{
	// 			echo json_encode(false);
	// 		}
	// 	}
	// }

	//
	// public function bajaComponente() // Ok
	// {
	// 	$id     = $this->input->post('idComponente');
	// 	$result = $this->Componentes->BajaComponente($id);
	// 	echo json_encode($result);	
	// }

	//
	// public function editarComponente() // Ok
	// {
	// 	//dump( $this->input->post() );
	// 	//dump( $_FILES );
	// 	$id_componente = $this->input->post("idComponenteE");
	// 	$descripcion   = $this->input->post("descripcionE");
	// 	$informacion   = $this->input->post("informacionE");
	// 	$marcaid       = $this->input->post("marcaE");
		
	// 	// si trae archivo 
	// 	if(isset($_FILES) && $_FILES['pdfE']['size'] > 0){
	// 		dump("trae file");
	// 		$config = [
	// 			"overwrite"     => true,
	// 			"upload_path"   => "./assets/files/equipos",
	// 			'allowed_types' => "pdf",
	// 			'file_name'     => "comp".$id_componente
	// 		];
	// 		$this->load->library("upload",$config);
		
	// 		if ($this->upload->do_upload('pdfE')) {
	// 			$datos = array(
	// 				"descripcion" => $descripcion,
	// 				"informacion" => $informacion,
	// 				"marcaid"     => $marcaid,           
	// 				"pdf"         => "comp".$id_componente.$this->upload->data('file_ext')
	// 			);
	// 			if($this->Componentes->editarComponente($datos,$id_componente) == true)
	// 			{
	// 				echo json_encode(true);
	// 			}
	// 			else
	// 			{
	// 				echo json_encode(false);
	// 			}
	// 		}
	// 		else
	// 		{
	// 			echo json_encode(false);
	// 		}
   
	// 	}
	// 	else // update sin pdf
	// 	{
	// 		$datos = array(
	// 			"descripcion" => $descripcion,
	// 			"informacion" => $informacion,
	// 			"marcaid"     => $marcaid
	// 		);
	// 		if($this->Componentes->editarComponente($datos,$id_componente) == true)
	// 		{
	// 			echo json_encode(true);
	// 		}
	// 		else
	// 		{
	// 			echo json_encode(false);
	// 		}
	// 	}
	// }

	public function getcomponente(){	
		$compo = $this->Componentes->getcomponente();	

		//dump($compo, 'cmpnentes:');
		// if($compo){	
		// 	$arre = array();
	  //       foreach ($compo as $row ) 
	  //       {   
	  //          $arre[] = $row;
	  //       }
		// 	echo json_encode($arre);
		// }
		// else echo "nada";
		echo json_encode($compo);
	}

	// Trae sistemas
	public function getsistema()
	{	
		$compo = $this->Componentes->getsistema();	
		if($compo){	
			$arre = array();
	        foreach ($compo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Agrega componente nuevo - Listo
	// public function agregar_componente()
	// {
	// 	$datos = $_POST['parametros'];
	// 	//print_r($datos);
  //   if ($datos >0) {
	// 		$descripcion = $datos['descripcion'];
	// 		//$equipId     = $datos['id_equipo'];
	// 		$fechahora   = date("Y-m-d H:i:s");
	// 		$informacion = $datos['informacion'];
	// 		$marca       = $datos['marcaid'];
	// 		$pdf         = $datos['pdf'];
	// 		$insert = array(
	// 			'id_equipo'   => -1 ,
	// 			'descripcion' => $descripcion,
	// 			'informacion' => $informacion,
	// 			'fechahora'   => $fechahora,
	// 			'marcaid'     => $marca
	// 		);
	//      	$result = $this->Componentes->agregar_componente($insert);
	//      	print_r(json_encode($result));
	//      	if ($result){
	//      		$ultimoId = $this->db->insert_id(); 
	// 			//print_r($ultimoId);
	//      		$path = "assets/files/equipos/".$ultimoId.".pdf"; 
	//      		file_put_contents($path,base64_decode($pdf));
	// 			//actualizar path en base de datos
	//      		$update = array(
	//      			'pdf' => $path
	//      		);
	//      		$comp = $this->Componentes->updatecomp($ultimoId,$update);
	// 			//print_r($comp);
	//      		return $comp;
	//      	}
	//     }
  // 	}

  	// Asocia equipo/componente - Listo
	// public function guardar_componente()
	// {	
	// 	$idequipo = $_POST['idequipo'];
	// 	$compo    = $_POST['comp'];
	// 	$codigo   = $_POST['codigo'];
	// 	$sistema  = $_POST['sistemaid'];
	// 	$ba       = $_POST['x'];
	// 	$ede      = $_POST['ge'];
	// 	$j        = 1;	
	//     for ($i=0; $i < $ba ; $i++)
	//     {     
	//  	    if($compo[$j])
	//  	    {
	//         	$datos2 = array(
	// 				'id_equipo'     => $idequipo, 
	// 				'id_componente' => $compo[$j],
	// 				'codigo'        => $codigo[$j],
	// 				'estado'        => 'AC',
	// 				'sistemaid'     => $sistema[$j]
	//         	);	
	//         	//print_r($datos2);
	//         	$res = $this->Componentes->insert_componente($datos2);	     
	//         }
	//         $j++;
	//     }
	// 	return $res;       
	// }

	// Trae componentes segun id de equipo - Listo
  // 	public function getcompo()
  // 	{
	// 	$id    = $_POST['idequipo']; 
	// 	$compo = $this->Componentes->getcompo($id);
	// 	if($compo!=0)
	// 	{	
	// 		$arre = array();
	//         foreach ($compo as $row ) 
	//         {   
	//            $arre[] = $row;
	//         }
	// 		echo json_encode($arre);
	// 	}
	// 	return $compo;
	// }


	//llenar modal editar
	// public function getEditar()
	// {
	// 	$idComponenteEquipo = $this->input->post('idCompEq');
	// 	$dataCompEq = $this->Componentes->getEditar($idComponenteEquipo);
	// 	$data = array();
  //       foreach ($dataCompEq[0] as $clave=>$valor ) 
  //       {   
  //          $data[$clave] = $valor;
  //       }
	// 	/*$componentesAsociados = $this->Componentes->getcompo($data['id_equipo']);
	// 	$data2 = array();
  //       foreach ($componentesAsociados as $clave2=>$valor2 ) 
  //       {   
  //          $data2[$clave2] = $valor2;
  //       }
	// 	$data['componentesAsociados'] = $componentesAsociados;*/
	// 	echo json_encode($data);
	// }

	//
	public function editarCompEq()  // Ok
	{
		$id     = $this->input->post('idCompEq');
		$datos  = $this->input->post('data');
		$result = $this->Componentes->updateEditar($datos,$id);
		print_r(json_encode($result));	
	}

	//
	public function agregarComponente() // 
	{
		$descripcion   = $this->input->post("descrip1");
		$informacion   = $this->input->post("info");
		$marcaid       = $this->input->post("ma");
		$fechahora     = date("Y-m-d H:i:s");

		// si trae archivo 
		if(isset($_FILES) && $_FILES['pdf']['size'] > 0)
		{
			$config = [
				"overwrite"     => true,
				"upload_path"   => "./assets/files/equipos",
				'allowed_types' => "pdf",
				'file_name'     => "temp"
			];
			$this->load->library("upload",$config);
		
			if ($this->upload->do_upload('pdf')) {

				$datos = array(
					"descripcion" => $descripcion,
					'id_equipo'   => -1 ,
					'fechahora'   => $fechahora,
					"informacion" => $informacion,
					"marcaid"     => $marcaid,           
					"pdf"         => "temp".$this->upload->data('file_ext'),
					"estado"      => "AC"
				);
				if($this->Componentes->agregar_componente($datos) == true)
				{
					$ultimoId = $this->db->insert_id();
					$path = "assets/files/equipos/comp".$ultimoId.".pdf"; 
		     		file_put_contents($path, file_get_contents($_FILES["pdf"]["tmp_name"]) );
					//actualizar path en base de datos
		     		$update = array(
		     			'pdf' => "comp".$ultimoId.".pdf"
		     		);
		     		$comp = $this->Componentes->updatecomp($ultimoId,$update);
					echo json_encode(true);
				}
				else
				{
					echo json_encode(false);
				}
			}
			else
			{
				echo json_encode(false);
			}

		}
		else
		{
			$datos = array(
				"descripcion" => $descripcion,
				'id_equipo'   => -1 ,
				'fechahora'   => $fechahora,
				"informacion" => $informacion,
				"marcaid"     => $marcaid,           
				"estado"      => "AC"
			);
			if($this->Componentes->agregar_componente($datos) == true)
			{
				echo json_encode(true);
			}
			else
			{
				echo json_encode(false);
			}
		}
	}

	//
	public function bajaComponente() // Ok
	{
		$id     = $this->input->post('idComponente');
		$result = $this->Componentes->BajaComponente($id);
		echo json_encode($result);	
	}

	//
	public function editarComponente() // Ok
	{
		//dump( $this->input->post() );
		//dump( $_FILES );
		$id_componente = $this->input->post("idComponenteE");
		$descripcion   = $this->input->post("descripcionE");
		$informacion   = $this->input->post("informacionE");
		$marcaid       = $this->input->post("marcaE");
		
		// si trae archivo 
		if(isset($_FILES) && $_FILES['pdfE']['size'] > 0){
			dump("trae file");
			$config = [
				"overwrite"     => true,
				"upload_path"   => "./assets/files/equipos",
				'allowed_types' => "pdf",
				'file_name'     => "comp".$id_componente
			];
			$this->load->library("upload",$config);
		
			if ($this->upload->do_upload('pdfE')) {
				$datos = array(
					"descripcion" => $descripcion,
					"informacion" => $informacion,
					"marcaid"     => $marcaid,           
					"pdf"         => "comp".$id_componente.$this->upload->data('file_ext')
				);
				if($this->Componentes->editarComponente($datos,$id_componente) == true)
				{
					echo json_encode(true);
				}
				else
				{
					echo json_encode(false);
				}
			}
			else
			{
				echo json_encode(false);
			}
   
		}
		else // update sin pdf
		{
			$datos = array(
				"descripcion" => $descripcion,
				"informacion" => $informacion,
				"marcaid"     => $marcaid
			);
			if($this->Componentes->editarComponente($datos,$id_componente) == true)
			{
				echo json_encode(true);
			}
			else
			{
				echo json_encode(false);
			}
		}
	}
}
