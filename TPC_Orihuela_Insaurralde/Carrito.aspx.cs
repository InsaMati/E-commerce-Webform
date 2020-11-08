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

        protected void btnVaciar_Click(object sender, EventArgs e)
        {
            if (ListaCarro != null)
            {
                ListaCarro.Clear();
                Session[Session.SessionID + "Lista"] = ListaCarro;
                Response.Redirect("Carrito.aspx");
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
    }
}