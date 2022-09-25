<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionHorarios.aspx.cs" Inherits="Sistemas_de_clinicas.GestionHorarios" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1 align="center">Gestion de horarios de Medicos</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box primary">
                    <div class="box-header">
                        <h3 class="box-title">Datos de Medico</h3>
                    </div>
                    <div class="box box-body">
                        <label>Nro.Documento</label>
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtDNI" CssClass="form-control" runat="server" />
                            <span class="input-group-btn">
                                <asp:Button ID="btnBuscar" CssClass="btn btn-info btn-flat" Text="BUSCAR" runat="server" />
                            </span>
                        </div>
                    </div>
                    <div class="box-footer">
                        <strong>Nombres:</strong>
                        <asp:Label ID="lblNombres" Text="" runat="server"></asp:Label><br />
                        <strong>Apellidos</strong>
                        <asp:Label ID="lblApellidos" Text="" runat="server"></asp:Label>
                        <br />
                        <strong>Especialidad</strong>
                        <asp:Label ID="lblEspecialidad" Text="" runat="server"></asp:Label>



                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="box box primary">
                    <div class="box-header">
                        <h3 class="box-title">Horarios de Atencion</h3>
                    </div>
                    <div class="box box-body">
                        <table id="tbl_Horarios" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th> <%--id oculto del horarioAtencion--%>
                                    <th>FECHA DE ATENCION</th>
                                    <th>HORA DE ATENCION</th>
                                    <th>ESTADO</th>

                                </tr>
                            </thead>
                            <tbody id="tbl_body_table">
                                <%-- DATOS POR MEDIO DE AJAX--%>
                              <%--  <tr>
                                    <td>boton-editar</td>
                                    <td>boton-eliminar</td>
                                    <td>campo-fecha</td>
                                    <td>campo-hora</td>
                                    <td style='display: none'>estado</td>
                                </tr>--%>
                            </tbody>
                        </table>
                    </div>
                    <div class="box-footer">
                   <%--     <asp:Button ID="btnAgregarHorario" CssClass="btn btn-primary" Text="Agregar Horario" runat="server" />--%>
                        <asp:LinkButton ID="btnAgregarHorario" CssClass="btn btn-primary" runat="server" href="#AgregarHorario" data-toggle="modal" >Agregar Horario</asp:LinkButton> 
                        <asp:Button ID="btnGuardarHorario" CssClass="btn btn-danger" Text="Guardar Horario" runat="server" />
                    </div>
                </div>
            </div>
            </div>
        <div class="modal fade" id="AgregarHorario" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h3 class="modal-title"><i class="fa fa-clock-o"></i>Agregar Horario Atención</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Fecha:</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <asp:TextBox ID="txtFecha" CssClass="form-control" data-inputmask="'alias': 'dd/mm/yyyy'"
                                data-mask="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="bootstrap-timepicker">
                        <div class="form-group">
                            <label>Hora Inicio:</label>
                            <div class="input-group">
                                <asp:TextBox ID="txtHoraInicio" CssClass="form-control timepicker" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer clearfix">
                    <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" data-dismiss="modal" Text="Agregar" />
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h3 class="modal-title"><i class="fa fa-clock-o"></i>Editar Horario Atencion</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Fecha:</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <asp:TextBox ID="txtEditarFecha" CssClass="form-control" data-inputmask="'alias': 'dd/mm/yyyy'"
                                data-mask="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="bootstrap-timepicker">
                        <div class="form-group">
                            <label>Hora Inicio:</label>
                            <div class="input-group">
                                <asp:TextBox ID="txtEditarHora" CssClass="form-control timepicker" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer clearfix">
                    <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-primary" data-dismiss="modal" Text="Editar" />
                </div>
            </div>
        </div>
    </div>

        <input type="hidden"  ID="txtMedico"/>
        <input type="hidden" ID="txtIdHorario" />
    </section>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="js/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="js/plugins/timepicker/bootstrap-timepicker.min.js"></script>
     <script src="https://cdn.datatables.net/1.9.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <script src="js/plugins/moment/moment.min.js"></script>   
    <script src="js/horarioAtencion.js"></script>
</asp:Content>

