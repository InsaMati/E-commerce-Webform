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
    public partial class ABMLCategoria : System.Web.UI.Page
    {
        public List<Categoria> Lista = new List<Categoria>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioCategoria Negocio = new NegocioCategoria();
                Lista = Negocio.ListarCategorias();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}