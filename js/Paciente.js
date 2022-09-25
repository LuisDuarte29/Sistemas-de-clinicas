

//function templateRow() {
//    var template = "<tr>";
//    template += ("<td>" + "123" + "</td>");
//    template += ("<td>" + "Jorge Junior" + "</td>");
//    template += ("<td>" + "Rodriguez Castillo" + "</td>");
//    template += ("<td>" + "123" + "</td>");
//    template += ("<td>" + "123" + "</td>");
//    template += ("<td>" + "123" + "</td>");
//    template += ("<td>" + "123" + "</td>");
//    template += "</tr>";
//    return template;
//}

//function addRow() {
//    var template = templateRow();
//    for (var i = 0; i < 10; i++) {
//        $("#tbl_body_table").append(template);
//    }
//}





var tabla;
var data;
function addRowDT(data) {
   
    tabla = $("#tbl_pacientes").DataTable({
        responsive: true,
        paging: false,
        ordering: true,
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        "bDestroy": true,
        "aoColumns": [
            null,
            null,
            null,
            null,
            null,
            null,
            { "bSortable": false }
        ]
        
    });
    tabla.fnClearTable();
    for (var i = 0; i < data.length; i++) {

        tabla.fnAddData([
            data[i].IdPaciente,
            data[i].Nombre,
            (data[i].ApPaterno + " " + data[i].ApMaterno),
            ((data[i].Sexo == 'M') ? "Masculino" : "Femenino"),
            data[i].edad,
            data[i].Direccion,

            '<button  title="Actualizar" value="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fas fa-sync-alt"></i></button>'+
             '<button  title="Eliminar" value="Eliminar" class="btn btn-danger btn-delete" ><i class="fas fa-user-minus"></i></button>'
            

                //((data[i].Estado == true) ? "Activo" : "Inactivo")
                
            ]);
            
        }

    }
    

    $(document).on("click", ".btn-edit", function (e) {

        e.preventDefault();
        var row = $(this).parent().parent()[0];
        console.log(row);
        data = tabla.fnGetData(row);
        console.log(data)
     
        fillDataUpdate();
       
 
    })
    function fillDataUpdate() {

        $("#txtFullName").val(data[1] + " " + data[2]);

        $("#txtModalDireccion").val(data[5]);


    }

    $("#btnActualizar").click(function (e) {

       
        sendUpdateData();
        location.reload();


    })

function sendUpdateData() {

    var obj = JSON.stringify({ id: JSON.stringify(data[0]), direccion: $("#txtModalDireccion").val() })
 

    $.ajax({
        type: "POST",
        url: "GestionarPacientes.aspx/ActualizarPaciente",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        error: function (xhr, ajaxOptions) {
            console.log(xhr.status + "  " + xhr.responseText);
        },
        success: function (response) {
            console.log(response.d);
            

        }
    });
}





    $(document).on("click", ".btn-delete", function (e) {

        var row = $(this).parent().parent()[0];  //Le indicamos que estamos llamando al padre del padre en este caso la fila

        var dataRow = tabla.fnGetData(row);
        deleteDataAjax(dataRow[0]);
        tabla.clear().draw();
        sendDataAjax();     //LLamamos al metodo de nuevo para que pueda volver a actualizar la lista de los pacientes

    })

//var entrada1 = document.getElementById("entrada");

//entrada1.addEventListener("click", function () {
//    var element = document.getElementById("salida");
//    element.classList.toggle("toggle1");
//})



function deleteDataAjax(data) {
    var obj = JSON.stringify({ id: JSON.stringify(data) })
    $.ajax({
        type: "POST",
        url: "GestionarPacientes.aspx/EliminarDatosPaciente",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        error: function (xhr, ajaxOptions) {
            console.log(xhr.status + "  " + xhr.responseText);
        },
        success: function (response) {
            if (response.d) {
                Response.Write("<script>alert(`Paciente Registrado`)</script>");
                
                
            } else {
                alert("El registro no se ha podido eliminar")
            }
         
        }
    });


}




$("#btnListar").click(function (e) {
    e.preventDefault();
    sendDataAjax();
    //$(".estilos").show("slow");
    document.querySelector(".estilos").style.display = 'block';
    document.querySelector(".estilos").scrollIntoView(true);
        
    

})

function sendDataAjax() {
        $.ajax({
            type: "POST",
            url: "GestionarPacientes.aspx/ListaPaciente",
            data: {},
            contentType: "application/json; charset=utf-8",
            error: function (xhr, ajaxOptions) {
                console.log(xhr.status + "  " + xhr.responseText);
            },
            success: function (data) {
                console.log(data.d)
                console.log("El comando ajax ejecuto correctamente");
                addRowDT(data.d);

            }
        });


    }
    

