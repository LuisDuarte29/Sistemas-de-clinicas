<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionReservaCitas.aspx.cs" Inherits="Sistemas_de_clinicas.GestionReservaCitas" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
             <section class="content-header">
        <h1 align="center">RESERVA DE CITAS</h1>
    </section>
    <section class="content">
        <div class="box-header">
            <h3 align="center" class="box-title">DATOS DEL PACIENTE</h3>
        </div>
        <div class="row">
            <!--left column -->
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>DOCUMENTO DE IDENTIDAD</label>
                        </div>
                        <div class="input-group">
                            <asp:TextBox ID="txtDNI" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-btn">
                                <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-danger" Text="BUSCAR" />
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <label>NOMBRES</label>
                            <asp:TextBox ID="txtNombres" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>APELLIDOS</label>
                            <asp:TextBox ID="txtApellidos" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <!-- </form> -->
                </div>
            </div>
            <!--rigth column -->
            <div class="col-md-6">
                <div class="box box-primary">
                    <br />
                    <div class="box-body">
                        <div class="form-group">
                            <label>TELÉFONO</label>
                            <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>EDAD</label>
                            <asp:TextBox ID="txtEdad" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>SEXO</label>
                            <asp:TextBox ID="txtSexo" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <section class="content-header">
            <h3 align="center">HORARIOS DE ATENCIÓN</h3>
        </section>
        <!--SELECCIONAR HORARIO DE ATENCION -->
        <div class="row">
            <!--left column -->
            <div class="col-md-6">
                <div class="box box-primary">
                    <!-- <form role="form"> -->
                    <div class="box-body">
                        <!-- INICIO CALENDARIO -->
                        <div class="form-group">
                            <label>FECHA</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <asp:TextBox ID="txtFechaAtencion" runat="server" CssClass="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask=""></asp:TextBox>
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <!-- FIN CALENDARIO-->
                    </div>
                    <!-- </form> -->
                </div>
            </div>
            <!--rigth column -->
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <!-- <form role="form"> -->
                        <div class="form-group">
                            <label>ESPECIALIDAD</label>
                            <asp:DropDownList ID="ddlEspecialidad" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                        <!-- </form> -->
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-body">
                        <!-- <form role="form"> -->
                        <div class="input-group-">
                            <asp:Button ID="btnBuscarHorario" runat="server" CssClass="btn btn-danger" Text="Buscar" OnClick="btnBuscarHorario_Click" />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                    <!-- </form> -->
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="grdHorarioAtencion" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
                    <Columns>
                       <asp:TemplateField>
                           <HeaderTemplate>
                               <asp:Label ID="lblSeleccionarHeader" runat="server"></asp:Label>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <asp:CheckBox ID="chkSeleccionar" runat="server" ></asp:CheckBox>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField>
                           <HeaderTemplate>
                               <asp:Label ID="lblHoraHeader" runat="server" Text="Hora"></asp:Label>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <asp:Label ID="lblHora" runat="server" Text='<%#Eval("hora.hora") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField>
                           <HeaderTemplate>
                               
                               <asp:Label ID="lblMedicoHeader" runat="server" Text="Medico"></asp:Label>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <asp:HiddenField ID="citaIdMedico" runat="server" Value='<%#Eval("idMedico.idMedico") %>'/>
                               <asp:Label ID="lblMedico" runat="server" Text='<%#Eval("idMedico.Nombre")%>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:Button  ID="btnReservarCita"  Text="Reservar Cita" runat="server" CssClass="btn btn-primary" OnClick="btnReservarCita_Click" />
                
            </div>
        </div>
        
    </section>
            <%--<input type="hidden" id="txtIdPaciente"/>--%>
            <asp:HiddenField id="txtIdPaciente" runat="server"/>
        </ContentTemplate>

    </asp:UpdatePanel>
    
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script src="https://cdn.datatables.net/1.9.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
      <script src="js/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="js/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="js/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="js/reserva.js"></script>
</asp:Content>

