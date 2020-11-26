using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Orihuela_Insaurralde
{
    public partial class ABMLCategoria : System.Web.UI.Page
    {
        public List<Categoria> Lista = new List<Categoria>();
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioCategoria Negocio = new NegocioCategoria();
                Lista = Negocio.ListarCategorias();

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");

                var Eliminar = Request.QueryString["ID"];

                if(Eliminar != null)
                {
                    Negocio.EliminarCategoria(Convert.ToInt32(Eliminar));
                    Response.Redirect("ABMLCategoria.aspx");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("CategoriaA.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}