using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class MarcaA : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");
                NegocioMarca Negocio = new NegocioMarca();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool Validar()
        {
            string Marca = txtMarca.Text.Trim();
            if (Marca.Length == 0) return false;
            return true;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Validar() == true)
                {
                    NegocioMarca Negocio = new NegocioMarca();
                    var NuevaMarca = Convert.ToString(txtMarca.Text);
                    Negocio.AgregarMarca(NuevaMarca);
                    Response.Redirect("ABMLMarca.aspx");
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                            alert('Error campos vacios.');
                        </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnvolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ABMLMarca.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}