using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_Orihuela_Insaurralde
{
    public partial class ProductoSeleccionado : System.Web.UI.Page
    {
        public Articulo MostrarArticulo { get; set; }
        public List<Articulo> ListaArticulos { get; set; }



        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo NegArticulo = new NegocioArticulo();

            try
            {
                ListaArticulos = NegArticulo.ListarArticulos();
                var ArtSelec = Convert.ToInt32(Request.QueryString["Id"]);
                MostrarArticulo = ListaArticulos.Find(J => J.Id == ArtSelec);

            }
            catch (Exception ex)
            {

                throw ex;
            }
            

        }
    }
}