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
    public partial class PedidoRechazado : System.Web.UI.Page
    {
        public string Email;
        public int IdUsuario = new int();
        public bool Alert = new bool();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                var IdPedido = Request.QueryString["ID"];
                var IdCarrito = Request.QueryString["Carrito"];

                if (IdPedido != null && IdCarrito != null)
                {
                    NegocioCarrito carrito = new NegocioCarrito();
                    NegocioUsuario Usuario = new NegocioUsuario();
                    IdUsuario = carrito.IdUsuario(Convert.ToInt32(IdCarrito));
                    Email = Usuario.BuscarMail(IdUsuario);

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnvolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ADMPedidos.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ValidarCampos()
        {

            string mensaje = TxtMensaje.Text.Trim();
            string motivo = TxtMotivo.Text.Trim();

            if (mensaje.Length == 0) return false;
            if (motivo.Length == 0) return false;

            return true;
        }

        protected void btnenviar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarCampos() == true)
                {
                    var IdPedido = Request.QueryString["ID"];

                    NegocioPedidos NegocioPedidos = new NegocioPedidos();
                    NegocioPedidos.ModificarEstado(Convert.ToInt32(IdPedido), 2);

                    EnvioEmails EnviarMail = new EnvioEmails();

                    if (Email != null)
                    {
                        EnviarMail.RechazoPedido(Email, TxtMotivo.Text);
                        NegocioPedidos.AgregarMotivoRechazo(Convert.ToInt32(IdPedido), TxtMotivo.Text, TxtMensaje.Text);

                    }

                    Response.Redirect("ADMPedidos.aspx");
                }
                else
                {
                    Alert = true;
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}