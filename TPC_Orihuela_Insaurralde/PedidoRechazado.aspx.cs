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
        public string Cliente;

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                var IdPedido = Request.QueryString["ID"];

                if (IdPedido != null)
                {
                    NegocioPedidos pedido = new NegocioPedidos();
                    NegocioCarrito carrito = new NegocioCarrito();
                    NegocioDatosPersonales DatosPer = new NegocioDatosPersonales();

                    int idCarrito = pedido.IdCarrito(Convert.ToInt32(IdPedido));
                    int IdUsuario = carrito.IdUsuario(idCarrito);
                    Cliente = DatosPer.BuscarNombre(IdUsuario);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }




        }
    }
}