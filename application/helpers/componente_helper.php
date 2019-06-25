<?php defined('BASEPATH') OR exit('No direct script access allowed');

if (!function_exists('info_header')) {
    function info_header($titulo,$body){
        echo 
            '<br><div class="box box-primary collapsed-box asd">
                <div class="box-header with-border">
                <h3 class="box-title">'.$titulo.'</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" onclick="collapse(this)"><i class="fa fa-plus"></i>
                    </button>
                </div>
                </div>
                <div class="box-body">
                '.$body.'
                </div>
            </div>';
    }

    function tabPane($array){
        return '
        <ul class="nav nav-tabs">
        <li class="active"><a href="#tab_1" data-toggle="tab">Tab 1</a></li>
        <li><a href="#tab_2" data-toggle="tab">Tab 2</a></li>
        <li><a href="#tab_3" data-toggle="tab">Tab 3</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            Dropdown <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
            <li role="presentation" class="divider"></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
          </ul>
        </li>
        <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
      </ul>
        ';
    }
}