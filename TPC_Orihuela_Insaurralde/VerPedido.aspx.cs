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
    public partial class VerPedido : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();

        public List<ComprasPorUsuario> Lista = new List<ComprasPorUsuario>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");

                var IdPedido = Request.QueryString["IdPedido"];

                if (IdPedido != null)
                {
                    CargarLista(Convert.ToInt32(IdPedido));
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void CargarLista(int IdPedido)
        {
            NegocioUsuario NegocioUsuario = new NegocioUsuario();

            try
            {
                 Lista = NegocioUsuario.ListarCompras(IdPedido);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("MisCompras.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}