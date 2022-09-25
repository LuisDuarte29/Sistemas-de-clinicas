using Capa_Entidades;
using Capa_LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Web.Services;

namespace Sistemas_de_clinicas
{
    public partial class GestionHorarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static Medico BuscarMedico(string dni)
        {

            return MedicoLN.getInstancia().BuscarMedico(dni);
        }

        [WebMethod]
        public static HorarioAtencion AgregarHorario(String fecha, String hora, String idmedico)
        {
            HorarioAtencion objHorarioAtencion = new HorarioAtencion()
            {
                Fecha = Convert.ToDateTime(fecha),
                hora = new Hora()
                {
                    hora = hora
                },
                idMedico = new Medico()
                {
                    idMedico = Convert.ToInt32(idmedico)
                },


            };
            return HorarioAtencionLN.getInstancia().RegistrarHorarioAtencion(objHorarioAtencion);// Es para enviar como un objeto donde estan los atributos de fecha,hora y idmedico//
        }

        [WebMethod]
        public static List<HorarioAtencion> ListaHorariosAtencion(String idmedico)
        {
            Int32 idMedico = Convert.ToInt32(idmedico);
            return HorarioAtencionLN.getInstancia().Listar(idMedico);
        }



        [WebMethod]
        public static bool EliminarHorarioAtencion(String id)
        {
            Int32 idHorarioAtencion = Convert.ToInt32(id);

            return HorarioAtencionLN.getInstancia().Eliminar(idHorarioAtencion);

        }

        [WebMethod]
        public static bool ActualizarHorarioAtencion(String idmedico, String idhorario, String fecha, String hora)
        {

            Int32 idMedico = Convert.ToInt32(idmedico);
            Int32 idHorario = Convert.ToInt32(idhorario);

            // crear un objeto HorarioAtencion
            HorarioAtencion objHorario = new HorarioAtencion()
            {
                IdHorarioAtencion = idHorario,
                idMedico = new Medico()
                {
                    idMedico = idMedico
                },
                Fecha = Convert.ToDateTime(fecha),
                hora = new Hora()
                {
                    hora = hora
                }
            };

            return HorarioAtencionLN.getInstancia().Editar(objHorario);
        }

    }
}













