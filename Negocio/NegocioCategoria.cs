using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioCategoria
    {
        public List<Categoria> ListarCategorias()
        {
            List<Categoria> Lista = new List<Categoria>();
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearQuery("select *from categorias");
                Datos.EjecutarLector();

                while (Datos.Leer.Read())
                {
                    Categoria AuxCate = new Categoria();

                    AuxCate.Id = Datos.Leer.GetInt32(0);
                    AuxCate.NombreCategoria = Datos.Leer.GetString(1);

                    Lista.Add(AuxCate);
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
