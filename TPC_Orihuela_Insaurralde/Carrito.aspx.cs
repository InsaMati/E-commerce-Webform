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
        public List<ElementoCarrito> ElementoC = new List<ElementoCarrito>();

        public double Total = new double();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ElementoC = (List<ElementoCarrito>)Session[Session.SessionID + "Lista"];

                if (ElementoC == null) Response.Redirect("inicio.aspx");

                var Id = Request.QueryString["id"];

                if (Id != null) EliminarArticulo(Convert.ToInt32(Id));

                CalcularTotal();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnVaciar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ElementoC != null)
                {
                    ElementoC.Clear();
                    Session[Session.SessionID + "Lista"] = ElementoC;
                    Response.Redirect("Carrito.aspx");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void EliminarArticulo(int ArticuloId)
        {
            try
            {
                ElementoCarrito Eliminar = ElementoC.Find(ChauArticulo => ChauArticulo.articulo.Id == ArticuloId);
                ElementoC.Remove(Eliminar);

                Session[Session.SessionID + "ListaElemento"] = ElementoC;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void CalcularTotal()
        {

            foreach (var Item in ElementoC)
            {
                Total += Item.SubTotal;
                Session[Session.SessionID + "Total"] = Total;
            }

        }


        protected void btnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Inicio.aspx");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnComprar_Click(object sender, EventArgs e)
        {
            try
            {
                if(ElementoC.Count > 0)
                {
                    Response.Redirect("Envios.aspx");
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}