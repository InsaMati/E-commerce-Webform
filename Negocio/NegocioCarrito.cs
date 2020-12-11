using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioCarrito
    {
        public void AltaCarrito(CarritoCompra Alta)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_Alta_Carrito");
                Datos.AgregarParametro("@IdUsuario", Convert.ToString(Alta.IdUsuario));
                Datos.AgregarParametro("@Costo", Convert.ToString(Alta.CostoTotal));
                Datos.AgregarParametro("@Estado", Convert.ToString(1));
                Datos.EjecutarLector();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int IdCarrito(Usuario Logueado)
        {
            AccesoADatos Datos = new AccesoADatos();

            int IdCarro = new int();
            try
            {
                Datos.SetearQuery("SELECT TOP 1 ID FROM Carrito where ID_Usuario = @IDUsuario ORDER BY ID DESC");
                Datos.AgregarParametro("@IDusuario", Convert.ToString(Logueado.Id));
                Datos.EjecutarLector();

                if (Datos.Leeme.Read())
                {
                    IdCarro = Datos.Leeme.GetInt16(0);

                }

                return IdCarro;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }


        public int IdPedido(int IdCarrito)
        {
            try
            {
                AccesoADatos Datos = new AccesoADatos();
                int IdPedido = new int();

                Datos.SetearQuery("select ID From PEDIDO where ID_carrito = @IdCarrito");
                Datos.AgregarParametro("@IdCarrito", Convert.ToString(IdCarrito));
                Datos.EjecutarLector();
                IdPedido = Datos.Leeme.GetInt16(0);

                return IdPedido;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int IdUsuario (int idCarrito)
        {
            try
            {
                AccesoADatos Datos = new AccesoADatos();                

                Datos.SetearQuery("SELECT TOP 1 ID_Usuario from Carrito where id=@IdCarrito");
                Datos.AgregarParametro("@IdCarrito", Convert.ToString(idCarrito));
                Datos.EjecutarLector();
                int idUsuario = Convert.ToInt32(Datos.Leeme.GetString(0));
                return idUsuario;


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void AltaPedido(Pedido Alta)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_Alta_Pedido");
                Datos.AgregarParametro("@IdCarrito", Convert.ToString(Alta.IDCarrito));
                Datos.AgregarParametro("@IdEstado", Convert.ToString(Alta.EstadoPedidos.Id));
                Datos.AgregarParametroDateTime("@Fecha", Alta.Fecha);
                Datos.EjecutarLector();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void AltaElemento(ElementoCarrito Alta)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_Alta_ElementoCarrito");
                Datos.AgregarParametro("@ID_carrito", Convert.ToString(Alta.IdCarrito));
                Datos.AgregarParametro("@ID_articulos", Convert.ToString(Alta.articulo.Id));
                Datos.AgregarParametro("@Cantidad", Convert.ToString(Alta.Cantidad));
                Datos.AgregarParametro("@Subtotal", Convert.ToString(Alta.SubTotal));
                Datos.EjecutarLector();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void AltaFactura(Factura AuxAlta)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_Alta_Factura");

                Datos.AgregarParametro("@ID_pedido", Convert.ToString(AuxAlta.IDPedido));
                Datos.AgregarParametro("@ID_usuario", Convert.ToString(AuxAlta.IDUsuario));
                Datos.AgregarParametroDateTime("@Fecha", AuxAlta.FechaFactura);
                Datos.AgregarParametro("@ID_FormPago", Convert.ToString(AuxAlta.TipoDePago.Id));
                Datos.AgregarParametro("@Importe", Convert.ToString(AuxAlta.Importe));
                Datos.EjecutarLector();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
