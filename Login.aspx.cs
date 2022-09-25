using Capa_Entidades;
using Capa_LogicaNegocios;
using System;

namespace Sistemas_de_clinicas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ntnIngresar_Click(object sender, EventArgs e)
        {
            //String user = txtUsuario.Text;
            //String password = txtPassword.Text;
            //String userName = "Luis";
            //String passName = "Luis";
            //if(user.Equals(userName)&& password.Equals(passName)){
            //    Response.Write("<script>alert(`Esta correcto`)</script>");

            Empleado objEmpleado = EmpleadoLN.getInstance().AccesoSistema(txtUsuario.Text, txtPassword.Text);

            if (objEmpleado != null)
            {
                Response.Redirect("PanelGeneral.aspx");


            }
            else
            {
                Response.Write("<script>alert(`usuario incorrecto`)</script>");
            }

        }


    }
}