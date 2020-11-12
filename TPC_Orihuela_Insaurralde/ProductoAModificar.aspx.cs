using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class ProductoAModificar : System.Web.UI.Page
    {

        public List<Marca> ListaM = new List<Marca>();
        public List<Articulo> BuscarArticulo = new List<Articulo>();
        public List<Categoria> ListaC = new List<Categoria>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var Modificar = Request.QueryString["Pro"];
                if (!IsPostBack)
                {

                    if (Modificar != null)
                    {
                        CargarListas();
                        Articulo Modificado = BuscarArticulo.Find(J => J.Id == int.Parse(Modificar));
                        CargarDropDown();
                        CargarTextbox(Modificado);
                    }

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void CargarListas()
        {
            NegocioMarca NegocioMarca = new NegocioMarca();
            NegocioCategoria NegocioCategoria = new NegocioCategoria();
            NegocioArticulo NegocioArticulo = new NegocioArticulo();

            ListaM = NegocioMarca.ListarMarcas();
            ListaC = NegocioCategoria.ListarCategorias();
            BuscarArticulo = NegocioArticulo.ListarArticulos();

        }

        public void CargarDropDown()
        {
            DDCategoria.DataSource = ListaC;
            DDCategoria.DataBind();

            DDMarca.DataSource = ListaM;
            DDMarca.DataBind();
        }

        public void CargarTextbox(Articulo Precargar)
        {
            TxtCodigo.Text = Precargar.Codigo;
            TxtNombre.Text = Precargar.Nombre;
            TxtDescripcion.Text = Precargar.Descripcion;
            TxtImagen.Text = Precargar.UrlImagen;
            TxtPrecio.Text = Convert.ToString(Precargar.Precio);
            TxtStock.Text = Convert.ToString(Precargar.Stock);

        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            try
            {

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
                Response.Redirect("ABMLProducto.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}