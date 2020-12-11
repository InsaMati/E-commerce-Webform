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
    public partial class VerRechazo : System.Web.UI.Page
    {
        public MotivoRechazo MotivoR = new MotivoRechazo();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioPedidos NegocioPedidos = new NegocioPedidos();

                var IdPedido = Request.QueryString["IdPedido"];

                if (IdPedido != null)
                {
                    MotivoR = NegocioPedidos.RetornarMotivo(Convert.ToInt32(IdPedido));
                    TxtMotivo.Text = MotivoR.Motivo;
                    TxtMensaje.Text = MotivoR.Mensaje;

                }
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
                Response.Redirect("MisCompras.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}