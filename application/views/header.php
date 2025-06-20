<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <title>asset PLANNER</title>

    <link rel="manifest" href="./manifest.json" />

    <link rel="shortcut icon" href="<?php echo base_url();?>assets/img/favicon.png" type="image/x-icon">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/bootstrap.min.css">
    <!-- AdminLTE 2.1.2 - Theme style -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/skins/_all-skins.min.css">
    <!--<link rel="stylesheet" href="<?php echo base_url();?>assets/css/skins/skin-green-light.min.css">-->
    <!-- Font Awesome 4.7.0 -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/font-awesome.min.css">
    <!-- Ionicons 2.0.1 -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/ionicons.min.css">
    <!-- Jquery UI 1.12.1 -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/jquery-ui.min.css">
    <!-- DataTables 1.10.7 -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugin/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugin/datatables/extensions/Buttons/css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugin/datatables/extensions/Buttons/css/buttons.bootstrap.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/plugin/daterangepicker/daterangepicker.css" />
    <!-- Bootstrap datetimepicker -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugin/datetimepicker/css/bootstrap-datetimepicker.min.css">

    <!-- Propios -->
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/propios.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="<?php echo base_url();?>assets/js/html5shiv.min.js"></script>
        <script src="<?php echo base_url();?>assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Select 2 -->
    <link href="<?php echo base_url();?>assets/plugin/select2/select2.min.css" rel="stylesheet"/>

    <!-- jQuery 2.1.4 -->
    <script src="<?php echo base_url();?>assets/js/jquery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<?php echo base_url();?>assets/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo base_url();?>assets/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <!--<script src="<?php echo base_url();?>assets/js/demo.js"></script>-->
    <!--<script src="<?php echo base_url();?>assets/js/notify.js"></script>-->

    <!-- funciones comunes al sistema -->
    <script src="<?php echo base_url();?>assets/js/propios.js"></script>
    <!-- DataTables 1.10.7 -->
    <script src="<?php echo base_url();?>assets/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/datatables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/datatables/extensions/Buttons/js/jszip.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/datatables/extensions/Buttons/js/buttons.html5.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/datatables/extensions/Buttons/js/buttons.print.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/datatables/extensions/Buttons/js/buttons.bootstrap.js"></script>
    
    <!-- Jquery UI 1.12.1 -->
    <script src="<?php echo base_url();?>assets/js/jquery-ui.min.js"></script>
    <!-- ChartJS 2.5.0 -->
    <script src="<?php echo base_url();?>assets/plugin/chartjs/Chart.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.5.5/i18n/jquery-ui-timepicker-addon-i18n.js"></script>

    <!-- iCheck -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/plugin/iCheck/minimal/blue.css">
    <script src="<?php  echo base_url();?>assets/plugin/iCheck/icheck.min.js"></script>

    <!-- fullcalendar -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/plugin/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/plugin/fullcalendar/fullcalendar.print.css" media="print">
    
    <!-- Jasny Bootstrap -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugin/jasny-bootstrap/css/jasny-bootstrap.min.css">
    <!-- Bootstrap Validator -->
    <!-- <link rel="stylesheet" href="<?php #echo base_url();?>assets/plugin/bootstrapvalidator/bootstrapValidator.min.css"> -->

    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="<?php base_url();?>assets/plugin/iCheck/all.css">


    <!-- iCheck 1.0.1 -->
    <script src="<?php base_url();?>assets/plugin/iCheck/icheck.min.js"></script>

    <!-- SlimScroll -->
    <script src="<?php  echo base_url();?>assets/plugin/slimScroll/jquery.slimscroll.min.js"></script>

    <script src="<?php echo base_url();?>assets/plugin/fullcalendar/moment.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/fullcalendar/fullcalendar.min.js"></script>
    <!-- Daterange picker -->
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugin/daterangepicker/daterangepicker.js"></script>
    
    <script src="<?php echo base_url();?>assets/plugin/moment/moment-with-locales.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugin/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <!-- Jasny Bootstrap -->
    <script src="<?php echo base_url();?>assets/plugin/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
    <!-- Bootstrap Validator -->
    <!-- <script src="<?php #echo base_url();?>assets/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script> -->
    
    <script src="<?php echo base_url();?>assets/js/jquery.PrintArea.js"></script>

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>

    <!-- CDN PDF -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.worker.min.js"></script> 

   <!-- css sweetalert -->
    <link rel="stylesheet" href="assets/plugin/sweetalert/sweetalert.css"> 
    <!-- plugin sweet alert -->
   <script src="<?php echo base_url() ?>assets/plugin/sweetalert/sweetalert.min.js"></script>
    <!-- SWAL ALERT -->
    <script src="<?php echo base_url() ?>assets/plugin/swal/dist/sweetalert2.js"></script>
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/plugin/swal/dist/sweetalert2.min.css">

    <!-- Impresion PDF -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
</head>


<!-- indicador de carga -->
<div class="waiting" id="waiting">
    <div style="top: 45%; left: 45%; position: fixed;">
        <!--<div class="progress progress active">
            <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
        </div>-->
        <div class="box box-success" style="width: 200px; text-align: center;">
            <br>
            <br>
            <br>
            <div class="box-header">
                <h3 class="box-title" id="waitingText">Cargando...</h3>
            </div>
            <!-- Loading (remove the following to stop the loading)-->
            <div class="overlay">
                <i class="fa fa-refresh fa-spin"></i>
            </div>
            <!-- end loading -->
        </div>
    </div>
</div>

<style>
.waiting {
    background: none;
    display: block;
    position: fixed;
    z-index: 50000;
    overflow: auto;
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    display: none;
    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,endColorstr=#99000000); /* AA, RR, GG, BB */
    /*CSS3*/
    background:rgba(0,0,0,0.5); /*0.5 De Transparencia*/
}
</style>

<style>
    .datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; }.datagrid table td, .datagrid table th { padding: 13px 20px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3B8BBA), color-stop(1, #45A4DB) );background:-moz-linear-gradient( center top, #3B8BBA 5%, #45A4DB 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3B8BBA', endColorstr='#45A4DB');background-color:#3B8BBA; color:#FAF2F8; font-size: 13px; font-weight: bold; border-left: 1px solid #A3A3A3; } .datagrid table tbody td { color: #002538; font-size: 13px;border-bottom: 1px solid #E1EEF4;font-weight: normal; }.datagrid table tbody .alt td { background: #EBEBEB; color: #00273B; }
</style>

<script>
/* Inicialización en español para la extensión 'UI date picker' para jQuery. */
/* Traducido por Vester (xvester@gmail.com). */
(function( factory ) {
    if ( typeof define === "function" && define.amd ) {
        // AMD. Register as an anonymous module.
        define([ "../widgets/datepicker" ], factory );
    } else {
        // Browser globals
        factory( jQuery.datepicker );
    }
}(function( datepicker ) {
    datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre'],
        monthNamesShort: ['ene','feb','mar','abr','may','jun','jul','ago','sep','oct','nov','dic'],
        dayNames: ['domingo','lunes','martes','miércoles','jueves','viernes','sábado'],
        dayNamesShort: ['dom','lun','mar','mié','jue','vie','sáb'],
        dayNamesMin: ['D','L','M','X','J','V','S'],
        weekHeader: 'Sm',
        dateFormat: 'dd-mm-yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''};
    datepicker.setDefaults(datepicker.regional['es']);
    return datepicker.regional['es'];
}));
</script>


