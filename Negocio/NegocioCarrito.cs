﻿using System;
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


    }
}
