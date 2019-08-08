<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Forms extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function crear($id)
    {

        $empId = 6; //$userdata[0]['id_empresa'];

        $i = 1;

        $array = array();

        $newInfoId = $this->obtenerNuevoId();

        $plantilla = $this->obtenerPlantilla($id);

        foreach ($plantilla as $item)
        {
            $item['INFO_ID'] = $newInfoId;
            $item['ID_EMPRESA'] = $empId;
            $array[$i] = $item;
            $i++;
        }

        if($this->db->insert_batch('frm_formularios_completados', $array))
        {
            return $newInfoId;

        }else{

            return false;

        }


    }

    public function obtenerPlantilla($id)
    {

        ////  ID DE EMPRESA PARA CLOUD
        //$userdata = $this->session->userdata('user_data');
        $empId = 6; //$userdata[0]['id_empresa'];

        $sql = "SELECT
					form.form_id AS FORM_ID,
					form.nombre AS FORM_NOMBRE,
					form.fec_creacion AS FEC_CREACION,
					cate.NOMBRE AS CATE_NOMBRE,
					grup.NOMBRE AS GRUP_NOMBRE,
					tida.NOMBRE AS TIDA_NOMBRE,
					valo.NOMBRE AS VALO_NOMBRE,
                    valo.VALO_ID,
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
					AND FORM.FORM_ID = $id
					ORDER BY cate.ORDEN,grup.ORDEN,valo.ORDEN
					AND FORM.ID_EMPRESA = $empId";

        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    	
	public function obtenerNuevoId()
	{
		$this->db->select_max('INFO_ID');

		$id = $this->db->get('frm_formularios_completados')->result()[0]->INFO_ID;

		return $id + 1;
    }
    
    public function obtenerForms()
    {
        return $this->db->get('sim_form_evaluacion_desempeño')->result();
    }

    public function guardarFormEval($data)
    {
        return $this->db->insert('sim_form_evaluacion_desempeño', $data);
    }

}
