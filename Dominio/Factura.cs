using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Factura
    {
        public int ID { get; set; }

        public int IDPedido { get; set; }

        public int IDUsuario { get; set; }

        public DateTime FechaFactura { get; set; }

        //public FormaDePago FormaDePago { get; set; }

        public double Importe { get; set; }
    }
}
