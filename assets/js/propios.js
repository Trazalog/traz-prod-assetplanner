/* Abre cuadro cargando ajax */
function WaitingOpen(texto){
	if(texto == '' || texto == null){
		$('#waitingText').html('Cargando ...');
	}
	else{
		$('#waitingText').html(texto);
	}
	$('#waiting').fadeIn('slow');
}
/* Cierra cuadro cargando ajax */
function WaitingClose(){
	$('#waiting').fadeOut('slow');
}


/* Carga ícono y acción */
function LoadIconAction(idTag, action){
	var icon = "";
	var actt = "";

	switch(action){
		case	'Add':
		icon = '<i class="fa fa-fw fa-plus-square text-light-blue"></i>';
		actt = 'Agregar ';
		break;
		case 	'Edit':
		icon = '<i class="fa fa-fw fa-pencil text-light-blue"></i>';
		actt = 'Editar ';
		break;
		case 	'Del':
		icon = '<i class="fa fa-fw fa-times-circle text-light-blue"></i>';
		actt = 'Eliminar ';
		break;
		case 	'View':
		icon = '<i class="fa fa-fw fa-search text-light-blue"></i>';
		actt = 'Consultar ';
		break;
		case 	'Program':
		icon = '<i class="fa fa-fw fa-clock-o text-light-blue"></i>';
		actt = 'Programar ';
		break;
		case 	'ReProgram':
		icon = '<i class="fa fa-fw fa-clock-o text-light-blue"></i>';
		actt = 'Re-Programar ';
		break;
	}
	$('#'+idTag).html(icon + actt);
}


/* Devuelve Fecha Hora formateado para input date */
function getFechaHoraFormateada(date) {
	/* date es objeto fecha */
	var str = date.getFullYear() + "-" + getDosDigitos(date.getMonth()) + "-" + getDosDigitos(date.getDate()) + " " +  getDosDigitos(date.getHours()) + ":" + getDosDigitos(date.getMinutes()) + ":" + getDosDigitos(date.getSeconds());
	return str;
}
/* Devuelve Fecha Hora formateado para input date */
function getFechaFormateada(date) {
	/* date es objeto fecha */
	var str = date.getFullYear() + "-" + getDosDigitos(date.getMonth()) + "-" + getDosDigitos(date.getDate());
	return str;
}
/* Devuelve fecha con dos digitos */
function getDosDigitos(partTime) {
	if (partTime<10)
		return "0"+partTime;
	return partTime;
}


/// Recarga la tabla manteniendo la posicion de la pagina
function reloadTable(){

	let table = $('#sales').DataTable();
	 table
	 .order( [[ 1, 'asc' ]] )
	 .draw( false );
}


/// Muestra el archivo en el modal
// recibe archivo en base64, extension del archivo, nombre de archivo, id modal a mostrar
function mostrarArchivo(base64Data, mimeType, fileName, modalId) {
	const contenedor = document.getElementById('contenedorEvidencia');
	contenedor.innerHTML = '';
  
	if (mimeType.startsWith('image/')) {
	   const img = document.createElement('img');
	img.src = `data:${mimeType};base64,${base64Data}`;
	img.style.width = '90%';
	img.style.height = 'auto';
	img.style.maxHeight = '75vh'; // para que no se pase del alto visible
	img.style.margin = 'auto';
	contenedor.appendChild(img);
	$('#'+modalId).modal('show');
	} else if (mimeType === 'application/pdf') {
	  // Crear un Blob para el PDF y abrirlo en una nueva pestaña
	  const byteCharacters = atob(base64Data);
	  const byteNumbers = new Array(byteCharacters.length);
	  for (let i = 0; i < byteCharacters.length; i++) {
		  byteNumbers[i] = byteCharacters.charCodeAt(i);
	  }
	  const byteArray = new Uint8Array(byteNumbers);
	  const blob = new Blob([byteArray], { type: mimeType });
	  const blobUrl = URL.createObjectURL(blob);
	  window.open(blobUrl, '_blank');
	  // Cerrar el modal actual ya que el PDF se abre en otra pestaña
	  $('#'+modalId).modal('hide');
	} else {
	  const link = document.createElement('a');
	  link.href = `data:${mimeType};base64,${base64Data}`;
	  link.download = fileName;
	  link.innerText = 'Descargar archivo';
	  link.className = 'btn btn-primary';
	  contenedor.appendChild(link);
	}
  }