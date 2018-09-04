<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tarea extends CI_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Tareas');
    }

    public function index($permission)
    {
        $data['list']       = $this->Tareas->Listado_Tareas();
        $data['permission'] = $permission;
        $this->load->view('tarea/list', $data);
    }

    public function Obtener_Tarea(){

        $id     =$_POST['id_tarea'];
        $result = $this->Tareas->Obtener_Tareas($id);
        echo json_encode($result);
    }

    public function Guardar_Tarea(){

        
        $descripcion =$this->input->post('descripcion');
        $data        = array(
            'descripcion' => $descripcion,
            'estado'      => "AC");
        $sql = $this->Tareas->Guardar_Tareas($data);
        echo json_encode($sql);
      }

    public function Modificar_Tarea(){

        $id=$this->input->post('id_tarea');
        $descripcion=$this->input->post('descripcion');
        
        $data = array(
                      'id_tarea' => $id,
                      'descripcion' => $descripcion,
               );
        $sql = $this->Tareas->Modificar_Tareas($data);
        echo json_encode($sql);
      }


    public function Eliminar_Tarea(){
    
        $id=$_POST['id_tarea']; 
        $result = $this->Tareas->Eliminar_Tareas($id);
        echo json_encode($result);
      
    }
  } 

?>