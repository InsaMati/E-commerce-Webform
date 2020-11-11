using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class MarcaA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NegocioMarca Negocio = new NegocioMarca();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                NegocioMarca Negocio = new NegocioMarca();
                var NuevaMarca = Convert.ToString(txtMarca);
                Negocio.AgregarMarca(NuevaMarca);
                Response.Redirect("ABMLMarca.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}