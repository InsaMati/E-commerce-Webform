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
    public partial class MercadoPago : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
            if (Logueado == null) Response.Redirect("Login.aspx");
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                EnvioEmails mail = new EnvioEmails();
                mail.MailLinkDePago(Logueado.Email);

                Response.Redirect("Inicio.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("MetodoDePago.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}