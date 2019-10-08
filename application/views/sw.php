<script>
<?php
if(SW) {
    ?>
    //make sure that Service Workers are supported.
    if (navigator.serviceWorker) {
        navigator.serviceWorker.register('<?php echo SW ?>')
            .then(function(registration) {
                console.log(registration);
                if (!navigator.serviceWorker.controller) {
                    location.reload();
                }
            })
            .catch(function(e) {
                console.error(e);
            })
    } else {
        console.log('Service Worker is not supported in this browser.');
    }

    <?php } ?>


//Precacheo
base_url = "<?php echo base_url() ?>index.php/";
if (!indexedDB) {
    alert("Este browser no soporta IndexedDB, necesita otro para poder utilizar la aplicación.");
}

indexedDB.open('traz-prod-assetplanner-ajax').onupgradeneeded = function(event) {
    event.target.result.createObjectStore('ajax_requests', {
        autoIncrement: true,
        keyPath: 'id'
    });
}

var tareas = JSON.parse('<?php echo $tareas?>');
console.log(tareas);

var cache_urls = [];
tareas.forEach(e => {
    cache_urls.push(base_url + 'Tarea/detaTarea/Add-Edit-Del-View-/' + e.id)

    if(e.displayName == 'Ejecutar OT'){
        cache_urls.push(
        base_url + 'Tarea/detaTarea/Add-Edit-Del-View-/' + e.id,
        base_url + 'Tarea/confInicioTarea?id_OT=' + e.id_Ot
        );

        e.subtareas.forEach( s => {
            cache_urls.push(base_url + '<?php echo FRM ?>Form/obtener/' + s + '/true')
        });
    }
});

cache_urls.push(base_url + 'Tarea/index/Add-Edit-Del-View-');
caches.open('traz-prod-assetplanner-cache').then(function(cache) {
    return cache.addAll(cache_urls);
});
</script>