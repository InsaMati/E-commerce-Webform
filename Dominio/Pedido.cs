using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int id { get; set; }

        public int IDCarrito { get; set; }
        public EstadoPedidos EstadoPedidos { get; set; }
        public DateTime Fecha { get; set; }
    }
}
