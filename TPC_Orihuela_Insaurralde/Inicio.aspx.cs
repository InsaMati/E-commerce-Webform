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
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VerificarLogueado();

                NegocioArticulo NegocioArticulo = new NegocioArticulo();
                
                ListaART = NegocioArticulo.ListarArticulos();

                RepetidorArticulos.DataSource = ListaART;
                RepetidorArticulos.DataBind();

                CargarDD();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CargarDD()
        {
            //// Categoria
            NegocioCategoria NegocioCategoria = new NegocioCategoria();

            DdCategoria.DataSource = NegocioCategoria.ListarCategorias();
            DdCategoria.DataBind();

            //// Marca
            NegocioMarca NegocioMarca = new NegocioMarca();

            DdMarca.DataSource = NegocioMarca.ListarMarcas();
            DdMarca.DataBind();

        }
        public void VerificarLogueado()
        {
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
            }
            catch (Exception ex)
            {

                throw ex;
            }
                     
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            List<Articulo> FiltroDeBusqueda;

            try
            {
                if (TxtFiltro.Text == "")
                {
                    FiltroDeBusqueda = ListaART;
                }
                else
                {
                    FiltroDeBusqueda = ListaART.FindAll(J => J.Nombre.ToLower().Contains(TxtFiltro.Text.ToLower()));
                    RepetidorArticulos.DataSource = FiltroDeBusqueda;
                    RepetidorArticulos.DataBind();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

            List<Articulo> FiltroDeBusqueda = new List<Articulo>();
            NegocioArticulo negocio = new NegocioArticulo();
            int idMar = DdMarca.SelectedIndex;
            int idCat = DdCategoria.SelectedIndex;
            int Pmin = Convert.ToInt32(txtPrecioMin.Text);
            int Pmax = Convert.ToInt32(txtPrecioMax.Text);

            try
            {
                if (idCat >=0 && idMar >=0 && Pmin >=0 && Pmax >0)
                {
                    FiltroDeBusqueda = negocio.ListarX_Mar_Cat_Pre(idMar, idCat, Pmin, Pmax);

                }
                else 
                {
                    FiltroDeBusqueda = ListaART;
                }

                RepetidorArticulos.DataSource = FiltroDeBusqueda;
                RepetidorArticulos.DataBind();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}