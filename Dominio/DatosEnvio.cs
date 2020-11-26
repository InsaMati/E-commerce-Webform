using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DatosEnvio
    {
        public int IdPedido { get; set; }
        public int IdUsuario { get; set; }
        public string Correo { get; set; }
        public string Localidad { get; set; }
        public string Calle { get; set; }
        public string EntreCalles { get; set; }
        public int CodigoPostal { get; set; }
    }
}
