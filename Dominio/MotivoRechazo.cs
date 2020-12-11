using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class MotivoRechazo
    {
        public int IDPedido { get; set; }
        public string Motivo { get; set; }
        public string Mensaje { get; set; }
    }
}
