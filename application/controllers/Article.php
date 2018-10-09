<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Article extends CI_Controller {

	function __construct() 
    {
		parent::__construct();
		$this->load->model('Articles');
		//$this->Users->updateSession(true);
	}

	// Muestra listado de articulos
	public function index($permission) // Ok
	{
		$data['list']       = $this->Articles->Articles_List();
		$data['permission'] = $permission;
		$this->load->view('articles/list', $data);
	}
	
	//
	public function getdatosart() // Ok
	{
		$art = $this->Articles->getdatosarts();
		if($art)
		{	
			$arre = array();
	        foreach ($art as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	//
	public function getArticle() // Ok
	{
		$data['data']     = $this->Articles->getArticle($this->input->post());
		$response['html'] = $this->load->view('articles/view_', $data, true);

		echo json_encode($response);
	}

	//
	public function getpencil() // Ok
	{
		$id     = $this->input->post('idartic');
		$result = $this->Articles->getpencil($id);
		print_r(json_encode($result));
	}

	//
	public function editar_art()  // Ok
	{
		$datos  = $this->input->post('data');
		$id     = $this->input->post('ida');
		$result = $this->Articles->update_editar($datos,$id);
		print_r(json_encode($result));	
	}



	





	public function setArticle(){
		$data = $this->Articles->setArticle($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);	
		}
	}




	
	public function getdatosfam(){
		
		$art = $this->Articles->getdatosfams();
		//echo json_encode($Customers);

		if($art)
		{	
			$arre=array();
	        foreach ($art as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function baja_articulo()
	{
		$idarticulo = $_POST['idelim'];
		$datos      = array('artEstado'=>"AN");
		$result     = $this->Articles->update_articulo($datos, $idarticulo);
		print_r($result);
	}





	public function searchByCode() {
		$data = $this->Articles->searchByCode($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	} 

	public function searchByAll() {
		$data = $this->Articles->searchByAll($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	}

	public function getestado()
	{
		$response = $this->Articles->getestados();
      	echo json_encode($response);
	}

}