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
    public partial class ABMLUsuario : System.Web.UI.Page
    {
        public List<Usuario> Lista = new List<Usuario>();
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioUsuario NegocioUsuario = new NegocioUsuario();

            try
            {
                Lista = NegocioUsuario.ListarUsuarios();

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");

                var Eliminado = Request.QueryString["User"];

                if (Eliminado != null)
                {
                    
                    NegocioUsuario.EliminarUsuario(Convert.ToInt32(Eliminado));
                    Response.Redirect("ABMLUsuario.aspx");

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
                Response.Redirect("Registro.aspx");
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
                Response.Redirect("Inicio.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}