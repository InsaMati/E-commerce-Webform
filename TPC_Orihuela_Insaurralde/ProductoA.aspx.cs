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

        public bool ValidarProducto()
        {
            Articulo Aux = new Articulo();

            Aux.Codigo = TxtCodigo.Text.Trim();
            Aux.Nombre = TxtNombre.Text.Trim();
            Aux.Descripcion = TxtDescripcion.Text.Trim();
            Aux.UrlImagen = TxtImagen.Text.Trim();
            string stock = TxtStock.Text.Trim();
            string precio = TxtPrecio.Text.Trim();

            if (Aux.Codigo.Length == 0) return false;
            if (Aux.Nombre.Length == 0) return false;
            if (Aux.Descripcion.Length == 0) return false;
            if (Aux.UrlImagen.Length == 0) return false;
            if (stock.Length == 0) return false;
            if (precio.Length == 0) return false;
            return true;
        }
        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarProducto()==true)
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

                    Response.Redirect("ABMLProducto.aspx");
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                            alert('Error campos vacios.');
                        </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }

            }
            catch (Exception ex)
            { 
                throw ex;
            }
        }
    }
}