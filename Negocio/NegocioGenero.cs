using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dominio;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioGenero
    {

        public List<Genero>ListarGeneros()
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                List<Genero> ListaG = new List<Genero>();

                Datos.SetearQuery("select *From GENERO");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    Genero AuxG = new Genero();
                    AuxG.ID = Datos.Leeme.GetInt16(0);
                    AuxG.Nombre = Datos.Leeme.GetString(1);
                    ListaG.Add(AuxG);
                }

                return ListaG;

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
