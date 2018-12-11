<?php defined('BASEPATH') OR exit('No direct script access allowed');

if (!function_exists('cargarFormulario')) {
  function cargarFormulario ($form,$id=''){

    echo '<div class="row">
            <div class="col-xs-12">
              <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
                <h4><i class="icon fa fa-ban"></i>Exiten campos sin completar...</h4>
                Por favor revise que todos los campos obligatorios esten completos
              </div>
            </div>
          </div>';


    echo '<div class="modal-footer">
              <button class="btn btn-primary" onclick="ValidarCampos()">Validar</button>
              <button class="btn btn-success" type="button" data-dismiss="modal">Cerrar</button>
            </div>';

    echo'<form enctype="multipart/form-data" id="genericForm'.$id.'" class="form-horizontal" style="padding:0px 15px;" role="form" action="" method="" >';

        // guarda el id_listarea para actualizarla tabla frm formcompletados
        echo "<input type='text' class='hidden' name='id_listarea' id='id_listarea' style='width: 100%'>";
        //echo "id form";
        echo "<input type='text' class='hidden' name='idformulario' id='idformulario' style='width: 100%'>";

        echo "<table id='tabla' class='table table-bordered table-hover'>";
          echo "<tbody>";
            $categ = "";
            $grup = "";
            //dump_exit($form);
            foreach($form as $a){
              
              // Muestra categoria
              $regCat = $a['nomCategoria'];
              if ($categ != $regCat) {
                echo "<tr>";
                  echo "<td colspan ='2'>";
                    echo "<h3 align='center'>".$a['nomCategoria']."</h3>";
                  echo "</td>";
                echo "</tr>";
                // echo "<input type='hidden' class='nomCategoria' id='categoria' name='' value='".$a['nomCategoria']."'>";
                //echo "<br>";
                $categ = $a['nomCategoria'];
              }

              // Muestra grupo
              if(strlen($a["nomGrupo"])>0){

                  $regGrupo = $a["nomGrupo"];
                  if(strcmp($grup, $regGrupo) == 0){  //cadenas iguales
                    $grup = $a["nomGrupo"];
                  }
                  else{                             //cadenas distintas
                    //echo "entre por if";
                    echo "<tr>";
                    echo "<td colspan ='2'>";
                    echo "<h4>".$a["nomGrupo"]."</h4>";
                    echo "</td>";
                    echo "</tr>";
                    $grup = $a["nomGrupo"];
                  }
              }

              // Muestra el nombre del dato
              echo "<tr>";
                echo "<td>" ;

                $etiqueta = $a["nomTipoDatos"];
                // si el campo es obligatorio añade * para señalar
                echo "<h4 ' style='margin-left: 60px'> ".$a["nomValor"].($a['obligatorio']?" <strong style='color: #dd4b39'>*</strong>: ":" :")."</h4>";

                echo "</td>";
                echo "<td><div class='form-group'>";

                // muestra el componente a llenar o el select
                  switch ($etiqueta) {
                        case "select":
                            echo "<select class='form-control sel ".($a['obligatorio']?"requerido":"")."' name='".$a['idValor']."' id='".$a['VALO_ID']."' style='width: 80%'>
                              <option value= '".(strcmp($a['valDefecto'],'Seleccione...')==0?-1:$a['valDefecto'])."' >".$a['valDefecto']."</option>
                            </select>";
                            break;
                        case "input_texto":
                            echo "<input type='text' class='form-control inp texto ".($a['obligatorio']?"requerido":"")."' name='".$a['idValor']."' id='".$a['idValor']."' value='".$a['valDefecto']."' style='width: 80%'>";
                            //echo "hay input";
                            break;
                        case "input_numerico":
                            echo "<input type='number' class='form-control inp numerico ".($a['obligatorio']?"requerido":"")."' name='".$a['idValor']."' id='".$a['idValor']."' value='".$a['valDefecto']."' style='width: 80%'>";
                            break;
                        case "input_fecha":
                            echo "<input type='text' class='form-control inp fecha ".($a['obligatorio']?"requerido":"")."' name='".$a['idValor']."' id='".$a['idValor']."' value='".$a['valDefecto']."' style='width: 80%'>";
                            break;

                        case "input_archivo":
                            // campo auxiliar guarda ultima img en BD
                            echo "<input type='text' class='auxiliar ' name='' id='".$a['idValor']."' value='".$a['valDefecto']."' style='width: 80%'>";
                            // input tipo file
                            echo "<input type='file' class='inp archivo ".($a['obligatorio']?"requerido":"")."' name='".$a['idValor']."' id='".$a['idValor']."' value='".$a['valDefecto']."' style='width: 80%'>";
                            // link para ver la imagen adjunta
                            
                            if($a['valDefecto'] != ""){
                              echo "<a href='".$a['valDefecto']."' class='".$a['idValor']."' target='_blank' ><i class='fa fa-picture-o' style='color: #A4A4A4; cursor: pointer; margin-left: 15px;' title='Imagen'></i> Ver Adjunto</a> ";
                            }                        
                            break;
                        case "checkbox":
                             echo "<input class='check ".($a['obligatorio']?"requerido":"")."' type='checkbox' value='tilde' name='".$a['idValor']."' ".($a['valDefecto'] == 'tilde' ? "checked" : "")." style='transform: scale(1.4);'>";
                            break;
                        case "textarea":
                            echo "<textarea class='form-control ".($a['obligatorio']?"requerido":"")."' name='".$a['idValor']."' id='".$a['idValor']."' rows='2'>".$a['valDefecto']."</textarea>";
                            break;
                  }
                echo "</div></td>";
              echo "</tr>";
            }
          echo "</tbody>";
        echo "</table>";

        echo '<div class="modal-footer">

            </div>
          </form> ';

    }
}