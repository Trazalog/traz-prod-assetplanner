<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-danger alert-dismissable" id="errorUsr" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Revise que todos los campos esten completos
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Usuario <strong style="color: #dd4b39">*</strong>: </label>
    </div>
    <div class="col-xs-8">
        <input type="text" class="form-control" placeholder="Usuario" id="usrNick" name="usrNick" value="<?php echo $data['user']['usrNick'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
    </div>
</div>
<br>
<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Nombre <strong style="color: #dd4b39">*</strong>: </label>
    </div>
    <div class="col-xs-8">
        <input type="text" class="form-control" placeholder="Nombre" id="usrName" name="usrName" value="<?php echo $data['user']['usrName'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
    </div>
</div>
<br>
<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Apellido <strong style="color: #dd4b39">*</strong>: </label>
    </div>
    <div class="col-xs-8">
        <input type="text" class="form-control" placeholder="Apellido" id="usrLastName" name="usrLastName" value="<?php echo $data['user']['usrLastName'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
    </div>
</div>
<br>
<!--<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Comisión <strong style="color: #dd4b39">*</strong>: </label>
    </div>
    <div class="col-xs-8">
        <input type="text" class="form-control" placeholder="Comisión" id="usrComision" name="usrComision" value="<?php echo $data['user']['usrComision'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
    </div>
</div>
<br>-->
<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Contraseña <strong style="color: #dd4b39">*</strong>: </label>
    </div>
    <div class="col-xs-8">
        <input type="password" class="form-control" placeholder="••••••••" id="usrPassword" name="usrPassword" value="" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
    </div>
</div>
<br>
<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Confirma Contraseña <strong style="color: #dd4b39">*</strong>: </label>
    </div>
    <div class="col-xs-8">
        <input type="password" class="form-control" placeholder="••••••••" id="usrPasswordConf" name="usrPasswordConf" value="" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
    </div>
</div>
<br>
<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Grupo <strong style="color: #dd4b39">*</strong>: </label>
    </div>
    <div class="col-xs-8">
        <select class="form-control" id="grpId" name="grpId" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?> >
            <?php
            foreach ($data['groups'] as $g) {
                echo '<option value="'.$g['grpId'].'" '.($data['user']['grpId'] == $g['grpId'] ? 'selected' : '').'>'.$g['grpName'].'</option>';
            }
            ?>
        </select>
    </div>
</div>
<br>
<div class="row">
    <div class="col-xs-4">
        <label style="margin-top: 7px;">Imagen de Perfil: </label>
    </div>
    <div class="col-xs-8">
        <div class="fileinput fileinput-new" data-provides="fileinput" data-name="profileImage">
            <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
                <?php $user_image = $data['user']['usrimag'];
                if( $user_image != '' ) {
                    $user_image = 'data:image/jpg;base64,'.base64_encode($user_image).'" ';
                } else {
                    $user_image = base_url() .'assets/images/avatar.png';
                } ?>
                <img alt="default user image" src="<?php echo $user_image ?>" style="height: 100%; width: 100%; display: block;">
            </div>
            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 150px;"></div>
            <div>
                <?php if($data['read'] == true){
                    echo '';
                } else { ?>
                <span class="btn btn-default btn-file"><span class="fileinput-new">Seleccionar imagen</span><span class="fileinput-exists">Cambiar</span><input type="file" id="input-img" name="imagen"></span>
                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remover</a>
                <?php } ?>
            </div>
        </div><!-- END .fileinput -->
        <br>
    </div>
</div>