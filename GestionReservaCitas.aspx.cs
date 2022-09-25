using Capa_Entidades;
using Capa_LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistemas_de_clinicas
{
    public partial class GestionReservaCitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                LlenarEspecialidad();


            }


        }



        public void LlenarEspecialidad()
        {
            List<Especialidad> Lista = EspecialidadLN.getInstance().Listar();

            ddlEspecialidad.DataSource = Lista;
            ddlEspecialidad.DataValueField = "idEspecialidad";
            ddlEspecialidad.DataTextField = "Descripcion";
            ddlEspecialidad.DataBind();

        }

        //public List<HorarioAtencion> ListarReservaCitas()
        //{
        //    String fecha1 = "19/10/2024";
        //    DateTime fechaConvertida = Convert.ToDateTime(fecha1);

        //    List<HorarioAtencion> Lista = HorarioAtencionLN.getInstancia().ListarReservaCitas(1, fechaConvertida);
        //    grdHorarioAtencion.DataSource = Lista;
        //    grdHorarioAtencion.DataBind();
        //    return Lista;



        //}

        public List<ClassText> LlenarGrid()
        {
            List<ClassText> Lista = new List<ClassText>();
            Lista.Add(new ClassText { Hora = "10:00", Medico = "Juan Ortiz" });
            return Lista;
        }


        [WebMethod]
        public static Paciente BuscarPacienteDNI(String dni)
        {
            return PacienteLN.getInstance().BuscarPacienteDNI(dni);
        }

        public class ClassText
        {
            public String Hora { get; set; }
            public String Medico { get; set; }


        }

        protected void btnBuscarHorario_Click(object sender, EventArgs e)
        {
            if (!txtFechaAtencion.Text.Equals(string.Empty))
            {
                String fecha1 = txtFechaAtencion.Text;
                DateTime fechaConvertida = Convert.ToDateTime(fecha1);
                Int32 idEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);
                List<HorarioAtencion> Lista = HorarioAtencionLN.getInstancia().ListarReservaCitas(idEspecialidad, fechaConvertida);
                grdHorarioAtencion.DataSource = Lista;
                grdHorarioAtencion.DataBind();

            }
            else
            {
                Response.Write("coloque la fecha");
            }

        }

        protected void btnReservarCita_Click(object sender, EventArgs e)
        {
            if (!txtIdPaciente.Value.Equals(string.Empty) && seleccionarhorarioCheck())
            {
                Cita objCita = retornarElementos();

                bool response = CitaLN.getInstance().RegistroSistema(objCita);
                if (response)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alerta", "<script>alert('Se ha guardado el registro')</script>", false);
                }

            }



        }
        public bool seleccionarhorarioCheck()
        {
            foreach (GridViewRow row in grdHorarioAtencion.Rows)
            {
                CheckBox chkHorario = (row.FindControl("chkSeleccionar") as CheckBox);

                if (chkHorario.Checked)
                {
                    return true;
                }
            }


            return false;
        }
        public Cita retornarElementos()
        {
            Cita objCita = new Cita();
            Medico objMedico = new Medico();
            Paciente objPaciente = new Paciente();
            foreach (GridViewRow row in grdHorarioAtencion.Rows)
            {
                CheckBox chkHorario = (row.FindControl("chkSeleccionar") as CheckBox);

                if (chkHorario.Checked)
                {
                    objCita.hora = (row.FindControl("lblHora") as Label).Text;
                    objCita.fechaReserva = DateTime.Now;
                    string idMedico1 = (row.FindControl("citaIdMedico") as HiddenField).Value;
                    objMedico.idMedico = Convert.ToInt32(idMedico1);
                    objCita.idMedico = objMedico;

                    objPaciente.IdPaciente = Convert.ToInt32(txtIdPaciente.Value);
                    objCita.idPaciente = objPaciente;
                    break;
                }
            }


            return objCita;
        }
    }
}