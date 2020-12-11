using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;

namespace Negocio
{
    public class EnvioEmails
    {
        public void MailRegistro(Usuario Registrado, DatosPersonales Datos)
        {
            try
            {
                string Remitente = "TpcCuatrimestralInsaurralde@gmail.com";
                string contraseña = "AprueboOnoApruebo?";

                MailMessage Msj = new MailMessage();
                Msj.To.Add(Registrado.Email);
                Msj.Subject = "Registro";
                Msj.SubjectEncoding = System.Text.Encoding.UTF8;
                Msj.Body = "Bienvenido " + Datos.Nombre + " " + Datos.Apellido + " a trabajo practico cuatrimestral.";
                Msj.IsBodyHtml = false;
                Msj.From = new System.Net.Mail.MailAddress(Remitente);

                System.Net.Mail.SmtpClient Cliente = new SmtpClient();
                Cliente.Credentials = new System.Net.NetworkCredential(Remitente, contraseña);
                Cliente.Port = 587;
                Cliente.EnableSsl = true;
                Cliente.Host = "smtp.gmail.com";

                Cliente.Send(Msj);

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void MailRecuPass(string email, string password)
        {
            try
            {
                string Remitente = "TpcCuatrimestralInsaurralde@gmail.com";
                string contraseña = "AprueboOnoApruebo?";

                MailMessage Msj = new MailMessage();
                Msj.To.Add(email);
                Msj.Subject = "Recuperacion de contraseña";
                Msj.SubjectEncoding = System.Text.Encoding.UTF8;
                Msj.Body = "Estimado cliente. " +
                    "Su contraseña es " + password + "." +
                    "Le recomendamos cambiarla por su seguridad." +
                    "atte TPC.";
                Msj.IsBodyHtml = false;
                Msj.From = new System.Net.Mail.MailAddress(Remitente);

                System.Net.Mail.SmtpClient Cliente = new SmtpClient();
                Cliente.Credentials = new System.Net.NetworkCredential(Remitente, contraseña);
                Cliente.Port = 587;
                Cliente.EnableSsl = true;
                Cliente.Host = "smtp.gmail.com";

                Cliente.Send(Msj);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void MailLinkDePago(string email)
        {
            try
            {
                string Remitente = "TpcCuatrimestralInsaurralde@gmail.com";
                string contraseña = "AprueboOnoApruebo?";

                MailMessage Msj = new MailMessage();
                Msj.To.Add(email);
                Msj.Subject = "Link de pago";
                Msj.SubjectEncoding = System.Text.Encoding.UTF8;
                Msj.Body = "Estimado cliente. " +
                    "A continuacion encontrará el link para pagar su compra a través de mercado pago." +
                    "Linkdepago.mp" +
                    "Muchas gracias por su compra, no dude en consultarnos ante cualquier duda con su compra." +
                    "atte TPC.";
                Msj.IsBodyHtml = false;
                Msj.From = new System.Net.Mail.MailAddress(Remitente);

                System.Net.Mail.SmtpClient Cliente = new SmtpClient();
                Cliente.Credentials = new System.Net.NetworkCredential(Remitente, contraseña);
                Cliente.Port = 587;
                Cliente.EnableSsl = true;
                Cliente.Host = "smtp.gmail.com";

                Cliente.Send(Msj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    public void RechazoPedido(string email, string motivo)
    {
            try
            {
                string Remitente = "TpcCuatrimestralInsaurralde@gmail.com";
                string contraseña = "AprueboOnoApruebo?";

                MailMessage Msj = new MailMessage();
                Msj.To.Add(email);
                Msj.Subject = "Pedido rechazado";
                Msj.SubjectEncoding = System.Text.Encoding.UTF8;
                Msj.Body = "Estimado cliente. " +
                    "Su pedido ha sido rechazado por el siguiente motivo:" +
                    motivo +
                    "atte TPC.";
                Msj.IsBodyHtml = false;
                Msj.From = new System.Net.Mail.MailAddress(Remitente);

                System.Net.Mail.SmtpClient Cliente = new SmtpClient();
                Cliente.Credentials = new System.Net.NetworkCredential(Remitente, contraseña);
                Cliente.Port = 587;
                Cliente.EnableSsl = true;
                Cliente.Host = "smtp.gmail.com";

                Cliente.Send(Msj);
            }

            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}