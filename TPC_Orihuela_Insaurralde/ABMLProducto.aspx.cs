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
    public partial class ABMLProducto : System.Web.UI.Page
    {
        public List<Articulo> Lista = new List<Articulo>();
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioArticulo Negocio = new NegocioArticulo();
                Lista = Negocio.ListarArticulos();

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");

                var Eliminado = Request.QueryString["Pro"];

                if (Eliminado != null)
                {
                    
                    Negocio.EliminarProducto(Convert.ToInt32(Eliminado));
                    Response.Redirect("ABMLProducto.aspx");

                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnVolver_Click1(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Inicio.aspx");
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
                Response.Redirect("ProductoA.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}