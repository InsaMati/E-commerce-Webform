using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class DatosTarjeta : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
          

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnContinuar_Click(object sender, EventArgs e)
        {
            int cuotas = Convert.ToInt32(DDCuotas.SelectedValue);
            Session[Session.SessionID + "Cuotas"] = cuotas;

            try
            {
                Response.Redirect("ConfirmarCompra.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}