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
        public string BuscarNombre(int IdUsuario)
        {
            try
            {
                AccesoADatos datos = new AccesoADatos();
                datos.SetearQuery("Select nombre from DATOS_PERSONALES where ID_usuario=@IdUsuario");
                datos.AgregarParametro("@IdUsuario",Convert.ToString(IdUsuario));
                datos.EjecutarLector();
                string nombre = datos.Leeme.GetString(0);
                return nombre;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
