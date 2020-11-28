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
    public partial class CategoriaA : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool ValidarTamanio()
        {

            string Categoria = txtCategoria.Text.Trim();
            if (Categoria.Length == 0) return false;

            return true;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarTamanio() == true)
                {
                    NegocioCategoria Negocio = new NegocioCategoria();
                    var NuevaCategoria = Convert.ToString(txtCategoria.Text);
                    Negocio.AgregarCategoria(NuevaCategoria);
                    Response.Redirect("ABMLCategoria.aspx");
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

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ABMLCategoria.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }

}