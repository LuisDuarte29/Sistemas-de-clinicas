$("[data-mask]").inputmask();
$(".timepicker").timepicker({ showInputs: false, showMeridian: false, minuteStep: 30 });
var tabla;

function initTable() {

    tabla = $("#tbl_Horarios").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        "aoColumns": [
            { "bSortable": false },
            { "bSortable": false },
            { "bSortable": false },
            null,
            null,



        ]
    });
    tabla.fnSetColumnVis(2, false);
}

initTable();

function addRow(obj) {
  
    var fecha = moment(obj.Fecha);
        tabla.fnAddData([


            '<button type="button" title="Actualizar" value="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fas fa-sync-alt" aria-hidden="true"></i></button>',
            '<button  title="Eliminar" value="Eliminar" class="btn btn-danger btn-delete" ><i class="fas fa-user-minus"></i></button>',
            obj.IdHorarioAtencion,
            fecha.format('L'),
            obj.hora.hora


        ])

    }

    $("#btnBuscar").on("click", function (e) {
        e.preventDefault();

        var dni = $("#txtDNI").val();


        if (dni.length > 0) {

            var obj = JSON.stringify({ dni: dni })



            $.ajax({



                type: "POST",
                url: "GestionHorarios.aspx/BuscarMedico",
                data: obj,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                error: function (xhr, ajaxOptions) {
                    console.log(xhr.status + "  " + xhr.responseText);
                },
                success: function (data) {
                    if (data.d) {
                        console.log(data.d)
                        llenarDatos(data.d) 
                        listaHorarios(data.d.idMedico);


                    } else {
                        alert("No se ha podido encontrar al medico");
                    }

                }
            });
            function llenarDatos(obj) {
                $("#lblNombres").text(obj.Nombre);
                $("#lblApellidos").text(obj.ApPaterno);
                $("#lblEspecialidad").text(obj.especialidad.Descripcion);
                $("#txtMedico").val(obj.idMedico);
                console.log(obj.idMedico);
            }
        }
    })
$(document).on('click', '.btn-edit', function (e) {
    e.preventDefault();

    var row = $(this).parent().parent()[0];
    var datarow = tabla.fnGetData(row);
    llenarDatosHorario(datarow);
    console.log(datarow);
    

});
$("#btnEditar").click(function (e) {
    e.preventDefault(e)
    tabla.fnClearTable();

    var obj = JSON.stringify({


        idmedico: $("#txtMedico").val(),
        idhorario: $("#txtIdHorario").val(),
        fecha: $("#txtEditarFecha").val(),
        hora: $("#txtEditarHora").val()
    })
    $.ajax({
        type: "POST",
        url: "GestionHorarios.aspx/ActualizarHorarioAtencion",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        error: function (xhr, ajaxOptions) {
            console.log(xhr.status + "  " + xhr.responseText);
        },
        success: function (response) {
            if (response.d) {
                listaHorarios($("#txtMedico").val());
                alert("Registro actualizado de manera correcta.");
            } else {
                alert("No se pudo actualizar el registro.");
            }


        }
    });
})



function llenarDatosHorario(data) {
    $("#txtEditarFecha").val(data[3]);
    $("#txtEditarHora").val(data[4]);
    $("#txtIdHorario").val(data[2]);
}


    $("#btnAgregar").on("click", function (e) {
        e.preventDefault();
        var fecha, hora, idmedico;
        fecha = $("#txtFecha").val();
        hora = $("#txtHoraInicio").val();
        idmedico = $("#txtMedico").val();
        console.log(idmedico);

        


        if (fecha.length > 0 && hora.length > 0 && idmedico.length > 0) {
            var obj = JSON.stringify({ fecha: fecha, hora: hora, idmedico: idmedico });
            $.ajax({



                type: "POST",
                url: "GestionHorarios.aspx/AgregarHorario",
                data: obj,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                error: function (xhr, ajaxOptions) {
                    console.log(xhr.status + "  " + xhr.responseText);
                },
                success: function (data) {
                    console.log("exito", data.d);
                    addRow(data.d);
                      /* formatData(data.d.Fecha);*/
                   /* console.log("moment.js  ", moment(data.d.Fecha).toDate());*/


                }
            });

        }
    })

function listaHorarios(idmedico) {

    var obj = JSON.stringify({ idmedico: idmedico })

    $.ajax({



        type: "POST",
        url: "GestionHorarios.aspx/ListaHorariosAtencion",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        error: function (xhr, ajaxOptions) {
            console.log(xhr.status + "  " + xhr.responseText);
        },
        success: function (data) {
            console.log("exito", data.d);
            for (var i = 0; i < data.d.length; i++) {
                addRow(data.d[i]);
            }
           
          


        }
    });



}

$(document).on("click", ".btn-delete", function (e) {
   

    var row = $(this).parent().parent()[0];  //Le indicamos que estamos llamando al padre del padre en este caso la fila

    var dataRow = tabla.fnGetData(row);


    console.log(dataRow[2]);
    deleteDataAjax(dataRow[2]);

    listaHorarios($("#txtMedico").val());
    //tabla.clear().draw();
    //sendDataAjax();     //LLamamos al metodo de nuevo para que pueda volver a actualizar la lista de los pacientes

})
function deleteDataAjax(data) {
    var obj = JSON.stringify({ id: JSON.stringify(data) })
    $.ajax({
        type: "POST",
        url: "GestionHorarios.aspx/EliminarHorarioAtencion",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        error: function (xhr, ajaxOptions) {
            console.log(xhr.status + "  " + xhr.responseText);
        },
        success: function (response) {
            if (response.d) {
                alert("Paciente Eliminado")


            } else {
                alert("El registro no se ha podido eliminar")
            }

        }
    });


}
























































//function formatData(obj) {
//    var fecha = obj.replace("/Data(", "");
//    fecha = fecha.replace(")/", "");
//    fecha = new Date(parseInt(fecha));
//    console.log(fecha.format("dd/MM/yyyy"));



//}
