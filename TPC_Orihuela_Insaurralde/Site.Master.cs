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
    public partial class SiteMaster : MasterPage
    {
        public Usuario Logueado = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            Logueado = (Usuario)Session["UsuarioLogueado"];

        }
    }
}