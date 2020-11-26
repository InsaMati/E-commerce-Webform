using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioPedidos
    {
        public List<Pedido> ListarPedidos()
        {
            AccesoADatos Datos = new AccesoADatos();
            List<Pedido> Lista = new List<Pedido>();

            try
            {
                Datos.SetearQuery("select * from VW_ListarAdmPedidos");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    Pedido AuxPedido = new Pedido();

                    AuxPedido.id = Datos.Leeme.GetInt16(0);
                    AuxPedido.IDCarrito = Datos.Leeme.GetInt16(1);
                    AuxPedido.EstadoPedidos = new EstadoPedidos();

                    AuxPedido.EstadoPedidos.Id = Datos.Leeme.GetInt16(2);
                    AuxPedido.EstadoPedidos.Descripcion = Datos.Leeme.GetString(6);

                    AuxPedido.Fecha = Datos.Leeme.GetDateTime(3);
                    AuxPedido.Importe = (double)Datos.Leeme.GetDecimal(4);
                    AuxPedido.FormaPago = Datos.Leeme.GetString(5);

                    Lista.Add(AuxPedido);
                }

                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
