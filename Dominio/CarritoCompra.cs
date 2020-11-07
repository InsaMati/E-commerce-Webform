using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CarritoCompra
    {
        public Articulo ArticuloCarro { get; set; }

        public int Cantidad { get; set; }

        public double Subtotal { get; set; }
    }
}
