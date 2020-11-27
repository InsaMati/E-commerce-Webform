using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class PedidosRevision
    {
        public Articulo Articulo { get; set; }

        public ElementoCarrito ElementoCarrito { get; set; }

        public DatosEnvio DatosEnvio { get; set; }
    }
}
