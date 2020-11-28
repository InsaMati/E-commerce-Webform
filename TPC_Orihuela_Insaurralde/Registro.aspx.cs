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
                NegocioGenero NegocioGenero = new NegocioGenero();
                NegocioProvincia NegocioProvincia = new NegocioProvincia();

                if (!IsPostBack)
                {

                    List<Genero> ListaGenero = NegocioGenero.ListarGeneros();
                    DDGenero.DataSource = ListaGenero;
                    DDGenero.DataBind();

                    Session.Add("LGenero", ListaGenero);

                    List<Provincia> ListaProvincia = NegocioProvincia.ListarProvincias();
                    DDProvincia.DataSource = ListaProvincia;
                    DDProvincia.DataBind();

                    Session.Add("LProvincia", ListaProvincia);


                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool ValidarUsuario()
        {
            Usuario AuxUser = new Usuario();
            
            AuxUser.Email = TxtEmail.Text.Trim();
            AuxUser.Contraseña = TxtPassword.Text.Trim();
           
            if (AuxUser.Email.Length == 0) return false;
            if (AuxUser.Contraseña.Length == 0) return false;
                 
            return true;
        }

        public bool ValidarCliente()
        {
            DatosPersonales AuxDa = new DatosPersonales();

            AuxDa.Nombre = TxtNombre.Text.Trim();
            AuxDa.Apellido = TxtApellido.Text.Trim();
            string dni = TxtDni.Text.Trim();
            AuxDa.Direccion = TxtDireccion.Text.Trim();
            string telefono = TxtTelefono.Text.Trim();

            if (AuxDa.Nombre.Length == 0) return false;
            if (AuxDa.Apellido.Length == 0) return false;
            if (AuxDa.Direccion.Length == 0) return false;
            if (dni.Length == 0) return false;
            if (telefono.Length == 0) return false;

            return true;
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            NegocioUsuario NegocioUsuario = new NegocioUsuario();
            NegocioDatosPersonales negocioDatosPersonales = new NegocioDatosPersonales();

            try
            {
                if(ValidarCliente()==true && ValidarUsuario() == true)
                {
                    Usuario user = new Usuario();
                    DatosPersonales Datos = new DatosPersonales();
                    user.Email = TxtEmail.Text;
                    user.Contraseña = Criptografia.Encriptar(TxtPassword.Text);

                    user.TipoUsuario = new TipoUsuario();
                    user.TipoUsuario.Id = 3;
                    Datos.Nombre = TxtNombre.Text;
                    Datos.Apellido = TxtApellido.Text;
                    Datos.Dni = Convert.ToInt32(TxtDni.Text);

                    List<Genero> LGenero = (List<Genero>)Session["LGenero"];
                    Datos.Genero = LGenero.Find(G => G.Nombre == DDGenero.SelectedValue);

                    Datos.Direccion = TxtDireccion.Text;

                    List<Provincia> LProvincia = (List<Provincia>)Session["LProvincia"];
                    Datos.Provincia = LProvincia.Find(P => P.Nombre == DDProvincia.SelectedValue);
                    Datos.Telefono = Convert.ToInt32(TxtTelefono.Text);
                    Datos.FechaNacimiento = Convert.ToDateTime(TxtFecha.Text);

                    NegocioUsuario.RegistrarUsuario(user, Datos);
                    EnvioEmails Envio = new EnvioEmails();
                    Envio.MailRegistro(user, Datos);
                    Response.Redirect("inicio.aspx");
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

        protected void btnCancelar_Click(object sender, EventArgs e)
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