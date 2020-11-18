using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pagos
    {
        public int Id { get; set; }
        public int IdFactura { get; set; }

        public TipoDePago tipoDePago { get; set; }

        public double Importe { get; set; }

    }
}
