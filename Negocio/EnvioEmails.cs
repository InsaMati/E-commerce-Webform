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


    }
}