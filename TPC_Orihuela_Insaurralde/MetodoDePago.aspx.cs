using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class MetodoDePago : System.Web.UI.Page
    {
        public List<TipoDePago> ListaTP = new List<TipoDePago>();
        public Usuario Logueado = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");

                var Id = Request.QueryString["id"];

                Continuar(Convert.ToInt32(Id));

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CargarListas()
        {
            NegocioTipoDePago NegocioTipoDePago = new NegocioTipoDePago();
            ListaTP = NegocioTipoDePago.ListarTiposPago();
        }

        public void Continuar(int Id)
        {
            try
            {
                Session.Add(Session.SessionID + "IdMetodoPago", Id);

                switch (Id)
                {
                    case 2:
                        Response.Redirect("DatosTarjeta.aspx");
                        break;
                    case 5:
                        Response.Redirect("MercadoPago.aspx");
                        break;
                }

                

            }
            catch (Exception ex)
            {

                throw ex;
            }
           
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Envios.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }

            
        }

      
    }
}