using System;
using Negocio;
using Dominio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegistrate_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Registro.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario User = new Usuario();
                NegocioUsuario NegocioUsuario = new NegocioUsuario();

                User.Email = TxtEmail.Text;
                User.Contraseña = Criptografia.Encriptar(TxtPassword.Text);

                User = NegocioUsuario.Login(User);

                if (User.Id != 0)
                {
                    Session.Add("UsuarioLogueado", User);
                    Response.Redirect("inicio.aspx");
                }

                else
                { 
                    Console.WriteLine("Usuario o contraseña incorrectos");
                    Response.Redirect("Login.aspx");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}