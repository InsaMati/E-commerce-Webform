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
    public partial class MisCompras : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        public List<Factura> ListaF = new List<Factura>();
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");

                CargarLista(Logueado);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void CargarLista(Usuario Logueado)
        {
            NegocioUsuario NegocioUsuario = new NegocioUsuario();

            try
            {
                ListaF = NegocioUsuario.ListarFacturas(Logueado);


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}