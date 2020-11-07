using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<CarritoCompra> ListaCarro = new List<CarritoCompra>();


        protected void Page_Load(object sender, EventArgs e)
        {
            ListaCarro = (List<CarritoCompra>)Session[Session.SessionID + "Lista"];

            if(ListaCarro == null)
            {

            }

        }
    }
}