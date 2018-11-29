<?php

defined('BASEPATH') OR exit('No direct script access allowed');

    class Altparametro extends CI_Controller {


        function __construct()
        {
            parent::__construct();
            $this->load->model('Altparametros');
        }


        public function index($permission)
        {
            $data['list'] = $this->Altparametros->Listado_Altparametros();
            $data['permission'] = $permission;
            $this->load->view('altparametros/list', $data);
        }


         public function Obtener_Altparametro(){

            $id=$_POST['paramId'];
            $result = $this->Altparametros->Obtener_Altparametros($id);
            echo json_encode($result);

        }


        public function Guardar_Altparametro(){

            $paramdescrip=$this->input->post('paramdescrip');
            $min=$this->input->post('min');
            $id_empresa=$this->input->post('id_empresa');
            $data = array(
                                'paramdescrip' => $paramdescrip,
                                'min' => $min,
                                'estado' => "AC"
            );
            $sql = $this->Altparametros->Guardar_Altparametros($data);
            echo json_encode($sql);
        }

        
        public function Modificar_Altparametro(){

            $id=$this->input->post('paramId');
            $paramdescrip=$this->input->post('paramdescrip');
            $min=$this->input->post('min');
            $data = array(
                                'paramId' => $id,
                                'min' => $min,
                                'paramdescrip' => $paramdescrip,
                                
                           );
            $sql = $this->Altparametros->Modificar_Altparametros($data);
            echo json_encode($sql);
       }


        public function Eliminar_Altparametro(){
        
            $id=$_POST['paramId'];  
            $result = $this->Altparametros->Eliminar_Altparametros($id);
            echo json_encode($result); 
         }


}   
?>