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
        protected void txtTerminar_Click(object sender, EventArgs e)
        {
            EnvioEmails mail = new EnvioEmails();
            mail.MailLinkDePago(Logueado.Email);

            Session[Session.SessionID + "Cuotas"] = 0;
            Response.Redirect("ConfirmarCompra.aspx");
        }
    }
}