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
    public partial class ADMPedidos : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();

        public Usuario Cliente = new Usuario();

        public List<Pedido> ListaPedidos = new List<Pedido>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
                if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");

                CargarLista();
                VariablesRequest();



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void VariablesRequest()
        {
            try
            {
                var IdPedido = Request.QueryString["ID"];
                var IdEstado = Request.QueryString["Estado"];

                if (IdPedido != null && IdEstado != null)
                {
                    AccionesPedidos(Convert.ToInt32(IdPedido), Convert.ToInt32(IdEstado));
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void CargarLista()
        {
            try
            {
                NegocioPedidos NegocioPedidos = new NegocioPedidos();
                ListaPedidos = NegocioPedidos.ListarPedidos();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public void AccionesPedidos(int IdPedido, int IdEstado)
        {
            try
            {
                NegocioPedidos NegocioPedidos = new NegocioPedidos();
                NegocioPedidos.ModificarEstado(IdPedido, IdEstado);
                CargarLista();
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
                Response.Redirect("inicio.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}