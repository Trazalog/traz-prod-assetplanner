<table id="users" class="table table-bordered table-hover">
		<thead>
			<tr>
					<th>Acciones</th>
					<th>Usuario</th>
					<th>Nombre</th>
					<th>Apellido</th>
					<!--<th>Comisión</th>-->
					<th>Img</th>
			</tr>
		</thead>
		<tbody>
			<?php
			foreach($list as $u)
			{
					//var_dump($u);
					echo '<tr>';
					echo '<td>';
					if (strpos($permission,'Add') !== false) {
									echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadUsr('.$u['usrId'].',\'Edit\')"></i>';
					}
					if (strpos($permission,'Del') !== false) {
									echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadUsr('.$u['usrId'].',\'Del\')"></i>';
					}
					if (strpos($permission,'View') !== false) {
									echo '<i class="fa fa-fw fa-search text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadUsr('.$u['usrId'].',\'View\')"></i>';
					}
					echo '</td>';
					echo '<td style="text-align: left">'.$u['usrNick'].'</td>';
					echo '<td style="text-align: left">'.$u['usrName'].'</td>';
					echo '<td style="text-align: left">'.$u['usrLastName'].'</td>';
					//echo '<td style="text-align: right">'.$u['usrComision'].' %</td>';
					$user_image = $u['usrimag'];
					if( $user_image != '' ) {
									$user_image = 'data:image/jpg;base64,'.base64_encode($user_image).'" ';
					} else {
									$user_image = base_url() .'assets/images/avatar.png';
					}
					echo '<td style="text-align: right"><img style="width: 20px; height: 20px;"src="'.$user_image.'""></td>';
					echo '</tr>';

			}
			?>
		</tbody>
</table>


<script>
		$(function () {
						$('#users').DataTable({
										"aLengthMenu": [ 10, 25, 50, 100 ],
										"columnDefs": [ {
														"targets": [ 0 ],
														"searchable": false
										},
										{
														"targets": [ 0 ],
														"orderable": false
										} ],
										"order": [[1, "asc"]],
						});
		});
</script>