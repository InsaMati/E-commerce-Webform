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
    public partial class Registro : System.Web.UI.Page
    {
        public List<Genero> ListaGenero = new List<Genero>();
        public List<Provincia> ListaProvincias = new List<Provincia>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CargarListas();
                CargarDD();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CargarDD()
        {
            DDProvincia.DataSource = ListaProvincias;
            DDProvincia.DataBind();
            DDGenero.DataSource = ListaGenero;
            DDGenero.DataBind();
        }

        public void CargarListas()
        {
            NegocioGenero NegocioGenero = new NegocioGenero();
            NegocioProvincia NegocioProvincia = new NegocioProvincia();
            ListaProvincias = NegocioProvincia.ListarProvincias();
            ListaGenero = NegocioGenero.ListarGeneros();
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            NegocioUsuario Negocio = new NegocioUsuario();
            try
            {
                Usuario user = new Usuario();
                DatosPersonales Datos = new DatosPersonales();
                user.Email = TxtEmail.Text;
                user.Contraseña = TxtPassword.Text;
                user.TipoUsuario.Id = 3;
                Datos.Nombre = TxtNombre.Text;
                Datos.Apellido = TxtApellido.Text;
                Datos.Dni = Convert.ToInt32(TxtDni.Text);
                Datos.Genero.ID = DDGenero.SelectedIndex;
                Datos.Direccion = TxtDireccion.Text;
                Datos.Provincia.ID = DDProvincia.SelectedIndex;
                Negocio.RegistrarUsuario(user,Datos);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}