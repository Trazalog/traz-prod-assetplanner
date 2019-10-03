<?php defined('BASEPATH') or exit('No direct script access allowed');

if (!function_exists('modal')) {
    function modal($e)
    {
        return
            "<div class='modal fade' id='$e->id'>
       <div class='modal-dialog'>
         <div class='modal-content'>
           <div class='modal-header'>
             <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
               <span aria-hidden='true'>&times;</span></button>

             <h4 class='modal-title'>" . (isset($e->icono) ? "<span><i class='$e->icono text-light-blue'></i></span>  " : null) . "$e->titulo</h4>
           </div>
           <div class='modal-body'>
             $e->body
           </div>
           <div class='modal-footer'>
             <button type='button' class='btn btn-default' data-dismiss='modal'>Cerrar</button>
             " . (isset($e->accion) ? "<button type='button' class='btn btn-primary btn-accion'>$e->accion</button>" : null) . "
           </div>
         </div>
       </div>
     </div>";
    }
}

if (!function_exists('estado')) {
    function estado($e)
    {
        switch ($e) {
            case 'AC':
                return '<span data-toggle="tooltip" title="" class="badge bg-green estado">Activo</span>';
                break;
            case 'RE':
                return '<span data-toggle="tooltip" title="" class="badge bg-yellow estado">Reparación</span>';
                break;
            case 'AL':
                return '<span data-toggle="tooltip" title="" class="badge bg-blue estado">Alta</span>';
                break;
            case 'IN':
                return '<span data-toggle="tooltip" title="" class="badge bg-red estado">Inhabilitado</span>';
                break;
            default:
                return '<span data-toggle="tooltip" title="" class="badge bg-gray estado">S/E</span>';
                break;
        }

    }
}
