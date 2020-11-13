using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Orihuela_Insaurralde
{
    public partial class Registro : System.Web.UI.Page
    {
        public List<Genero> ListaGenero = new List<Genero>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CargarLista();
                CargarDD();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CargarDD()
        {
            DDGenero.DataSource = ListaGenero;
            DDGenero.DataBind();
        }

        public void CargarLista()
        {
            NegocioGenero NegocioGenero = new NegocioGenero();
            ListaGenero = NegocioGenero.ListarGeneros();
        }
    }
}