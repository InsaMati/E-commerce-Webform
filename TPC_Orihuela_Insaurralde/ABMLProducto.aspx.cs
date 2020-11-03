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
    public partial class ABMLProducto : System.Web.UI.Page
    {
        public List<Articulo> Lista = new List<Articulo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioArticulo Negocio = new NegocioArticulo();
                Lista = Negocio.ListarArticulos();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnVolver_Click1(object sender, EventArgs e)
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

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ProductoA.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}