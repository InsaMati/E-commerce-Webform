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
    public partial class RevisionPedidos : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        public List<PedidosRevision> Lista = new List<PedidosRevision>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
            if (Logueado == null) Response.Redirect("Login.aspx");
            if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");

            var IDPedido = Request.QueryString["ID"];

            if (IDPedido != null)
            {
                RetornarListas(Convert.ToInt32(IDPedido));
            }
        }


        public void RetornarListas(int IDPEDIDO)
        {
            NegocioPedidos NegocioPedidos = new NegocioPedidos();

            try
            {
                Lista = NegocioPedidos.Listar(IDPEDIDO);
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
                Response.Redirect("ADMPedidos.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }

    
}