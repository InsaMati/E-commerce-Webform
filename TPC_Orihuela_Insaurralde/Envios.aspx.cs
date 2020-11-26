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
    public partial class Envios : System.Web.UI.Page
    {
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
                if (Logueado == null) Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnContinuar_Click(object sender, EventArgs e)
        {
            DatosEnvio DatosEnvio = new DatosEnvio();

            try
            {
                DatosEnvio.IdPedido = 1;
                DatosEnvio.IdUsuario = Logueado.Id;
                DatosEnvio.Correo = DDcorreo.SelectedValue;
                DatosEnvio.Calle = TxtCalle.Text;
                DatosEnvio.EntreCalles = TxtEntreCalles.Text;
                DatosEnvio.CodigoPostal = Convert.ToInt32(TxtCodigoPostal.Text);

                Session.Add(Session.SessionID + "DatosEnvio", DatosEnvio);
                Response.Redirect("MetodoDePago.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}