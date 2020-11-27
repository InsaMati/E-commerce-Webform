using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
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

                if (ValidarTamanio() == true)
                {

                    DatosEnvio.IdUsuario = Logueado.Id;
                    DatosEnvio.Correo = DDcorreo.SelectedValue;
                    DatosEnvio.Localidad = TxtLocalidad.Text;
                    DatosEnvio.Calle = TxtCalle.Text;
                    DatosEnvio.EntreCalles = TxtEntreCalles.Text;
                    DatosEnvio.CodigoPostal = Convert.ToInt32(TxtCodigoPostal.Text);

                    Session.Add(Session.SessionID + "DatosEnvio", DatosEnvio);
                    Response.Redirect("MetodoDePago.aspx");
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                            alert('Error campos vacios.');
                        </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public bool ValidarTamanio()
        {
            DatosEnvio Envio = new DatosEnvio();

            Envio.Localidad = TxtLocalidad.Text.Trim();
            Envio.Calle = TxtCalle.Text.Trim();
            Envio.EntreCalles = TxtEntreCalles.Text.Trim();

            if (Envio.Localidad.Length == 0) return false;
            if (Envio.Calle.Length == 0) return false;
            if (Envio.EntreCalles.Length == 0) return false;
            if (TxtCodigoPostal.Text.Length == 0) return false;

            return true;
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Carrito.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}