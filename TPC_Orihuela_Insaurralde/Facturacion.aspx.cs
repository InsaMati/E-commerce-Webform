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
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarListas();
            CargarDD();
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
    }
}