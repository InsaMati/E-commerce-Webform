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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
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

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                NegocioCategoria Negocio = new NegocioCategoria();
                var CategoriaVieja = txtCategoria.Text;
                var CategoriaNueva = txtModificar.Text;
                Negocio.ModificarCategoria(CategoriaVieja, CategoriaNueva);
                Response.Redirect("ABMLCategoria.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}