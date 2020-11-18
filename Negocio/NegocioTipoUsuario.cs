using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioTipoUsuario
    {
        public List<TipoUsuario> ListarTiposUsuarios()
        {
            AccesoADatos Datos = new AccesoADatos();

            List<TipoUsuario> Lista = new List<TipoUsuario>();

            try
            {
                Datos.SetearQuery("select * From TIPO_DE_USUARIO");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    TipoUsuario Aux = new TipoUsuario();

                    Aux.Id = Datos.Leeme.GetInt16(0);
                    Aux.Nombre = Datos.Leeme.GetString(1);

                    Lista.Add(Aux);
                }

                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
     
    }
}
