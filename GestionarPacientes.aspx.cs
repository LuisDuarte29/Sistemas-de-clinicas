using Capa_Entidades;
using Capa_LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Web.Services;

namespace Sistemas_de_clinicas
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }
        [WebMethod]
        public static List<Paciente> ListaPaciente()
        {
            List<Paciente> Lista = new List<Paciente>();

            try
            {

                Lista = PacienteLN.getInstance().ListaPaciente();



            }
            catch (Exception ex)
            {
                Lista = new List<Paciente>();
            }
            finally
            {

            }
            return Lista;


        }

        [WebMethod]
        public static bool ActualizarPaciente(String id, String direccion)
        {

            int idpaciente = Convert.ToInt32(id);
            string direccion1 = direccion;


            bool ok = PacienteLN.getInstance().Actualizar(idpaciente, direccion1);
            return true;


        }
        [WebMethod]
        public static bool EliminarDatosPaciente(string id)
        {
            Int32 idPaciente = Convert.ToInt32(id);

            bool ok = false;

            ok = PacienteLN.getInstance().EliminarPaciente(idPaciente);

            return ok;
        }

        protected void btnRegistar_Click(object sender, EventArgs e)
        {
            Paciente objPaciente = getEntity();

            bool response = PacienteLN.getInstance().RegistroSistema(objPaciente);
            if (response == true)
            {
                Response.Write("<script>alert(`Paciente Registrado`)</script>");
                txtNombre.Text = "";
                txtApMaterno.Text = "";
                txtApPaterno.Text = "";
                txtDireccion.Text = "";
                txtNroDocumento.Text = "";
                txtTelefono.Text = "";
                TxtEdad.Text = "";
                txtDireccion.Text = "";
                txtCorreo.Text = "";




            }
            else
            {
                Response.Write("<script>alert(`Paciente no Registrado`)</script>");
            }
        }
        public Paciente getEntity()
        {
            Paciente objPaciente = new Paciente();
            objPaciente.IdPaciente = 0;
            objPaciente.Nombre = txtNombre.Text;
            objPaciente.Sexo = (ddlSexo.SelectedValue == "Femenino") ? 'F' : 'M';
            objPaciente.NroDocumento = txtNroDocumento.Text;
            objPaciente.Telefono = txtTelefono.Text;
            objPaciente.edad = Convert.ToInt32(TxtEdad.Text);
            objPaciente.Estado = true;
            objPaciente.ApMaterno = txtApMaterno.Text;
            objPaciente.ApPaterno = txtApPaterno.Text;
            objPaciente.Direccion = txtDireccion.Text;
            objPaciente.correoElectronico = txtCorreo.Text;

            return objPaciente;
        }

    }

}