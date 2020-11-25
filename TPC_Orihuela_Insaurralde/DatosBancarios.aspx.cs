using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class DatosBancarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnPagar_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("MetodoDePago");
        }
    }
}