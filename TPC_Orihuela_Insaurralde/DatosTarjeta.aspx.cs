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
    public partial class DatosTarjeta : System.Web.UI.Page
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

        public bool ValidarTamanio()
        {
            string Tarjeta = TxtNumTarjeta.Text.Trim();
            string CVV = TxtCvv.Text.Trim();

            if (Tarjeta.Length == 0) return false;
            if (CVV.Length == 0) return false;
            if (TxtFechaVenci.Text.Length == 0) return false;
            
            return true;
        }

        protected void BtnContinuar_Click(object sender, EventArgs e)
        {
            int cuotas = Convert.ToInt32(DDCuotas.SelectedValue);
            Session[Session.SessionID + "Cuotas"] = cuotas;

            try
            {
                if (ValidarTamanio() == true)
                {
                    Response.Redirect("ConfirmarCompra.aspx");
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

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("MetodoDePago.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}