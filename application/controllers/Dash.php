<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class dash extends CI_Controller {
	private $items;

	function __construct()
    {
		parent::__construct();
		$this->load->model('Dashs');
		$this->load->model('Groups');
		$this->load->model('Customers');
		$this->load->model('Calendar');
		$this->load->model('Otrabajos');
		$this->load->model('Tareas');
		$this->load->model(ALM.'Pedidos');
		$this->load->model(ALM.'/new/Entregas_Materiales'); 
	}

	/**
	 * Inicializa el Menú: carga la librería y el modelo e inicializa el menu.
	 *
	 * @return	void
	 */
	private function _init_Menu()
	{
		// Ejecuta la consulta y obtiene el arreglo de datos
		$items = $this->Groups->mnuAll();
		//dump_exit($items);
		//agrego los permisos de ejecucion al menu
		$this->items = $this->addPermisosItemsMenu($items);
		//dump_exit($this->items);
		// Carga la librería y pasa el arreglo de datos
		$this->load->library("multi_menu");
		$this->multi_menu->set_items($this->items);
	}

	/**
	 *
	 *
	 */
	private function _trae_empresas() {
		$empresas = $this->Groups->traeEmpresas();
		if($empresas) {
			$enterprisedata[0]['empresas'] = $empresas;
			$this->session->set_userdata('enterprise_data', $enterprisedata);
		}
	}

	public function index()
	{
		$this->_init_Menu();// Inicializa el menu
		$this->_trae_empresas();// trae las empresas del usuario

		$this->load->view('header');
		$userdata       = $this->session->userdata('user_data');
		$enterprisedata = $this->session->userdata('enterprise_data');
		//dump_exit($enterprisedata);

		if( !$userdata )
		{
			redirect( base_url() );
		}
		else
		{
			//dump_exit($userdata);
			$data['usrimag']      = $userdata[0]['usrimag'];
			$data['userName']     = $userdata[0]['usrNick'];
			$data['grpId']        = $userdata[0]['grpId'];
			$data['descEmpresas'] = $userdata[0]['descripcion'];
			$data['empresas']     = $enterprisedata[0]['empresas'];
			//para el dash x defecto segun grupo de usr
			$data['grpDash']    = $this->Groups->grpDash($userdata[0]['grpId']);
			//$data['permission'] = $this->items['seguridad'];
			//Guille inicio datos necesarios Precacheo//
			$ban = true;
			$i=0;
			while($ban && $i< count($this->items) )
			{
				
				if($this->items[$i]['name'] == "Mis Tareas")
				{
					$ban = false;
					break;
				}
				$i++;
			}
			if($i<count($this->items))
			{
				$data['permiso'] = $this->items[$i]['seguridad'];
			}

			if(SW) {
			
			$rsp = $this->bpm->getToDoList();
		
				if(!$rsp['status']){
				return $rsp;
			}
		
			$data['tareas'] = $rsp['data'];
			
			for($i=0;$i<count($data['tareas']); $i++)
			{
				if($data['tareas'][$i]['name'] == "Ejecutar OT") //Solo Cashear Tareas De Ejecutar OT
				{
					$caseId = $data['tareas'][$i]['caseId'];
					$id = $this->Otrabajos->ObtenerOTporCaseId($caseId);
					$data['tareas'][$i]['id_Ot'] = $id;

					$pedidos = $this->Pedidos->xOT($id);
					$data['tareas'][$i]['pedidos'] = $pedidos;
					
					// for($j=0;$j<count($data['tareas'][$i]['pedidos']);$j++)
					// {
					// 	$data['tareas'][$i]['pedidos'][$j]['entregas'] = $this->Entregas_Materiales->getEntregasPedido($data['tareas'][$i]['pedidos'][$j]['id_notaPedido']);
					// }

					//Obtener Formularios de Subtareas
					$subtareas = $this->Tareas->getSubtareas($id);
					$array = [];
					for($j=0;$j<count($subtareas);$j++)
					{
						array_push($array, $subtareas[$j]['info_id']);
					}
					$data['tareas'][$i]['subtareas'] = $array;
				}
			}
		
			$data['tareas'] = json_encode($data['tareas']);

			}
			//Fin datos necesarios Precacheo
			}
			$this->load->view('dash', $data);
			$this->load->view('menu');
			$this->load->view('content');
			$this->load->view('footerdash');
			$this->load->view('footer');
	}


	/**
	 *
	 */
	public function cambiarDeEmpresa()
	{
		$idNewEmpresa = $this->input->post('idNewEmpresa');
		$cambioOk     = $this->Dashs->cambiarDeEmpresa($idNewEmpresa);
		if($cambioOk) {
			//cambio grpId, empresaId y descripcion(empresa) en datos de sesion

			echo json_encode(true);
		}
		else {
			echo json_encode(false);
		}
	}

	/**
	 * agrega los permisos de ejecucion a los items del menu.
	 *
	 * @param 	array 	$items 	Todos los elementos del menu sin permisos.
	 * @return 	array 			Todos los elementos del menu con permisos.
	 */
	public function addPermisosItemsMenu($items)
	{
		$this->items = $items;
		//dump_exit($this->items);
		foreach ($this->items as &$value) {
		
			$fn = $this->Groups->mnuPermisos($value['id'], $value['grpId']);
			$n = 0;
			$permissions = "";
	
			if(!$fn) continue;

			for($i=0; $i<sizeof($fn); $i++) {
				$permissions .= $fn[$i]['actDescription']."-";
			}
			$value['seguridad'] = $permissions;
		}

		return $this->items;
	}
	
    public function calendar()
    {
        $this->load->model('Preventivos');
        $data['list'] = $this->Preventivos->getPreventivosPorHora();
        $data['permission'] = $permission;
        $this->load->view('calendar/calendar', $data);
    }

}
