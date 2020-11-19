using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioTipoDePago
    {
        public List<TipoDePago> ListarTiposPago()
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {

                List<TipoDePago> Lista = new List<TipoDePago>();
                Datos.SetearQuery("select *From TIPO_DE_PAGO");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    TipoDePago Aux = new TipoDePago();
                    Aux.Id = Datos.Leeme.GetInt16(0);
                    Aux.Descripcion = Datos.Leeme.GetString(1);
                    Lista.Add(Aux);
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
