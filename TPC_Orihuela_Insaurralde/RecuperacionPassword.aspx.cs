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
        public int Alert = new int();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public bool ValidarEmail()
        {
            string email = txtEmail.Text.Trim();
            if (email.Length == 0) return false;
            return true;
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarEmail()==true)
                {
                    NegocioUsuario usuario = new NegocioUsuario();
                    EnvioEmails EnviarMail = new EnvioEmails();

                    string Password = usuario.RecuperarPassword(txtEmail.Text);

                    if (Password != null)
                    {
                        EnviarMail.MailRecuPass(txtEmail.Text, Password);
                        Alert = 3;
                    }
                    else
                    {
                        Alert = 1;
                    }

                }
                else
                {
                    Alert = 2;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }




    }
}