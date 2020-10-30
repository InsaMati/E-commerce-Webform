using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioArticulo
    {
        public List<Articulo> ListaDeArticulos()
        {
            List<Articulo> Lista = new List<Articulo>();
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearQuery("select P.Id, P.Codigo,P.Nombre, P.Descripcion, M.Descripcion[Marca], C.Descripcion[Categoria], P.ImagenUrl,P.Precio,M.Id, C.Id from ARTICULOS P, MARCAS M, CATEGORIAS C where P.IdMarca = m.Id AND P.IdCategoria = C.Id");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    Articulo Art = new Articulo();

                    Art.Id = Datos.Leeme.GetInt32(0);
                    Art.Codigo = Datos.Leeme.GetString(1);
                    Art.Nombre = Datos.Leeme.GetString(2);
                    Art.Descripcion = Datos.Leeme.GetString(3);

                    Art.Marca = new Marca();
                    Art.Marca.Nombre = Datos.Leeme.GetString(4);

                    Art.Categoria = new Categoria();
                    Art.Categoria.Nombre = Datos.Leeme.GetString(5);

                    Art.UrlImagen = Datos.Leeme.GetString(6);

                    Art.Precio = (double)Datos.Leeme.GetDecimal(7);

                    Art.Marca.Id = Datos.Leeme.GetInt32(8);
                    Art.Categoria.Id = Datos.Leeme.GetInt32(9);

                    Lista.Add(Art);
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
