using Dominio;
using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;
using System.Net.Cache;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioArticulo
    {
        public List<Articulo> ListarArticulos()
        {
            List<Articulo> Lista = new List<Articulo>();

            AccesoADatos Datos = new AccesoADatos();

            try
            {

                //// Crear VW
                Datos.SetearQuery("select P.ID, P.Codigo,P.Nombre, P.Descripcion, M.Nombre[Marca], C.Nombre[Categoria], P.ImagenUrl,P.Precio,M.ID, C.ID,P.Estado, P.Stock from ARTICULOS P, MARCA M, CATEGORIA C where P.IdMarca = m.Id AND P.IdCategoria = C.Id");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    Articulo Aux = new Articulo();

                    Aux.Id = Datos.Leeme.GetInt16(0);
                    Aux.Codigo = Datos.Leeme.GetString(1);
                    Aux.Nombre = Datos.Leeme.GetString(2);
                    Aux.Descripcion = Datos.Leeme.GetString(3);

                    Aux.Marca = new Marca();
                    Aux.Marca.Nombre = Datos.Leeme.GetString(4);

                    Aux.Categoria = new Categoria();
                    Aux.Categoria.Nombre = Datos.Leeme.GetString(5);

                    Aux.UrlImagen = Datos.Leeme.GetString(6);

                    Aux.Precio = Convert.ToDouble(Datos.Leeme.GetDecimal(7));
                    Aux.Marca.Id = Datos.Leeme.GetInt16(8);
                    Aux.Categoria.Id = Datos.Leeme.GetInt16(9);

                    Aux.Estado = Datos.Leeme.GetBoolean(10);

                    if(Aux.Estado == true) Lista.Add(Aux);

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

        public void AgregarArticulo(Articulo Nuevo)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

            }
        }
        public void EliminarProducto(int id)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearQuery("update ARTICULOS set Estado = @Estado where ID = @Id");
                Datos.AgregarParametro("@Estado", Convert.ToString(0));
                Datos.AgregarParametro("@Id", Convert.ToString(id));
                Datos.EjecutarLector();
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
