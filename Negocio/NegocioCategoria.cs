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
                Datos.SetearQuery("select *from CATEGORIA");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    Categoria AuxCate = new Categoria();

                    AuxCate.Id = Datos.Leeme.GetInt16(0);
                    AuxCate.Nombre = Datos.Leeme.GetString(1);
                    AuxCate.Estado = Datos.Leeme.GetBoolean(2);

                    if (AuxCate.Estado == true) Lista.Add(AuxCate);

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
