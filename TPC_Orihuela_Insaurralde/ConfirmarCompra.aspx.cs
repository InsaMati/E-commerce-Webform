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
    public partial class ConfirmarCompra : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();

        public List<ElementoCarrito> ElementosCarrito = new List<ElementoCarrito>();
        public DatosEnvio InfoEnvio = new DatosEnvio();
        public int MedioPago = new int();
        public int Cuotas = new int();
        public double Total = new double();
        public DatosEnvio Envio = new DatosEnvio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");

                VariablesSession();

            }
        }

        public void VariablesSession()
        {

            try
            {
                ElementosCarrito = (List<ElementoCarrito>)Session[Session.SessionID + "Lista"];
                MedioPago = (int)Session[Session.SessionID + "IdMetodoPago"];

                if(MedioPago == 2) Cuotas = (int)Session[Session.SessionID + "Cuotas"];
                InfoEnvio = (DatosEnvio)Session[Session.SessionID + "DatosEnvio"];
                Total = (double)Session[Session.SessionID + "Total"];
                Envio = (DatosEnvio)Session[Session.SessionID + "DatosEnvio"];
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnConfirmarCompra_Click(object sender, EventArgs e)
        {

            try
            {
                VariablesSession();
                AgregarCarrito();
                Session.Remove(Session.SessionID + "Lista");

                if (MedioPago == 5) Response.Redirect("MercadoPago.aspx");

                Response.Redirect("inicio.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void AgregarCarrito()
        {

            try
            {
                NegocioCarrito NegocioCarrito = new NegocioCarrito();
                CarritoCompra Aux = new CarritoCompra();
                VariablesSession();

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                Aux.IdUsuario = Logueado.Id;
                Aux.CostoTotal = Total;

                NegocioCarrito.AltaCarrito(Aux);
                AltaElementoCarrito(NegocioCarrito.IdCarrito(Logueado));
                AltaPedido(NegocioCarrito.IdCarrito(Logueado), Logueado.Id);
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
                foreach (var Elemento in ElementosCarrito)
                {
                    ElementoCarrito Auxiliar = new ElementoCarrito();

                    Auxiliar.IdCarrito = IdCarrito;
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

        public void AltaPedido(int IdCarro, int IdUsuario)
        {
            NegocioCarrito NegocioCarrito = new NegocioCarrito();

            try
            {
                Pedido AuxPedido = new Pedido();
                AuxPedido.IDCarrito = IdCarro;

                AuxPedido.EstadoPedidos = new EstadoPedidos();
                AuxPedido.EstadoPedidos.Id = 1;
                AuxPedido.Fecha = DateTime.Now;
                NegocioCarrito.AltaPedido(AuxPedido);
                AltaFactura(NegocioCarrito.IdPedido(IdCarro), IdUsuario);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void AltaFactura(int IdPedido, int IdUsuario)
        {
            NegocioCarrito NegocioCarrito = new NegocioCarrito();

            try
            {
                VariablesSession();
                Factura AuxFactura = new Factura();

                AuxFactura.IDPedido = IdPedido;
                AuxFactura.IDUsuario = IdUsuario;
                AuxFactura.FechaFactura = DateTime.Now;
                AuxFactura.TipoDePago = new TipoDePago();
                AuxFactura.TipoDePago.Id = MedioPago;
                AuxFactura.Importe = Total;

                NegocioCarrito.AltaFactura(AuxFactura);

                AltaDatosEnvio(IdPedido);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void AltaDatosEnvio(int IdPedido)
        {
            NegocioEnvio NegocioEnvio = new NegocioEnvio();

            try
            {
                VariablesSession();

                NegocioEnvio.AltaEnvio(IdPedido,Envio);
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
                VariablesSession();

                if (MedioPago == 2) Response.Redirect("DatosTarjeta.aspx");
                if (MedioPago == 5) Response.Redirect("MetodoDePago.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}