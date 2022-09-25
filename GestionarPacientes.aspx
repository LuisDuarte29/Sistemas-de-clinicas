<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionarPacientes.aspx.cs" Inherits="Sistemas_de_clinicas.WebForm2" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1 align="center">Registro de Pacientes</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <%-- <div class=" box-header">
                        <h3 class="box-title">Datos del Paciente</h3>
                    </div>--%>
                    <div class="box-body">
                        <div class="form-group">
                            <asp:Label Text="Documento de Identidad" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNroDocumento" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Nombre" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Apellido Materno" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApMaterno" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Apellido Paterno" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApPaterno" CssClass="form-control" runat="server"  />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Correo Electronico" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCorreo" CssClass="form-control" runat="server"  pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <%-- <div class=" box-header">
                        <h3 class="box-title">Datos del Paciente</h3>
                    </div>--%>
                    <div class="box-body">

                        <div class="form-group">
                            <asp:Label Text="Sexo" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <asp:Label Text="Edad" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtEdad" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Telefono" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Direccion" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                </div>
            </div>

            <div align="center">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnRegistar" runat="server" CssClass="btn btn-danger" Text="Registrar" Width="200px" OnClick="btnRegistar_Click" />
                        </td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-primary" Text="Cancelar" Width="200px" />
                        </td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnListar" runat="server" CssClass="btn btn-warning" Text="Listar Pacientes" Width="200px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </section>


    <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Actualizar Registro</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Nombres y Apellidos</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtFullName" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <label>Direccion</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtModalDireccion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnActualizar" data-dismiss="modal">Actualizar</button>
                </div>

            </div>
        </div>

    </div>

    <div class="row estilos">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">Lista de Pacientes</h3>
                </div>
                <div class="box-body table-responsive">
                    <table id="tbl_pacientes" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Sexo</th>
                                <th>Edad</th>
                                <th>Direccion</th>
                                <th>Acciones</th>

                            </tr>
                        </thead>
                        <tbody id="tbl_body_table">
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/Paciente.js"></script>
</asp:Content>
