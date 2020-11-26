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
    public partial class ConfirmarCompra : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();

        public List<ElementoCarrito> ElementosCarrito = new List<ElementoCarrito>();
        public DatosEnvio InfoEnvio = new DatosEnvio();
        public int MedioPago = new int();
        public int Cuotas = new int();
        public double Total = new double();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");

                VariablesSession();

            }
        }

        public void VariablesSession()
        {

            try
            {
                ElementosCarrito = (List<ElementoCarrito>)Session[Session.SessionID + "Lista"];
                MedioPago = (int)Session[Session.SessionID + "IdMetodoPago"];
                Cuotas = (int)Session[Session.SessionID + "Cuotas"];
                InfoEnvio = (DatosEnvio)Session[Session.SessionID + "DatosEnvio"];
                Total = (double)Session[Session.SessionID + "Total"];
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnConfirmarCompra_Click(object sender, EventArgs e)
        {


            try
            {

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}