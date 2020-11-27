using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioEnvio
    {
        public void AltaEnvio(int IdPedido,DatosEnvio Informacion)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_Agregar_DatosEnvio");
                Datos.AgregarParametro("@IdPedido",Convert.ToString(IdPedido));
                Datos.AgregarParametro("@IdUsuario", Convert.ToString(Informacion.IdUsuario));
                Datos.AgregarParametro("@Correo", Informacion.Correo);
                Datos.AgregarParametro("@Localidad", Informacion.Localidad);
                Datos.AgregarParametro("@Calle", Informacion.Calle);
                Datos.AgregarParametro("@EntreCalles", Informacion.EntreCalles);
                Datos.AgregarParametro("@CodigoPostal", Convert.ToString(Informacion.CodigoPostal));
                Datos.EjecutarLector();
                
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
