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
    public partial class CategoriaModificar : System.Web.UI.Page
    {
        public List<Categoria> BuscarCategoria = new List<Categoria>();
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");

                NegocioCategoria Negocio = new NegocioCategoria();
                BuscarCategoria = Negocio.ListarCategorias();
                var CategoriaVieja = Request.QueryString["ID"];
                Categoria CategoriaAux = BuscarCategoria.Find(J => J.Id == int.Parse(CategoriaVieja));
                txtCategoria.Text = CategoriaAux.Nombre;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool Validar()
        {
            string Categoria = txtModificar.Text.Trim();

            if (Categoria.Length == 0) return false;

            return true;
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Validar() == true)
                {
                    NegocioCategoria Negocio = new NegocioCategoria();
                    var CategoriaVieja = txtCategoria.Text;
                    var CategoriaNueva = txtModificar.Text;
                    Negocio.ModificarCategoria(CategoriaVieja, CategoriaNueva);
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

        protected void btnvolver_Click(object sender, EventArgs e)
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