using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DatosPersonales
    {
        public int ID_Usuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Dni { get; set; }
        public string Direccion { get; set; }
        public Provincia Provincia { get; set; }
        public Genero Genero { get; set; }
        public int Telefono { get; set; }
        public DateTime FechaNacimiento { get; set; }

    }
}
