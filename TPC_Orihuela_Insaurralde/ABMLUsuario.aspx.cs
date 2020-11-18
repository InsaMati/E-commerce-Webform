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
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioUsuario NegocioUsuario = new NegocioUsuario();

            try
            {
                Lista = NegocioUsuario.ListarUsuarios();

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
    }
}