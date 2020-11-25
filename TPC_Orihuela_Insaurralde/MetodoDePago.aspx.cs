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
    public partial class MetodoDePago : System.Web.UI.Page
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

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            int metodo = DDTipoPago.SelectedIndex;
            switch (metodo)
            {
                case 1:
                    Response.Redirect("");
                    break;
                case 2:
                    Response.Redirect("DatosTarjeta.aspx");
                    break;
                case 3:
                    Response.Redirect("DatosBancarios.aspx");
                    break;
                case 4:
                    Response.Redirect("");
                    break;
                case 5:
                    Response.Redirect("");
                    break;
            }
            //1) Efectivo
            //2) Tarjeta Credito/debito
            //3) Transferencia
            //4) Paypal
            //5) MercadoPago
    }
}