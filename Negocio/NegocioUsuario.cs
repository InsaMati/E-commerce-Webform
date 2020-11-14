using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioUsuario
    {
        public List<Usuario> ListarUsuarios()
        {
            List<Usuario> ListaUsuarios = new List<Usuario>();
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearQuery("SELECT * FROM USUARIO");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    var aux = new Usuario();

                    aux.Id = Datos.Leeme.GetInt32(0);
                    aux.Email = Datos.Leeme.GetString(1);
                    aux.Contraseña = Datos.Leeme.GetString(2);
                    aux.TipoUsuario.Id = Datos.Leeme.GetInt32(3);
                    aux.Estado = Datos.Leeme.GetBoolean(4);
                }
                return ListaUsuarios;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Datos.CerrarConexion();
            }
        }

    }
}
