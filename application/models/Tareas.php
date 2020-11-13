<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Tareas extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(FRM . 'Forms');
    }
/* TAREAS ASSET ORIGINALES (TAREAS ESTANDAR)*/
    public function Listado_Tareas()
    {
        $userdata = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->where('estado', 'AC');
        $this->db->where('tareas.id_empresa', $empresaId);
        $query = $this->db->get('tareas');
        if ($query->num_rows() != 0) {
            return $query->result_array();
        }
    }

    public function Obtener_Tareas($id)
    {
        $this->db->where('id_tarea', $id);
        $query = $this->db->get('tareas');
        if ($query->num_rows() != 0) {
            return $query->result_array();
        }
    }

    public function Guardar_Tareas($data)
    {
        $userdata = $this->session->userdata('user_data');
        $data['id_empresa'] = $userdata[0]['id_empresa'];
        $query = $this->db->insert("tareas", $data);
        return $query;
    }

    public function Guardar_SubTareas($data)
    {
        //$userdata           = $this->session->userdata('user_data');
        //$data['id_empresa'] = $userdata[0]['id_empresa'];
        $query = $this->db->insert_batch('tbl_listarea', $data);
        return $query;
    }

    public function Modificar_Tareas($data)
    {
        $userdata = $this->session->userdata('user_data');
        $data['id_empresa'] = $userdata[0]['id_empresa'];
        $query = $this->db->update('tareas', $data, array('id_tarea' => $data['id_tarea']));
        return $query;
    }

    public function Eliminar_Tareas($id)
    {
        $this->db->set('estado', 'AN');
        $this->db->where('id_tarea', $id);
        $query = $this->db->update('tareas');
        return $query;
    }

/* ./ TAREAS ASSET ORIGINALES (TAREAS ESTANDAR)*/

/* INTEGRACION CON BPM */

/*********** funciones nuevas de asset */
    //devuelve array con subtareas
    public function getSubtareaseEstandar($nomTarea)
    {

        $idTarea = $this->getIdTareaSTD($nomTarea);
        $subtareas = array();

        if ($idTarea != 0) {
            $subtareas = $this->getSubtareas($idTarea);
            return $subtareas;
        } else {
            return $subtareas;
        }
    }
    // devuelve id de tarea estandar por nombre
    public function getIdTareaSTD($id_OT)
    {

        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('tareas.id_tarea,
											tareas.descripcion,
											tareas.id_empresa');
        $this->db->from('tareas');
        $this->db->join('orden_trabajo', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('orden_trabajo.id_orden', $id_OT);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return 0;
        }
    }
    // devuelve subtareas por
    public function getSubtareas($ot)
    {
        $this->db->select('tbl_listarea.*,
												asp_subtareas.tareadescrip AS subtareadescrip,
												asp_subtareas.id_subtarea,
												asp_subtareas.duracion_prog,
												asp_subtareas.form_asoc');
        $this->db->from('tbl_listarea');
        $this->db->join('asp_subtareas', 'asp_subtareas.id_subtarea = tbl_listarea.id_subtarea', 'left');
        $this->db->where('tbl_listarea.id_orden', $ot);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    public function ObtenerSubtareas($tarea_std)
    {
        $this->db->where('id_tarea', $tarea_std);
        return $this->db->get('asp_subtareas')->result_array();
    }
    // Cambia estado a Terminado o Curso de subtareas
    public function cambiarEstadoSubtask($idlistarea, $estado)
    {
        $dato = array('estado' => $estado);
        $this->db->where('tbl_listarea.id_listarea', $idlistarea);
        $response = $this->db->update('tbl_listarea', $dato);
        return $response;
    }
    // Cierra Tareas estandar en BPM
    public function terminarTareaStandarenBPM($idTarBonita, $param)
    {

        $method = '/execution';
        $resource = 'API/bpm/userTask/';
        $url = BONITA_URL . $resource . $idTarBonita . $method;
        //$url = BONITA_URL.$resource.$usrId.$method;
        file_get_contents($url, false, $param);
        $response = $this->parseHeaders($http_response_header);
        return $response;
    }

    // genera una entrada en el historial de lectura con la ultima lectura generada en el informe de servicio
    public function setUltimaLecturaIS($data)
    {
        $id_equipo = $data["id_equipo"];
        $lectura = $data["lectura"];
        $fecha = $data["fecha"];
        $usrid = $data["usrId"];
        $observacion = $data["observacion"];
        $operario_nom = $data["operario_nom"];
        $turno = $data["turno"];
        $estado = $data["estado"];

        $sql = "INSERT INTO historial_lecturas(id_equipo,lectura,fecha,usrId,observacion,operario_nom,turno,estado)
            VALUES('" . $id_equipo . "','" . $lectura . "','" . $fecha . "','" . $usrid . "','" . $observacion . "','" . $operario_nom . "','" . $turno . "','" . $estado . "')
            ";

        $query = $this->db->query($sql);

        return $query;
    }

    // trae tareas por ID de usuario
    public function getTareas($param)
    {

        $userdata = $this->session->userdata('user_data');
        $userBpm = $userdata[0]['userBpm']; // guarda usuario logueado en BPM

        //$tareas = file_get_contents(BONITA_URL.'API/bpm/humanTask?p=0&c=10&f=user_id%3D5', false, $param);
        $resource = 'API/bpm/humanTask?p=0&c=1000&f=user_id%3D';
        $url = BONITA_URL . $resource . $userBpm;
        $tareas = file_get_contents($url, false, $param);

        $tar = json_decode($tareas, true);

        return $tar;
    }
    // agrega datos de pedido de trabajo desde la base local
    public function AgregarDatos($tareas)
    {

        $tar = json_decode($tareas, true);
        foreach ($tar as $key => $value) {

            $caseId = $tar[$key]["caseId"];
            $datos = $this->getDatPedidoTrabajo($caseId);
            $tar[$key]['petr_id'] = $datos[0]['petr_id'];
            $tar[$key]['cod_interno'] = $datos[0]['cod_interno'];
        }
        return $tar;
    }
    //devuelve datos de tarea por nombre
    public function getDatosTarea($nombre)
    {
        $this->db->where('descripcion', $nombre);
        return $this->db->get('tareas')->result_array()[0];
    }
    // Devuelve el id de tareas de trazaj correspond al id_tarea bonita para detatareas
    // function getIdTareaTraJobs($idBonita,$param){

    //     $urlResource = 'API/bpm/activityVariable/';
    //     $idListEnBPM = '/trazajobsTaskId';

    //     try {
    //         $idTJ = @file_get_contents(BONITA_URL.$urlResource.$idBonita.$idListEnBPM , false, $param);
    //         $idTJobs = json_decode($idTJ,true); //sin true no se puede acceder
    //         $id_listarea = $idTJobs["value"];
    //     } catch (Exception $e) {
    //         echo 'Excepción capturada: ',  $e->getMessage(), "\n";
    //         $id_listarea = 0;
    //     }

    //     return $id_listarea;
    // }
    // Trae los datos de la tarea desde BPM
    public function getDatosBPM($idTarBonita, $param)
    {

        $urlResource = BONITA_URL . 'API/bpm/humanTask/';
        $data = file_get_contents($urlResource . $idTarBonita, false, $param);
        return $data;
    }
    // Devuelve id de OT por id de BPM
    public function getIdOtPorIdBPM($idTarBonita)
    {

        $this->db->select('orden_trabajo.id_orden');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.bpm_task_id_plan', $idTarBonita);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row('id_orden');
        } else {
            return 0;
        }
    }
    //devuelve el id de tarea estandar asociada a listarea
    public function getTarea_idListarea($id_listarea)
    {

        $this->db->select('tbl_listarea.id_tarea');
        $this->db->from('tbl_listarea');
        $this->db->where('tbl_listarea.id_listarea', $id_listarea);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row('id_tarea');
        } else {
            return false;
        }
    }
    // devuelve id de equipo por id Sol Servicios
    public function getIdEquipoPorIdSolServ($id_SS)
    {

        $this->db->select('solicitud_reparacion.id_equipo');
        $this->db->from('solicitud_reparacion');
        $this->db->where('solicitud_reparacion.id_solicitud', $id_SS);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row('id_equipo');
        } else {
            return false;
        }
    }
    // devuelve id de equipo por id OT
    public function getIdEquipoPorIdOT($id_OT)
    {

        $this->db->select('orden_trabajo.id_equipo');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_orden', $id_OT);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row('id_equipo');
        } else {
            return false;
        }
    }
    // Verifica si la tarea fue guardada la fecha de inicio
    public function confInicioTareas($id_OT)
    {
        $this->db->select('orden_trabajo.fecha_inicio');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_orden', $id_OT);
        $query = $this->db->get();
        $row = $query->row('fecha_inicio');
        return $row;
    }
    // marca inicio de Tarea en OT
    public function inicioTareas($id_OT)
    {
        $fechaInicio = date("Y-m-d H:i:s");
        $estado = 'C';
        $this->db->where('id_orden', $id_OT);
        $result = $this->db->update('orden_trabajo', array('fecha_inicio' => $fechaInicio));
        return $result;
    }

    //actualiza latitud y longitud de la OT
    public function actualizarLatLng($lati, $long, $id_OT)
    {
        $this->db->where('id_orden', $id_OT);
        $result = $this->db->update('orden_trabajo', array('latitud' => $lati, 'longitud' => $long));
        return $result;
    }

    // marca fin de Tarea en OT
    public function finTareas($id_OT)
    {
        $fechaFin = date("Y-m-d H:i:s");
        $estado = 'T';
        $this->db->where('id_orden', $id_OT);
        $result = $this->db->update('orden_trabajo', array('fecha_terminada' => $fechaFin, 'estado' => $estado));
        return $result;
    }

    // cambia de estado la Tareas(SServ, Prevent, Predic, Back y OT)
    public function cambiarEstado($id_solicitud, $estado, $tipo)
    {

        if ($tipo == 'correctivo') {
            $this->db->set('estado', $estado);
            $this->db->where('id_solicitud', $id_solicitud);
            $response = $this->db->update('solicitud_reparacion');
        }

        if ($tipo == 'preventivo') {
            $this->db->set('estadoprev', $estado);
            $this->db->where('prevId', $id_solicitud);
            $response = $this->db->update('preventivo');
        }

        if ($tipo == 'backlog') {
            $this->db->set('estado', $estado);
            $this->db->where('backId', $id_solicitud);
            $response = $this->db->update('tbl_back');
        }

        if ($tipo == 'predictivo') {
            $this->db->set('estado', $estado);
            $this->db->where('predId', $id_solicitud);
            $response = $this->db->update('predictivo');
        }

        if ($tipo == 'OT') {
            $this->db->set('estado', $estado);
            $this->db->where('id_orden', $id_solicitud);
            return $this->db->update('orden_trabajo');
        }

        if ($tipo == 'informe servicios') {
            $this->db->set('estado', $estado);
            $this->db->where('id_ot', $id_solicitud);
            return $this->db->update('orden_servicio');
        }

        return $response;
    }

    //devuelve valores de todos los datos de la OT para mostrar en modal.
    public function getOrigenOt($idot)
    {
        $this->db->select('orden_trabajo.tipo, orden_trabajo.id_solicitud');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_orden', $idot);

        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }
    // devueve sore_id por id de backlog
    public function getSoreIdporBackId($id_solicitud)
    {
        $this->db->select('tbl_back.sore_id');
        $this->db->from('tbl_back');
        $this->db->where('tbl_back.backId', $id_solicitud);
        $query = $this->db->get();
        return $query->row('sore_id');
    }

    /*FORMULARIOS */
    // Devuelve form asociado a una tarea std
    public function getIdFormPorIdTareaSTD($idTareaStd)
    {

        $this->db->select('tareas.form_asoc');
        $this->db->from('tareas');
        $this->db->where('tareas.id_tarea', $idTareaStd);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row('form_asoc');
        } else {
            return 0;
        }
    }
    // Comprueba si hay form guardado asoc a id de orden y de tarea
    public function getEstadoForm($bpm_task_id, $idForm)
    {

        $this->db->select('frm_formularios_completados.LITA_ID');
        $this->db->from('frm_formularios_completados');
        $this->db->where('frm_formularios_completados.LITA_ID', $bpm_task_id);
        $this->db->where('frm_formularios_completados.FORM_ID', $idForm);
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    // Guarda la configuracion inicial del formulario
    public function setFormInicial($bpm_task_id, $idFormAsoc, $ot_id)
    { //$id_listarea){

        $userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId']; // guarda usuario logueado
        $empId = $userdata[0]['id_empresa'];
        $i = 1;
        $dat = array();
        //    instancia form y devuelve id  para relacionar form con OT
        //    en form_completados(desp se toca frm_instanciasform)
        $idInstanciaForm = $this->instanciarForm($ot_id);

        // Trae la info del form sin valores validos desp se actualiza al guardar
        $form = $this->getFormInicial($idFormAsoc);

        // Agrego id de usuario y demas datos al array para insertar
        foreach ($form as $key) {
            $key['USUARIO'] = $usrId;
            $key['LITA_ID'] = $bpm_task_id; //$id_listarea;
            $key['INFO_ID'] = $idInstanciaForm; //
            $key['ORDEN'] = $i;
            $key['ID_EMPRESA'] = $empId; // guarda id de empresa logueada
            $i++;
            $dat[$i] = $key;
        }

        $response = $this->db->insert_batch('frm_formularios_completados', $dat);

        return $idInstanciaForm;
    }

    // Trae configuracion de form inicial para guardar en frm_frm_completados
    public function getFormInicial($idFormAsoc)
    {

        ////  ID DE EMPRESA PARA CLOUD
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $sql = "SELECT
					form.form_id AS FORM_ID,
					form.nombre AS FORM_NOMBRE,
					form.fec_creacion AS FEC_CREACION,
					cate.NOMBRE AS CATE_NOMBRE,
					grup.NOMBRE AS GRUP_NOMBRE,
					tida.NOMBRE AS TIDA_NOMBRE,
					valo.NOMBRE AS VALO_NOMBRE,
					valo.ORDEN
					FROM
					frm_formularios form,
					frm_categorias cate,
					frm_grupos grup ,
					frm_tipos_dato tida,
					frm_valores valo
					where FORM.FORM_ID = CATE.FORM_ID
					AND CATE.CATE_ID = GRUP.CATE_ID
					AND GRUP.GRUP_ID = VALO.GRUP_ID
					AND TIDA.TIDA_ID = VALO.TIDA_ID
					AND FORM.FORM_ID = $idFormAsoc
					ORDER BY cate.ORDEN,grup.ORDEN,valo.ORDEN
					AND FORM.ID_EMPRESA = $empId";

        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    // instancia el form inicial relacionandolo con la OT
    public function instanciarForm($ot_id)
    {

        $data['ortra_id'] = $ot_id;
        $this->db->insert('frm_instancias_formulario', $data);
        return $idInstanciaForm = $this->db->insert_id();
    }

    // trae instancias de form guardado por id de OT
    public function getInstaciasForm($id_OT)
    {

        $this->db->select('frm_instancias_formulario.*');
        $this->db->from('frm_instancias_formulario');
        $this->db->where('ortra_id', $id_OT);
        $query = $this->db->get();
        $i = 0;
        foreach ($query->result() as $row) {
            $inst[$i] = $row->info_id;
            $i++;
        }
        return $inst;
    }
    // Trae form para dibujar pantalla (agregar where de id de form)
    public function get_form($infoId)
    {
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $sql = "SELECT foco.FOCO_ID AS idValor,
						foco.FORM_ID,
						foco.FORM_NOMBRE,
						'' AS habilitado,
						foco.FEC_CREACION,
						foco.CATE_NOMBRE AS nomCategoria,
						'' AS idCategoria,
						foco.GRUP_NOMBRE AS nomGrupo,
						foco.TIDA_NOMBRE AS nomTipoDatos,
						'' AS idGrupo,
						foco.VALO_NOMBRE AS nomValor,
						foco.TIDA_ID,
						foco.VALOR AS valDefecto,
						'' AS LONGITUD,
						'' AS PISTA,
						foco.VALO_ID,
						foco.OBLIGATORIO as obligatorio,
						foco.ORDEN
						FROM
						frm_formularios_completados foco
						WHERE foco.INFO_ID = $infoId
						AND foco.ID_EMPRESA = $empId
						ORDER BY foco.ORDEN";

        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function validarCamposObligatorios($idForm, $idOT)
    {

        $this->db->select('count(*) > 0 AS result');
        $this->db->from('frm_formularios_completados');
        $this->db->join('frm_instancias_formulario', 'frm_instancias_formulario.info_id = 																				frm_formularios_completados.INFO_ID');
        $this->db->where('frm_instancias_formulario.ortra_id', $idOT);
        $this->db->where('FORM_ID', $idForm);
        $this->db->where('frm_formularios_completados.OBLIGATORIO', true);
        $this->db->where('frm_formularios_completados.VALIDADO', false);
        $query = $this->db->get();
        return $query->row('result');
    }

    // Arma array p/ insertar en frm_formularios_completados por focoId
    public function getDatos($focoId)
    {
        //dump($focoId, 'en getdatos: ');
        $this->db->select('frm_formularios_completados.*');
        $this->db->from('frm_formularios_completados');
        $this->db->where('frm_formularios_completados.FOCO_ID', $focoId);
        $query = $this->db->get();

        foreach ($query->result_array() as $row) {
            $response['FORM_ID'] = $row['FORM_ID'];
            $response['FORM_NOMBRE'] = $row['FORM_NOMBRE'];
            $response['CATE_NOMBRE'] = $row['CATE_NOMBRE'];
            $response['GRUP_NOMBRE'] = $row['GRUP_NOMBRE'];
            $response['VALO_NOMBRE'] = $row['VALO_NOMBRE'];
            $response['TIDA_NOMBRE'] = $row['TIDA_NOMBRE'];
            $response['VALOR'] = $row['VALOR'];
        }

        return $response;
    }
    // Inserta datos de Form en frm_formularios_completados
    public function UpdateForm($datos, $key)
    {
        //dump($datos, 'datos de form: ');
        $this->db->where('FOCO_ID', $key);
        $response = $this->db->update('frm_formularios_completados', $datos);
        return $response;
    }
    /*    ./ FORMULARIOS */

    // devuelve detalle de tareas para notificacion standart a partir de id_listarea
    public function detaTareas($id_listarea)
    {

        $this->db->select('tbl_listarea.id_listarea,
							tbl_listarea.id_orden,
							tareas.duracion_std,
							tbl_listarea.tareadescrip,
							tbl_listarea.id_tarea,
							tbl_listarea.id_usuario,
							tbl_listarea.estado,
							tbl_listarea.fecha');
        $this->db->from('tbl_listarea');
        $this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');
        $this->db->where('tbl_listarea.id_listarea', $id_listarea);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    // devuelve id tarea y form asociado por nomb de tarea BPM
    public function getidFormTareaBPM($nomtarea)
    {

        $this->db->select('tareas.id_tarea,
							tareas.form_asoc');
        $this->db->from('tareas');
        $this->db->where('tareas.descripcion', $nomtarea);
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }
    //obtener Comentarios
    public function ObtenerComentariosBPM($caseId, $param)
    {
        $processInstance = 'processInstanceId%3D' . $caseId;
        $comentarios = file_get_contents(BONITA_URL . 'API/bpm/comment?f=' . $processInstance . '&o=postDate%20DESC&p=0&c=200&d=userId', false, $param);
        return json_decode($comentarios, true);
    }

    /* TAREAS BPM */
    // Tomar Tareas
    public function tomarTarea($idTarBonita, $param)
    {

        try {
            $resource = 'API/bpm/humanTask/';
            $url = BONITA_URL . $resource . $idTarBonita;

            file_get_contents($url, false, $param);
            $response = $this->parseHeaders($http_response_header);

            return $response;
        } catch (Exception $e) {
            var_dump($e->getMessage());
        }
    }
    // Soltar Tareas
    public function soltarTarea($idTarBonita, $param)
    {

        $resource = 'API/bpm/humanTask/';
        $url = BONITA_URL . $resource . $idTarBonita;
        file_get_contents($url, false, $param);
        $response = $this->parseHeaders($http_response_header);
        return $response;
    }

    public function getIdOtPorid_SS($id_SS)
    {
        $this->db->select('orden_trabajo.id_orden');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_solicitud', $id_SS);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->row('id_orden');
        } else {
            return 0;
        }

    }

    public function getJustifiacionOT($caseId)
    {
        $this->db->select('orden_trabajo.justificacion');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.case_id', $caseId);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->row('justificacion');
        } else {
            return 0;
        }
    }

    public function setJustificacionOT($idOrden, $justificacion)
    {

        $this->db->set('justificacion', $justificacion);
        $this->db->where('id_orden', $idOrden);
        $query = $this->db->update('orden_trabajo');
        return $query;
    }

    public function getIdOTPorIdCaseEnBD($caseId)
    {
        $this->db->select('orden_trabajo.id_orden');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.case_id', $caseId);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->row('id_orden');
        } else {
            return 0;
        }
    }

    // trae id de OT por caseid
    public function getIdOTPorIdCase($caseId, $param)
    {
        // [URL_BONITA]/API/bpm/caseVariable/:caseId/gIdOT
        $urlResource = BONITA_URL . 'API/bpm/caseVariable/';
        $var = '/gIdOT';
        $data = json_decode(file_get_contents($urlResource . $caseId . $var, false, $param), true);

        return $data;
    }

    // devuelve id de backlog
    public function getIdBackporid_OT($id_OT, $tipo)
    {

        $this->db->select('orden_trabajo.id_solicitud AS idBacklog');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_orden', $id_OT);
        $this->db->where('orden_trabajo.tipo', $tipo);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row('idBacklog');
        } else {
            return 0;
        }
    }
    // Trae datos de backlog para editar
    public function geteditar($id_SS)
    {

        $this->db->select('tbl_back.*,
												equipos.codigo,
												equipos.descripcion,
												equipos.id_equipo,
												equipos.fecha_ingreso,
												equipos.ubicacion,
												marcasequipos.marcadescrip AS marca');
        $this->db->from('tbl_back');
        $this->db->join('equipos', 'tbl_back.id_equipo = equipos.id_equipo');
        $this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');
        $this->db->where('tbl_back.sore_id', $id_SS);
        $query = $this->db->get();
        //dump_exit($this->db->last_query());
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return 0;
        }
    }
    // terminar tarea analisis de Solicitud de Servicios
    public function cerrarTarea($idTarBonita, $param)
    {
        ///API/bpm/userTask/:userTaskId/execution
        $method = '/execution';
        $resource = 'API/bpm/userTask/';
        $url = BONITA_URL . $resource . $idTarBonita . $method;
        file_get_contents($url, false, $param);
        $response = $this->parseHeaders($http_response_header);
        return $response;
    }

    public function actualizarIdOTenBPM($caseId, $param)
    {

        // /API/bpm/caseVariable/:caseId/:variableName
        $variableName = '/execution';
        $resource = 'API/bpm/caseVariable/';
        $variableName = 'gIdOT';
        $url = BONITA_URL . $resource . $caseId . "/" . $variableName;
        file_get_contents($url, false, $param);
        $response = $this->parseHeaders($http_response_header);
    }
    // toma la respuesta del server y devuelve el codigo de respuesta solo
    public function parseHeaders($headers)
    {
        $head = array();
        foreach ($headers as $k => $v) {
            $t = explode(':', $v, 2);
            if (isset($t[1])) {
                $head[trim($t[0])] = trim($t[1]);
            } else {
                $head[] = $v;
                if (preg_match("#HTTP/[0-9\.]+\s+([0-9]+)#", $v, $out)) {
                    $head['reponse_code'] = intval($out[1]);
                }

            }
        }
        return $head;
    }
    // Comentarios
    public function GuardarComentarioBPM($param)
    {
        $respuesta = file_get_contents(BONITA_URL . 'API/bpm/comment', false, $param);
        return $respuesta;
    }
    // Agrega datos desde BPM y BD local
    public function CompletarToDoList($data)
    {

        foreach ($data as $key => $value) {

            if ($value['processId'] == BPM_PROCESS_ID_PEDIDOS_NORMALES) {
                $res = $this->db->get_where('alm_pedidos_materiales', ['case_id' => $value['caseId']])->row();
                $data[$key]['pema_id'] = $res->pema_id;
                $data[$key]['ot'] = $res->ortr_id;

                $this->db->select('B.id_solicitud as "ss", id_orden as "ot", A.descripcion as "desc", causa, X.codigo as "desceq", P.cliRazonSocial as "nomCli", Z.descripcion as "descsec"');
                $this->db->from('orden_trabajo  as A');
                $this->db->join('solicitud_reparacion as B', 'A.case_id = B.case_id', 'left');
                $this->db->join('equipos as X', 'X.id_equipo = A.id_equipo', 'left');
                $this->db->join('admcustomers as P', 'P.cliId = X.id_customer');
                $this->db->join('sector as Z', 'Z.id_sector = X.id_sector', 'left');
                $this->db->where('A.id_orden', $res->ortr_id);
                $res = $this->db->get()->first_row();

                $data[$key]['displayDescription'] = $res->desc;
                $data[$key]['equipoDesc'] = $res->desceq;
                $data[$key]['sectorDesc'] = $res->descsec;
				$data[$key]['nomCli'] = $res->nomCli;
				
				$data = $this->infoUser($data, $key);

                continue;
            }

            if ($value['processId'] == BPM_PROCESS_ID_PEDIDOS_EXTRAORDINARIOS) {
                $res = $this->db->get_where('alm_pedidos_extraordinario', ['case_id' => $value['caseId']])->row();
                $data[$key]['pema_id'] = $res->peex_id;
                $data[$key]['ot'] = $res->ortr_id;
                continue;
            }

            $this->db->select('A.id_solicitud as \'ss\', id_orden as \'ot\', B.descripcion as \'desc\', causa, X.codigo as \'desceq\', P.cliRazonSocial as \'nomCli\', Z.descripcion as \'descsec\'');

            $this->db->from('solicitud_reparacion as A');
            $this->db->join('orden_trabajo as B', 'A.case_id = B.case_id', 'left');
            $this->db->join('equipos as X', 'X.id_equipo = A.id_equipo', 'left');
            $this->db->join('admcustomers as P', 'P.cliId = X.id_customer');
            $this->db->join('sector as Z', 'Z.id_sector = X.id_sector', 'left');
            $this->db->where('A.case_id', $value['caseId']);
            $res = $this->db->get()->first_row();

            if (!$res) {

                $this->db->select('A.id_solicitud as \'ss\', id_orden as \'ot\', B.descripcion as \'desc\', causa, X.codigo as \'desceq\', P.cliRazonSocial as \'nomCli\', Z.descripcion as \'descsec\'');
                $this->db->from('solicitud_reparacion as A');
                $this->db->from('orden_trabajo as B');
                $this->db->from('tbl_back as C');
                $this->db->join('equipos as X', 'X.id_equipo = A.id_equipo', 'left');
                $this->db->join('admcustomers as P', 'P.cliId = X.id_customer');
                $this->db->join('sector as Z', 'Z.id_sector = X.id_sector', 'left');
                $this->db->where('A.case_id', $value['caseId']);
                $this->db->where('C.backId', 'B.id_solicitud', 'left');
                $this->db->where('C.sore_id', 'A.id_solicitud', 'left');

                $res = $this->db->get()->first_row();

                if (!$res) {

                    $this->db->select('id_orden as \'ot\', B.descripcion as \'desc\', causa, X.codigo as \'desceq\', P.cliRazonSocial as \'nomCli\', Z.descripcion as \'descsec\'');
                    $this->db->where('A.case_id', $value['caseId']);
                    $this->db->from('solicitud_reparacion as A');
                    $this->db->join('orden_trabajo as B', 'B.id_solicitud = A.id_solicitud', 'left');
                    $this->db->join('equipos as X', 'X.id_equipo = A.id_equipo', 'left');
                    $this->db->join('admcustomers as P', 'P.cliId = X.id_customer');
                    $this->db->join('sector as Z', 'Z.id_sector = X.id_sector', 'left');
                    $res = $this->db->get()->first_row();

                    if (!$res) {

                        $this->db->select('id_orden as \'ot\', A.descripcion as \'desc\', X.codigo as \'desceq\', P.cliRazonSocial as \'nomCli\', Z.descripcion as \'descsec\'');
                        $this->db->from('orden_trabajo as A');
                        $this->db->join('equipos as X', 'X.id_equipo = A.id_equipo', 'left');
                        $this->db->join('admcustomers as P', 'P.cliId = X.id_customer');
                        $this->db->join('sector as Z', 'Z.id_sector = X.id_sector', 'left');
                        $this->db->where('A.case_id', $value['caseId']);
                        $res = $this->db->get()->first_row();

                        $data[$key]['ss'] = '';
                        $data[$key]['ot'] = $res->ot;
                        $data[$key]['displayDescription'] = $res->desc;
                        $data[$key]['equipoDesc'] = $res->desceq;
                        $data[$key]['sectorDesc'] = $res->descsec;
                        $data[$key]['nomCli'] = $res->nomCli;
                    } else {
                        $data[$key]['ss'] = $res->ss;
                        $data[$key]['ot'] = $res->ot;
                        $data[$key]['equipoDesc'] = $res->desceq;
                        $data[$key]['sectorDesc'] = $res->descsec;
                        $data[$key]['nomCli'] = $res->nomCli;
                        if ($res->desc != null) {
                            $data[$key]['displayDescription'] = $res->desc;
                        } else {
                            $data[$key]['displayDescription'] = $res->causa;
                        }
                    }
                } else {
                    $data[$key]['ss'] = $res->ss;
                    $data[$key]['ot'] = $res->ot;
                    $data[$key]['equipoDesc'] = $res->desceq;
                    $data[$key]['sectorDesc'] = $res->descsec;
                    $data[$key]['nomCli'] = $res->nomCli;
                    if ($res->desc != null) {
                        $data[$key]['displayDescription'] = $res->desc;
                    } else {
                        $data[$key]['displayDescription'] = $res->causa;
                    }
                }
            } else {
                $data[$key]['ss'] = $res->ss;
                $data[$key]['ot'] = $res->ot;
                $data[$key]['equipoDesc'] = $res->desceq;
                $data[$key]['sectorDesc'] = $res->descsec;
                $data[$key]['nomCli'] = $res->nomCli;
                if ($res->desc != null) {
                    $data[$key]['displayDescription'] = $res->desc;
                } else {
                    $data[$key]['displayDescription'] = $res->causa;
                }
            }
            // si existe OT
            $data = $this->infoUser($data, $key);

        }

        return $data;
    }
    /*     ./ TAREAS BPM */

    public function infoUser($data, $key)
    {
        if (isset($data[$key]["ot"])) {
            // si hay un usr asignado en bpm
            if (isset($data[$key]['assigned_id'])) {

                $sql = 'select (concat(usrName,", ", usrLastName) ) as usr_asig_nomb
					from sisusers SU
					join orden_trabajo OT on OT.id_usuario_a = SU.usrId
					where OT.id_orden = ' . $data[$key]["ot"];

                $query = $this->db->query($sql);
                $row = $query->row();

                $data[$key]['usr_asignado'] = $row->usr_asig_nomb;
            } else {
                $data[$key]['usr_asignado'] = " S/A ";
            }
        } else {
            $data[$key]['usr_asignado'] = " S/A ";
		}
		
		return $data;
    }

/* ./ INTEGRACION CON BPM */

    public function instanciarSubtareas($idTarea, $ot)
    {
        $this->db->select('tareadescrip, id_subtarea, form_asoc as idForm');
        $this->db->where('id_tarea', $idTarea);
        $res = $this->db->get('asp_subtareas')->result();

        if (!$res) {
            return false;
        }

        foreach ($res as $key => $o) {

            $infoId = $this->Forms->guardar($o->idForm);
            if (!$infoId) {
                continue;
            }

            $o->info_id = $infoId;
            $o->id_orden = $ot;
            $o->fecha = date('Y-m-d');
            $o->estado = 'AC';

            unset($o->idForm);
            $this->db->insert('tbl_listarea', $o);
        }

        return true;
    }
    public function CambiarEstadoPedidoMat($id)
    {
        $this->db->set('estado', 'Entregado');
        $this->db->where('case_id', $id);
        $query = $this->db->update('alm_pedidos_materiales');
        return $query;
    }
}
