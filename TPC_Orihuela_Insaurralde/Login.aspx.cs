using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegistrate_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Registro.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}