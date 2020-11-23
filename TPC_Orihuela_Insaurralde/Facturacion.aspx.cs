using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class Facturacion : System.Web.UI.Page
    {
        public List<TipoDePago> ListaTP = new List<TipoDePago>();

        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");

                CargarListas();
                CargarDD();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void CargarListas()
        {
            NegocioTipoDePago NegocioTipoDePago = new NegocioTipoDePago();
            ListaTP = NegocioTipoDePago.ListarTiposPago();
        }

        public void CargarDD()
        {
            DDTipoPago.DataSource = ListaTP;
            DDTipoPago.DataBind();
        }

        protected void BtnPagar_Click(object sender, EventArgs e)
        {

            NegocioCarrito NegocioCarrito = new NegocioCarrito();

            try
            {
                //CarritoCompra Aux = new CarritoCompra();
               // Aux.IdUsuario = Logueado.Id;
               // Aux.CostoTotal = (double)Session[Session.SessionID + "Total"];
                //NegocioCarrito.AltaCarrito(Aux);
                Factura Fac = new Factura();
                Fac.IDUsuario = Logueado.Id;
                Fac.IdFormaDePago = DDTipoPago.SelectedIndex;
                Fac.Importe = (double)Session[Session.SessionID + "Total"];
                NegocioCarrito.FacturarCarrito(Fac);
                //AltaElementoCarrito();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void AltaElementoCarrito(int IdCarrito)
        {
            NegocioCarrito negocioCarrito = new NegocioCarrito();

            try
            {
                List<ElementoCarrito> Lista = (List<ElementoCarrito>)Session[Session.SessionID + "Lista"];

                if (Lista == null) Response.Redirect("inicio.aspx");

                foreach (var Elemento in Lista)
                {
                    ElementoCarrito Auxiliar = new ElementoCarrito();

                    Auxiliar.IdCarrito = 1;
                    Auxiliar.articulo = new Articulo();
                    Auxiliar.articulo.Id = Elemento.articulo.Id;
                    Auxiliar.Cantidad = Elemento.Cantidad;
                    Auxiliar.SubTotal = Elemento.SubTotal;

                    negocioCarrito.AltaElemento(Auxiliar);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void AltaFactura()
        {
            try
            {

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("inicio.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}