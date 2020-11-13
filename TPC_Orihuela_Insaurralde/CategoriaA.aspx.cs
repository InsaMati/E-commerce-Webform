using System;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class CategoriaA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                NegocioCategoria Negocio = new NegocioCategoria();
                var NuevaCategoria = Convert.ToString(txtCategoria.Text);
                Negocio.AgregarCategoria(NuevaCategoria);
                Response.Redirect("ABMLCategoria.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }

}