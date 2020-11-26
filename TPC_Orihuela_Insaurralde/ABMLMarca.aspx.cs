using System;
using Negocio;
using Dominio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class ABMLMarca : System.Web.UI.Page
    {
        public List<Marca> Lista = new List<Marca>();
        public Usuario Logueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioMarca Negocio = new NegocioMarca();
            Lista = Negocio.ListarMarcas();

            Logueado = (Usuario)Session[Session.SessionID + "UsuarioLogueado"];
            if (Logueado == null) Response.Redirect("Login.aspx");
            if (Logueado.TipoUsuario.Id >= 3) Response.Redirect("Inicio.aspx");

            var Eliminar = Request.QueryString["ID"];

            if (Eliminar != null)
            {
                Negocio.EliminarMarca(Convert.ToInt32(Eliminar));
                Response.Redirect("ABMLMarca.aspx");
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Inicio.aspx");   
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("MarcaA.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}