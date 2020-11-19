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
    public partial class UsuarioaModificar : System.Web.UI.Page
    {
        public List<TipoUsuario> ListaTS = new List<TipoUsuario>();
        public List<Usuario> ListaU = new List<Usuario>();

        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioTipoUsuario NegocioTipoUsuario = new NegocioTipoUsuario();
            NegocioUsuario NegocioUsuario = new NegocioUsuario();

            try
            {
                if (!IsPostBack)
                {
                    var UserChange = Request.QueryString["Pro"];

                    if (UserChange != null)
                    {
                        CargarLista();
                        Usuario Cambio = ListaU.Find(XS => XS.Id == int.Parse(UserChange));
                        CargarDD(Cambio.TipoUsuario.Id);
                        CargarTT(Cambio);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void CargarTT(Usuario Cambio)
        {
            TxtEmail.Text = Cambio.Email;
            TxtContraseña.Text = Criptografia.DesEncriptar(Cambio.Contraseña);
        }

        public void CargarLista()
        {
            NegocioUsuario NegocioUsuario = new NegocioUsuario();
            NegocioTipoUsuario NegocioTipoUsuario = new NegocioTipoUsuario();
            ListaU = NegocioUsuario.ListarUsuarios();
            ListaTS = NegocioTipoUsuario.ListarTiposUsuarios();
        }

        public void CargarDD(int IdTipo)
        {
            int IndexTipo = ListaTS.FindIndex(XS => XS.Id == IdTipo);
            DDTipoUsuario.DataSource = ListaTS;
            DDTipoUsuario.SelectedIndex = IndexTipo;
            DDTipoUsuario.DataBind();
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ABMLUsuario.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            NegocioUsuario NegocioUsuario = new NegocioUsuario();

            try
            {
                CargarLista();

                Usuario Aux = new Usuario();

                Aux.Id = Convert.ToInt32(Request.QueryString["Pro"]);
                Aux.Email = TxtEmail.Text;
                Aux.Contraseña = Criptografia.Encriptar(TxtContraseña.Text);
                Aux.TipoUsuario = new TipoUsuario();
                Aux.TipoUsuario = ListaTS.Find(XS => XS.Nombre == DDTipoUsuario.SelectedValue);
                Aux.Estado = true;
                NegocioUsuario.ModificarUsuario(Aux);

                Response.Redirect("ABMLUsuario.aspx");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }

}