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
    public partial class UsuarioaModificar : System.Web.UI.Page
    {
        public List<TipoUsuario> Lista = new List<TipoUsuario>();
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioTipoUsuario NegocioTipoUsuario = new NegocioTipoUsuario();

            try
            {
                Lista = NegocioTipoUsuario.ListarTiposUsuarios();

                if (!IsPostBack)
                {

                    DDTipoUsuario.DataSource = Lista;
                    DDTipoUsuario.DataBind();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}