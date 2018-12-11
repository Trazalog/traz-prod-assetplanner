<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Overviews extends CI_Model
{
	function __construct(){

		parent::__construct();
    }
    // $this->db->();
    public function ObtenerActividades($caseId,$param){
			$respuesta = file_get_contents(BONITA_URL.'API/bpm/activity?p=0&c=200&f=processId%3D'.BPM_PROCESS_ID.'&f=rootCaseId%3D'.$caseId.'&d=assigned_id',false,$param);
			$array = json_decode($respuesta,true);
			$ord = array();
			foreach ($array as $key=>$value)if($value['type']=='MULTI_INSTANCE_ACTIVITY'){unset($array[$key]);}
			foreach ($array as $key => $value){
					$ord[] = strtotime($value['last_update_date']);
					// $sort['a'][$key] = strtotime($value['last_update_date']);
				//  $sort['b'][$key] = $value['caseId'];
			}
			array_multisort($ord, SORT_DESC, $array);
			return $array;
    }

    public function ObtenerActividadesArchivadas($caseId,$param){
      $respuesta = file_get_contents(BONITA_URL.'API/bpm/archivedActivity?p=0&c=200&f=processId%3D'.BPM_PROCESS_ID.'&f=rootCaseId%3D'.$caseId.'&d=assigned_id',false,$param);
			$array = json_decode($respuesta,true);
			$ord = array();
			//$sort = array();
			foreach ($array as $key=>$value)if($value['type']=='MULTI_INSTANCE_ACTIVITY'){unset($array[$key]);}
			foreach ($array as $key => $value){
					
					$ord[] = strtotime($value['last_update_date']);
					// $sort['a'][$key] = strtotime($value['last_update_date']);
					//$sort['b'][$key] = $value['caseId'];
			}
			array_multisort($ord, SORT_DESC, $array);
			return $array;
    }
}
?>