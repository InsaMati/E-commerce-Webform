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
    public partial class Inicio : System.Web.UI.Page
    {
        public List<Articulo> ListaART = new List<Articulo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioArticulo NegocioArticulo = new NegocioArticulo();
                
                ListaART = NegocioArticulo.ListarArticulos();

                RepetidorArticulos.DataSource = ListaART;
                RepetidorArticulos.DataBind();

                //// Categoria
                NegocioCategoria NegocioCategoria = new NegocioCategoria();

                DdCategoria.DataSource = NegocioCategoria.ListarCategorias();
                DdCategoria.DataBind();

                //// Marca
                NegocioMarca NegocioMarca = new NegocioMarca();

                DdMarca.DataSource = NegocioMarca.ListarMarcas();
                DdMarca.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}