using System;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Criptografia
    {
        public static byte[] GenerateSalt()
        {
            const int SaltTamaño = 32;

            using (var GeneracionDeNumeroRandom = new RNGCryptoServiceProvider())
            {
                var NumeroRandom = new byte[SaltTamaño];
                GeneracionDeNumeroRandom.GetBytes(NumeroRandom);

                return NumeroRandom;
            }

        }


        private static byte[] Combine(byte[] Primero, byte[] Segundo)
        {

            //// Combina NumeroRandom + Password

            var retornado = new byte[Primero.Length + Segundo.Length];

            Buffer.BlockCopy(Primero, 0, retornado, 0, Primero.Length);
            Buffer.BlockCopy(Segundo, 0, retornado, Primero.Length, Segundo.Length);

            return retornado;
        }

        public static byte[]  HashPasswordWithSalt(byte[] ToBeHashed, byte[] salt)
        {
            using (var sha256 = SHA256.Create())
            {
                var CombinedHash = Combine(ToBeHashed, salt);
                return sha256.ComputeHash(CombinedHash);
            }

        }
    }
}
