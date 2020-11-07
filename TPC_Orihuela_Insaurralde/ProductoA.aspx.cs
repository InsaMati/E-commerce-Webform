using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class ProductoA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioCategoria NegocioCategoria = new NegocioCategoria();
                NegocioMarca NegocioMarca = new NegocioMarca();

                DDCategoria.DataSource = NegocioCategoria.ListarCategorias();
                DDCategoria.DataBind();

                DDMarca.DataSource = NegocioMarca.ListarMarcas();
                DDMarca.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}