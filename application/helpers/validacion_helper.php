
<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('req')){
    function req(){
        return ' data-bv-notempty data-bv-notempty-message="Campo Obligatorio *" ';
    }
}