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
                Datos.SetearSp("");
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

        public void AltaElemento(ElementoCarrito Alta)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void FacturarCarrito (Factura aux)
        {
            AccesoADatos Datos = new AccesoADatos();
            try
            {
                Datos.SetearSp("SP_ComprarCarrito");
                Datos.AgregarParametro("@ID_Pedido",Convert.ToString(aux.IDPedido));
                Datos.AgregarParametro("@IdUsuario", Convert.ToString(aux.IDUsuario));
                Datos.AgregarParametro("@ID_FormaDePago", Convert.ToString(aux.IdFormaDePago));
                Datos.AgregarParametro("@CostoTotal", Convert.ToString(aux.Importe));
                Datos.EjecutarLector();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
