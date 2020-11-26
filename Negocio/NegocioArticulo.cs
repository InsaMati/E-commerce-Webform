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
                                
                Datos.SetearQuery("SELECT * FROM VW_ListarArticulos");
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
                    Aux.Stock = Datos.Leeme.GetInt16(11);
                    if (Aux.Estado == true) Lista.Add(Aux);

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
                Datos.SetearSp("SP_Agregar_Articulo");

                Datos.AgregarParametro("@Codigo", Nuevo.Codigo);
                Datos.AgregarParametro("@Nombre", Nuevo.Nombre);
                Datos.AgregarParametro("@Descripcion", Nuevo.Descripcion);
                Datos.AgregarParametro("@Marca", Convert.ToString(Nuevo.Marca.Id));
                Datos.AgregarParametro("@Categoria", Convert.ToString(Nuevo.Categoria.Id));
                Datos.AgregarParametro("@Imagen", Nuevo.UrlImagen);
                Datos.AgregarParametro("@Precio", Convert.ToString(Nuevo.Precio));
                Datos.AgregarParametro("@Stock", Convert.ToString(Nuevo.Stock));
                Datos.AgregarParametro("@Estado", Convert.ToString(1));

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

        public void ModificarArticulo (Articulo Modificar)
        {
            AccesoADatos Datos = new AccesoADatos();
             
            try
            {
                Datos.SetearSp("SP_Modificar_Articulo");

                Datos.AgregarParametro("@ID", Convert.ToString(Modificar.Id));
                Datos.AgregarParametro("@Codigo", Modificar.Codigo);
                Datos.AgregarParametro("@Nombre", Modificar.Nombre);
                Datos.AgregarParametro("@Descripcion", Modificar.Descripcion);
                Datos.AgregarParametro("@Marca", Convert.ToString(Modificar.Marca.Id));
                Datos.AgregarParametro("@Categoria", Convert.ToString(Modificar.Categoria.Id));
                Datos.AgregarParametro("@Imagen", Modificar.UrlImagen);
                Datos.AgregarParametro("@Precio", Convert.ToString(Modificar.Precio));
                Datos.AgregarParametro("@Stock", Convert.ToString(Modificar.Stock));
                Datos.AgregarParametro("@Estado", Convert.ToString(1));

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
