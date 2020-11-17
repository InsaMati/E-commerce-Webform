using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioProvincia
    {
        public List<Provincia> ListarProvincias()
        {
            AccesoADatos Datos = new AccesoADatos();
            try
            {
                List<Provincia> Lista = new List<Provincia>();
                Datos.SetearQuery("SELECT * FROM PROVINCIA");
                Datos.EjecutarLector();

                while(Datos.Leeme.Read())
                {
                    Provincia aux = new Provincia();
                    aux.ID = Datos.Leeme.GetInt16(0);
                    aux.Nombre = Datos.Leeme.GetString(1);
                    Lista.Add(aux);
                }

                return Lista;
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
