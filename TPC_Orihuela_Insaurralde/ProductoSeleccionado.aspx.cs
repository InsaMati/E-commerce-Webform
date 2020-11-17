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

        public ElementoCarrito CargarArticulo = new ElementoCarrito();
        public List<ElementoCarrito> ListaCarrito = new List<ElementoCarrito>();


        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo NegArticulo = new NegocioArticulo();

            if (!IsPostBack)
            {
                TxtCantidad.Text = Convert.ToString(1);
            }

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

        protected void BtnDisminuir_Click(object sender, EventArgs e)
        {

            int Cantidad = Convert.ToInt32(TxtCantidad.Text);

            if (Cantidad > 0) TxtCantidad.Text = Convert.ToString(Cantidad - 1);


        }

        protected void BtnAumentar_Click(object sender, EventArgs e)
        {
            int cantidad = Convert.ToInt32(TxtCantidad.Text);
            TxtCantidad.Text = Convert.ToString(cantidad + 1);
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            CargarArticulo.Cantidad = Convert.ToInt32(TxtCantidad.Text);
            CargarArticulo.SubTotal = Convert.ToInt32(TxtCantidad.Text) * MostrarArticulo.Precio;
            CargarArticulo.articulo = MostrarArticulo;

            bool validar = new bool();

            if (Session[Session.SessionID + "Lista"] != null)
            {
                ListaCarrito = (List<ElementoCarrito>)Session[Session.SessionID + "Lista"];
            }

            foreach (var J in ListaCarrito)
            {
                if (J.articulo.Id == MostrarArticulo.Id)
                {

                    J.Cantidad += CargarArticulo.Cantidad;
                    J.SubTotal += CargarArticulo.SubTotal;
                    ListaCarrito.Remove(J);
                    ListaCarrito.Add(J);
                    Session[Session.SessionID + "Lista"] = ListaCarrito;
                    Response.Redirect("Carrito.aspx");

                    validar = true;
                }
                else
                {
                    validar = false;
                }


            }

            if (validar == false)
            {
                ListaCarrito.Add(CargarArticulo);
                Session[Session.SessionID + "Lista"] = ListaCarrito;
                Response.Redirect("Carrito.aspx");

            }
        }

    }
}


