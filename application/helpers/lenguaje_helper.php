<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('lang_get')){

    function lang_get($leng, $page)
    {
        $parametros["http"]["method"] = "GET";		 
        $param = stream_context_create($parametros);
       	
      //  $url = REST.$resource;
        $url = base_url('lang.json');
        $lang = file_get_contents($url, false, $param);
        $lang = json_decode($lang,true);
        $lang = $lang['labels']['label'];
        #var_dump($lang);die;
        $lenguaje =  array();
        for($i=0;$i<count($lang);$i++)
        { 
            $aux = array($lang[$i]['id']=> $lang[$i]['texto']);
            $lenguaje = array_merge($lenguaje,$aux);
        }
    
        return $lenguaje;
    }
}