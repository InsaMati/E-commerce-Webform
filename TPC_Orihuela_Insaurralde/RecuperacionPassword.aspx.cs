using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class RecuperacionPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            try
            {
                NegocioUsuario usuario = new NegocioUsuario();
                EnvioEmails EnviarMail = new EnvioEmails();

                string Password = usuario.RecuperarPassword(txtEmail.Text);
                EnviarMail.MailRecuPass(txtEmail.Text, Password);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        

                
    }
}