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
                
                if (!IsPostBack)
                {
                    var Modificar = Request.QueryString["Pro"];
                   
                    if (Modificar != null)
                    {
                        CargarListas();
                        Articulo Modificado = BuscarArticulo.Find(J => J.Id == int.Parse(Modificar));
                        CargarDropDown(Modificado.Marca.Id,Modificado.Categoria.Id);
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

        public void CargarDropDown(int IdMarca, int IdCategoria)
        {
            int IndexCategoria = ListaC.FindIndex(J => J.Id == IdCategoria);
            int IndexMarca = ListaM.FindIndex(J => J.Id == IdMarca);

            DDCategoria.DataSource = ListaC;
            DDCategoria.SelectedIndex = IndexCategoria;
            DDCategoria.DataBind();

            DDMarca.DataSource = ListaM;
            DDMarca.SelectedIndex = IndexMarca;
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
            NegocioArticulo NegocioArticulo = new NegocioArticulo();

            try
            {

                CargarListas();

                Articulo AuxModificar = new Articulo();

                AuxModificar.Id = Convert.ToInt16(Request.QueryString["Pro"]);
                AuxModificar.Codigo = TxtCodigo.Text;
                AuxModificar.Nombre = TxtNombre.Text;
                AuxModificar.Descripcion = TxtDescripcion.Text;
                AuxModificar.Marca = ListaM.Find(BuscarMarca => BuscarMarca.Nombre == DDMarca.SelectedValue);
                AuxModificar.Categoria = ListaC.Find(BuscarCategoria => BuscarCategoria.Nombre == DDCategoria.SelectedValue);
                AuxModificar.UrlImagen = TxtImagen.Text;
                AuxModificar.Precio = double.Parse(TxtPrecio.Text);
                AuxModificar.Stock = Convert.ToInt16(TxtStock.Text);

                NegocioArticulo.ModificarArticulo(AuxModificar);

                Response.Redirect("ABMLProducto.aspx");

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