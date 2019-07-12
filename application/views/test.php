<h1>HOLIS</h1>

<i class="fa fa-paperclip text-light-blue btn-form" style="cursor: pointer; margin-left: 15px;" aria-hidden="true"
    id="1000" data-infoId="6" data-valido="true"></i>

<div class="modal fade bs-example-modal-lg" id="modalFormSubtarea" tabindex="-1" role="dialog"
    aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="box">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12 col-md-12" id="contFormSubtarea">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
// levanta cada formulario por id 
$(".fa-paperclip").on('click', function(e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    infoId = $(this).attr("data-infoId");

    if (infoId == null || infoId == 0) {
        alert('Error InfoId =null');
        return;
    }
    WaitingOpen();
    $.ajax({
        data: {
            infoId: infoId
        },
        dataType: 'json',
        type: 'POST',
        url: 'Form/Obtener_Formulario',
        success: function(result) {
            $("#contFormSubtarea").html(result.html);
            $('#modalFormSubtarea').modal('show');
            WaitingClose();
         //   ValidarObligatorios();
            llenaComp();
        //    IniciarValidador("form");
        },
        error: function(result) {
            WaitingClose();
            alert("Error: No se pudo obtener el Formulario");
        },
    });
});
</script>