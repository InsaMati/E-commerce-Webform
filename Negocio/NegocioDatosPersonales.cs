using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioDatosPersonales
    {

        public void RegistrarDatosUsuario(DatosPersonales UsuarioDatos )
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_AgregarDatosPersonales");

                Datos.AgregarParametro("@IdUsuario", Convert.ToString(UsuarioDatos.ID_Usuario));
                Datos.AgregarParametro("@Nombre", UsuarioDatos.Nombre);
                Datos.AgregarParametro("@Apellido", UsuarioDatos.Apellido);
                Datos.AgregarParametroInt("@Dni", UsuarioDatos.Dni);
                Datos.AgregarParametroSmallInt("@Genero", UsuarioDatos.Genero.ID);
                Datos.AgregarParametro("@Direccion", UsuarioDatos.Direccion);
                Datos.AgregarParametroSmallInt("@Provincia", UsuarioDatos.Provincia.ID);
                Datos.AgregarParametroDateTime("@FechaNacimiento", UsuarioDatos.FechaNacimiento);
                Datos.AgregarParametro("@Telefono", Convert.ToString(UsuarioDatos.Telefono));
                Datos.EjecutarLector();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
