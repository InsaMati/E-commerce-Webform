using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioUsuario
    {
        public List<Usuario> ListarUsuarios()
        {
            List<Usuario> ListaUsuarios = new List<Usuario>();
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearQuery("select *from VW_Listar_Usuarios");
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    var aux = new Usuario();

                    aux.Id = Datos.Leeme.GetInt16(0);
                    aux.Email = Datos.Leeme.GetString(1);
                    aux.Contraseña = Datos.Leeme.GetString(2);
                    aux.Estado = Datos.Leeme.GetBoolean(3);
      
                    aux.TipoUsuario = new TipoUsuario();
                    aux.TipoUsuario.Id = Datos.Leeme.GetInt16(4);
                    aux.TipoUsuario.Nombre = Datos.Leeme.GetString(5);
                    
                    if (aux.Estado == true) ListaUsuarios.Add(aux);
                }
                return ListaUsuarios;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Datos.CerrarConexion();
            }
        }

        public List<Usuario> ListarUsuariosXTipo(int IDTipo)
        {
            List<Usuario> Lista = new List<Usuario>();
            AccesoADatos Datos = new AccesoADatos();
            try
            {
                Datos.SetearQuery("SP_ListarUsuarios");
                Datos.AgregarParametro("@Tipo", Convert.ToString(IDTipo));
                Datos.EjecutarLector();

                while (Datos.Leeme.Read())
                {
                    var aux = new Usuario();

                    aux.Id = Datos.Leeme.GetInt32(0);
                    aux.Email = Datos.Leeme.GetString(1);
                    aux.Contraseña = Datos.Leeme.GetString(2);

                    aux.TipoUsuario = new TipoUsuario();
                    aux.TipoUsuario.Id = Datos.Leeme.GetInt32(3);
                    aux.Estado = Datos.Leeme.GetBoolean(4);
                }

                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Datos.CerrarConexion();
            }
        }

        public void EliminarUsuario(int id)
        {
            AccesoADatos Datos = new AccesoADatos();
            try
            {
                Datos.SetearQuery("update USUARIO set Estado = 0 where ID = @ID");
                Datos.AgregarParametro("@ID", Convert.ToString(id));
                Datos.EjecutarLector();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void RegistrarUsuario(Usuario user, DatosPersonales UsuarioDatos)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_AgregarUsuario");
                Datos.AgregarParametro("@Email", user.Email);
                Datos.AgregarParametro("@Contraseña", user.Contraseña);
                Datos.AgregarParametroSmallInt("@IdTipoUsuario", user.TipoUsuario.Id);

                Datos.AgregarParametro("@Nombre", UsuarioDatos.Nombre);
                Datos.AgregarParametro("@Apellido", UsuarioDatos.Apellido);
                Datos.AgregarParametroInt("@Dni", UsuarioDatos.Dni);
                Datos.AgregarParametroSmallInt("@Genero", UsuarioDatos.Genero.ID);
                Datos.AgregarParametro("@Direccion", UsuarioDatos.Direccion);
                Datos.AgregarParametroSmallInt("@Provincia", UsuarioDatos.Provincia.ID);
                Datos.AgregarParametroDateTime("@FechaNacimiento", UsuarioDatos.FechaNacimiento);
                Datos.AgregarParametro("@Telefono", Convert.ToString(UsuarioDatos.Telefono));

                Datos.EjecutarLector();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public Usuario Login(Usuario Verificar)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_VERIFICAR_USUARIO");
                Datos.AgregarParametro("@Email", Verificar.Email);
                Datos.AgregarParametro("@Contraseña", Verificar.Contraseña);
                Datos.EjecutarLector();

                if (Datos.Leeme.Read())
                {
                    Verificar.Id = Datos.Leeme.GetInt16(0);
                    Verificar.Email = Datos.Leeme.GetString(1);
                    Verificar.Contraseña = Datos.Leeme.GetString(2);

                    Verificar.TipoUsuario = new TipoUsuario();

                    Verificar.TipoUsuario.Id = Datos.Leeme.GetInt16(3);
                    Verificar.Estado = Datos.Leeme.GetBoolean(4);

                }

                return Verificar;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void ModificarUsuario(Usuario cambio)
        {
            AccesoADatos Datos = new AccesoADatos();

            try
            {
                Datos.SetearSp("SP_Modificar_Usuario");
                Datos.AgregarParametro("@ID", Convert.ToString(cambio.Id));
                Datos.AgregarParametro("@Email", cambio.Email);
                Datos.AgregarParametro("@Contraseña", cambio.Contraseña);
                Datos.AgregarParametro("@IdTipoUsuario", Convert.ToString(cambio.TipoUsuario.Id));
                Datos.AgregarParametro("@Estado", Convert.ToString(cambio.Estado));
                Datos.EjecutarLector();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public string RecuperarPassword (String email)
        {
            List<Usuario> ListaUsuarios = new List<Usuario>();            

            try
            {

                ListaUsuarios = ListarUsuarios();
                Usuario aux = ListaUsuarios.Find(j => j.Email == email);
                string password = Criptografia.DesEncriptar( aux.Contraseña);               

                return password;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<ComprasPorUsuario> ListarCompras(int IdPedido)
        {
            AccesoADatos Datos = new AccesoADatos();
            List<ComprasPorUsuario> ListaArticulos = new List<ComprasPorUsuario>();

            try
            { 

                Datos.SetearSp("SP_Compras_X_Usuario");
                Datos.AgregarParametro("@ID_Pedido",Convert.ToString(IdPedido));
                Datos.EjecutarLector();

                while(Datos.Leeme.Read())
                {
                    ComprasPorUsuario Aux = new ComprasPorUsuario();

                    Aux.elementoCarrito = new ElementoCarrito();
                    Aux.elementoCarrito.articulo = new Articulo();
                    Aux.elementoCarrito.articulo.Nombre = Datos.Leeme.GetString(0);
                    Aux.elementoCarrito.articulo.Descripcion = Datos.Leeme.GetString(1);

                    Aux.elementoCarrito.Cantidad = Datos.Leeme.GetInt16(2);
                    Aux.elementoCarrito.SubTotal = (double)Datos.Leeme.GetDecimal(3);

                    ListaArticulos.Add(Aux);
                }

                return ListaArticulos;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Factura> ListarFacturas(Usuario Logueado)
        {
            AccesoADatos Datos = new AccesoADatos();
            List<Factura> Lista = new List<Factura>();

            try
            {
                Datos.SetearSp("sp_listar_facturas_por_usuario");
                Datos.AgregarParametro("@Id_Usuario", Convert.ToString(Logueado.Id));
                Datos.EjecutarLector();
                while (Datos.Leeme.Read())
                {
                    Factura AuxF = new Factura();

                    AuxF.ID = Datos.Leeme.GetInt16(0);
                    AuxF.IDPedido = Datos.Leeme.GetInt16(1);
                    AuxF.IDUsuario = Datos.Leeme.GetInt16(2);

                    AuxF.EstadoPedidos = new EstadoPedidos();
                    AuxF.EstadoPedidos.Descripcion = Datos.Leeme.GetString(3);

                    AuxF.FechaFactura = Datos.Leeme.GetDateTime(4);

                    AuxF.TipoDePago = new TipoDePago();
                    AuxF.TipoDePago.Descripcion = Datos.Leeme.GetString(5);

                    AuxF.Importe = (double)Datos.Leeme.GetDecimal(6);

                    Lista.Add(AuxF);

                }


                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
