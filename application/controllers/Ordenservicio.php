<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Ordenservicio extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Ordenservicios');
    }

    public function index($permission)
    {
        $data['permission'] = $permission;
        $data['list']       = $this->Ordenservicios->getOrdServiciosList();
        $this->load->view('ordenservicios/list',$data);
    }

    // public function cargarOrden($permission, $id_ot = null, $id_eq = null, $id_solicitud = null)   // Ok
    // { 
    //   $data['permission'] = $permission;        // permisos 
    //   $data['id_ot']      = $id_ot;            // id de OT. 
    //   $data['id_eq']      = $id_eq;             // id de equipo        
    //   $infoOt = $this->Ordenservicios->getorden($id_ot);
    //   dump($infoOt, 'datos ot');
    //   // si la tareas es opcional
    //   if (($infoOt[0] ["id_tarea"] < 0) || ($infoOt[0] ["id_tarea"] == NULL)) {
    //     $causa = $infoOt[0]["descripcion"];
    //   } else {
    //     $causa = $infoOt[0]["tareadescrip"];
    //   }              
    //   $data['causa'] = $causa; // motivo de la solicitud        
    //   $data['id_solicitudServicio'] = $id_solicitud; // id de orden de servicio. 
    //   $data['id_responsable'] = $infoOt[0]["descripcion"];
    //   $data['nom_responsable'] = $infoOt[0]["responsable"];
    //   $data['idresponsable'] = $infoOt[0]["usrId"];

    //   $this->load->view('ordenservicios/view_',$data);
    // }
 
    public function cargarOrden($id_ot = null, $id_eq = null, $id_solicitud = null, $idTarBonita)   // Ok
    {       
      $data['id_ot']      = $id_ot;            // id de OT. 
      $data['id_eq']      = $id_eq;             // id de equipo        
      $infoOt = $this->Ordenservicios->getorden($id_ot);
      // si la tareas es opcional
      if (($infoOt[0] ["id_tarea"] < 0) || ($infoOt[0] ["id_tarea"] == NULL)) {
        $causa = $infoOt[0]["descripcion"];
      } else {
        $causa = $infoOt[0]["tareadescrip"];
      }              
      $data['causa'] = $causa; // motivo de la solicitud        
      $data['id_solicitudServicio'] = $id_solicitud; // id de orden de servicio. 
      $data['id_responsable'] = $infoOt[0]["descripcion"];
      $data['nom_responsable'] = $infoOt[0]["responsable"];
      $data['idresponsable'] = $infoOt[0]["usrId"];
      $data['idTarBonita'] = $idTarBonita;
      $this->load->view('tareas/view_inf_servicio_modal',$data);
    }  


    public function verInforme($id_ot = null, $id_eq = null, $id_solicitud = null, $idTarBonita)   // Ok
    {           
      $data['id_ot']      = $id_ot;            // id de OT. 
      $data['id_eq']      = $id_eq;             // id de equipo   
      //dump($id_eq, 'ide equipo: ');     
      $infoOt = $this->Ordenservicios->getorden($id_ot);
      // si la tareas es opcional
      if (($infoOt[0] ["id_tarea"] < 0) || ($infoOt[0] ["id_tarea"] == NULL)) {
        $causa = $infoOt[0]["descripcion"];
      } else {
        $causa = $infoOt[0]["tareadescrip"];
      }              
      $data['causa'] = $causa; // motivo de la solicitud        
      $data['id_solicitudServicio'] = $id_solicitud; // id de orden de servicio. 
      $data['id_responsable'] = $infoOt[0]["descripcion"];
      $data['nom_responsable'] = $infoOt[0]["responsable"];
      $data['idresponsable'] = $infoOt[0]["usrId"];
      $data['idTarBonita'] = $idTarBonita;
      $equi['id_equipo']= $id_eq; // duplicado para reutilizar la funcion
      $data['equipos'] = $this->Ordenservicios->getEquipos($equi);
      $data['lecturas'] = $this->Ordenservicios->getLecturasOrden($id_ot);
      $data['tareas'] = $this->Ordenservicios->getTareasOrden($id_ot);
      $data['herramientas'] = $this->Ordenservicios->getHerramOrdenes($id_ot);
      $data['insumos'] = $this->Ordenservicios->getInsumosPorOT($id_ot);
      $data['rrhh'] = $this->Ordenservicios->getOperariosOrden($id_ot);
     // dump($data, 'data: ');
      $this->load->view('tareas/view_inf_servicio_modal',$data);
    } 

    public function getDatosOrdenServicio() // Ok
    {
      $response = $this->Ordenservicios->getDatosOrdenServicios($this->input->post());
      echo json_encode($response);
    }

    public function getEquipo() // Ok
    {
      $response = $this->Ordenservicios->getEquipos($this->input->post());
      echo json_encode($response);
    }
    

    public function getHerramienta() //Ok
    {
      $response = $this->Ordenservicios->getHerramientas($this->input->post());
      echo json_encode($response);
    }

    public function getOperario() // Ok
    {
      $response = $this->Ordenservicios->getOperarios($this->input->post());
      echo json_encode($response);
    }

    public function getRRHHOrdenTrabajo(){
      $response['recursos'] = $this->Ordenservicios->getRRHHOrdenTrabajo($this->input->post('idOT'));
      //$response['responsable'] = $this->Ordenservicios->getResponsableOT($this->input->post('idOT'));
      echo json_encode($response);
    }
    // Guarda Informe de Servicios desde Tarea y Cierra la tarea conffecciona Informe de servicios
    public function setOrdenServ()
    {    
      $datosInfoServicio   = $this->input->post('datosInfoServicio');
      $data['id_solicitudreparacion'] = $datosInfoServicio['id_solicitudreparacion'];
      $data['fecha']                  = $datosInfoServicio['fecha'];
      $data['id_equipo']              = $datosInfoServicio['id_equipo'];
      $data['id_ot']                  = $datosInfoServicio['id_ot'];
      $data['horometro_inicio']       = $datosInfoServicio['horometro_inicio'];
      $data['horometro_fin']          = $datosInfoServicio['horometro_fin'];
      $data['fecha_inicio']           = $datosInfoServicio['fecha_inicio'];
      $data['fecha_fin']              = $datosInfoServicio['fecha_fin'];      
      $data['tarea']       = $this->input->post('tarea');
      $data['herramienta'] = $this->input->post('herramienta');
      $data['operario']    = $this->input->post('operario');

      $idTarBonita = $datosInfoServicio['idTarBonita'];      
      
       $this->load->library('BPM');
       $resp = $this->bpm->CerrarTareaBPM($idTarBonita,$data); 

       if ( json_decode($resp['code']) < 300) {  

          $response = $this->Ordenservicios->setOrdenServicios($data);          
          if ($response) {
            $respuesta['status'] = true;
            $respuesta['msj'] = 'OK';
            $respuesta['code'] = 'Exito';
            echo json_encode($respuesta);
            return;
          } else {
            $respuesta['status'] = false;
            $respuesta['msj'] = 'ERROR';
            $respuesta['code'] = 'ASP_0200, Error ASP_0200: Comunicarse con el Proveedor de Servicio';
            echo json_encode($respuesta);
            return;
          }  

       } else {         
        
          echo json_encode($resp);
          return;
       }     
      
    }
    // devuelve insumos pedidos por id de OT
    public function getInsumosPorOT(){
      $response = $this->Ordenservicios->getInsumosPorOT($this->input->post('id_ot'));      
      echo json_encode($response);
    }
    
    public function getsolicitud(){

      $response = $this->Ordenservicios->getsolicitudes($this->input->post());
      echo json_encode($response);
    }

    public function getSolEquipCausa(){
      $response = $this->Ordenservicios->getSolEquipCausas($this->input->post());
      echo json_encode($response);
    }

    public function getContratista (){
      $response = $this->Ordenservicios->getContratistas($this->input->post());
      echo json_encode($response);
    }

    public function getArticulo (){
      $response = $this->Ordenservicios->getArticulos($this->input->post());
      echo json_encode($response);
    }

    // public function getInsumOrden(){
    //   $response = $this->Ordenservicios->getInsumOrdenes($this->input->post());
    //   echo json_encode($response);
    // }

    public function getLoteActivo(){
      
      $data = $this->input->post();     
      $response = $this->Ordenservicios->getLotesActivos($this->input->post());
      echo json_encode($response);      
    }

    public function getDeposito(){
      $response = $this->Ordenservicios->getDepositos($this->input->post());
      echo json_encode($response);
    }

    public function getHerramOrden(){
      $response = $this->Ordenservicios->getHerramOrdenes($this->input->post());
      echo json_encode($response);
    }

    public function getTarea(){
      $response = $this->Ordenservicios->getTareas($this->input->post());
      echo json_encode($response);
    }

    public function getLecturaOrden(){
      $response = $this->Ordenservicios->getLecturasOrden($this->input->post());
      echo json_encode($response);
    }

    public function getTareaOrden(){
      $response = $this->Ordenservicios->getTareasOrden($this->input->post());
      echo json_encode($response);
    }

    public function getComponente(){

      $response = $this->Ordenservicios->getComponentes($this->input->post());
      if($response){
        $arre['datos'] = $response;
        print_r(json_encode($arre)) ;
      }else{
        echo "sin datos";
      }
    }

    public function getOperarioOrden(){
      $response = $this->Ordenservicios->getOperariosOrden($this->input->post());
      
      echo json_encode($response);
    }

    public function getSolServicioList(){
      $response = $this->Ordenservicios->getSolServiciosList($this->input->post());
      echo json_encode($response);
    }

    public function setEstado(){
      $data = $this->input->post();
      $response = $this->Ordenservicios->setEstados($data);
      echo json_encode($response);  
    }

    /*public function getsolImp(){  

      $id=$_POST['id_orden'];
      $result = $this->Ordenservicios->getsolImps($id);

      if($result){ 
        $arre['datos']=$result; 
        print_r(json_encode($arre));  
      }
      else echo "nada";
      //return json_encode($arre);
    }*/

    public function getsolImp(){  

      $id=$_POST['id_orden'];
      $result = $this->Ordenservicios->getsolImps($id);

      if($result){ 
        
        $arre['datos']=$result;
        $equipos = $this->Ordenservicios->getequiposBycomodato($id);
        
        if($equipos)
        {
          $arre['equipos']=$equipos;
        }
        else $arre['equipos']=0;


        echo json_encode($arre);
      }
      else echo "nada";
  }
  
  
//}
  //       {
  //         $arre['equipos']=$equipos;
  //       }
  //       else $arre['equipos']=0;


  //       echo json_encode($arre);
  //     }
  //     else echo "nada";
  // }
  
  
}