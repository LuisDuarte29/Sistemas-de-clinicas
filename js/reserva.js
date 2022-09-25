$("[data-mask]").inputmask();

$("#btnBuscar").on("click", function (e) {
    e.preventDefault();
    var dni = $("#txtDNI").val();

    reservaDataAjax(dni);
});

function reservaDataAjax(dni) {


    var obj = JSON.stringify({ dni:dni })

    $.ajax({
        type: "POST",
        url: "GestionReservaCitas.aspx/BuscarPacienteDNI",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        error: function (xhr, ajaxOptions) {
            console.log(xhr.status + "  " + xhr.responseText);
        },
        success: function (response) {
         
            console.log(response.d);
            llenarDatosPaciente(response.d);


        }
    });


}
function llenarDatosPaciente(obj) {
    $("#txtIdPaciente").val(obj.IdPaciente);
    $("#txtTelefono").val(obj.Telefono);
    $("#txtEdad").val(obj.edad);
    $("#txtSexo").val((obj.Sexo == 'M') ? 'Masculino' : 'Femenino');
    $("#txtNombres").val(obj.Nombre);
    $("#txtApellidos").val(obj.ApMaterno + " " + obj.ApPaterno);



}