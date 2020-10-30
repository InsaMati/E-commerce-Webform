using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioMarca
    {
        public List<Marca> ListarMarcas()
        {
            List<Marca> Lista = new List<Marca>();
            AccesoADatos Datos = new AccesoADatos();

            try
            {

                Datos.SetearQuery("select *from marcas");
                Datos.EjecutarLector();

                while (Datos.Leer.Read())
                {
                    Marca AuxMarca = new Marca();

                    AuxMarca.Id = Datos.Leer.GetInt32(0);
                    AuxMarca.NombreMarca = Datos.Leer.GetString(1);

                    Lista.Add(AuxMarca);
                }

                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Datos.CerrarConexionDB();
            }
        }
    }
}
