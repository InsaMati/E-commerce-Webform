using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class ElementoCarrito
    {
        public int IdCarrito { get; set; }
        public Articulo articulo { get; set; }

        public int Cantidad { get; set; }

        public double SubTotal { get; set; }
    }
}
