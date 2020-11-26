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
    public partial class ProductoA : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");
                NegocioCategoria NegocioCategoria = new NegocioCategoria();
                NegocioMarca NegocioMarca = new NegocioMarca();

                if (!IsPostBack)
                {

                    List<Categoria> ListaCategoria = NegocioCategoria.ListarCategorias();
                    DDCategoria.DataSource = ListaCategoria;
                    DDCategoria.DataBind();

                    Session.Add("LCategoria", ListaCategoria);

                    List<Marca> ListaMarca = NegocioMarca.ListarMarcas();
                    DDMarca.DataSource = ListaMarca;
                    DDMarca.DataBind();

                    Session.Add("LMarca", ListaMarca);
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
                NegocioArticulo NegocioArticulo = new NegocioArticulo();

                Articulo ArticuloAux = new Articulo();

                ArticuloAux.Codigo = TxtCodigo.Text.Trim();
                ArticuloAux.Nombre = TxtNombre.Text.Trim();
                ArticuloAux.Descripcion = TxtDescripcion.Text.Trim();
                ArticuloAux.Precio = double.Parse(TxtPrecio.Text);
                ArticuloAux.UrlImagen = TxtImagen.Text.Trim();

                List<Marca> LMarca = (List<Marca>)Session["LMarca"];
                ArticuloAux.Marca = LMarca.Find(x => x.Nombre == DDMarca.SelectedValue);

                List<Categoria> LCategoria = (List<Categoria>)Session["LCategoria"];
                ArticuloAux.Categoria = LCategoria.Find(j => j.Nombre == DDCategoria.SelectedValue);

                ArticuloAux.Stock = Convert.ToInt16(TxtStock.Text);

                NegocioArticulo.AgregarArticulo(ArticuloAux);

                Response.Redirect("ProductoA.aspx");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}