﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Negocio
{
    public class AccesoADatos
    {
        public SqlDataReader Leeme { get; set; }
        public SqlConnection Conexion { get; }
        public SqlCommand Comando { get; set; }

        public AccesoADatos()
        {
           
            Conexion = new SqlConnection("data source=.\\SQLEXPRESS; initial catalog=TP_Final; integrated security=sspi");
            Comando = new SqlCommand();
            Comando.Connection = Conexion;
        }

        public void EjecutarLector()
        {
            try
            {
                Conexion.Open();
                Leeme = Comando.ExecuteReader();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void SetearQuery(string consulta)
        {
            Comando.CommandType = System.Data.CommandType.Text;
            Comando.CommandText = consulta;

        }

        public void AgregarParametroDateTime(string Nombre, DateTime valor)
        {
            Comando.Parameters.AddWithValue(Nombre, valor);

        }

        public void AgregarParametroSmallInt(string Nombre, int valor)
        {

            Comando.Parameters.AddWithValue(Nombre, Convert.ToInt16(valor));
        }

        public void AgregarParametroInt(string Nombre, int valor)
        {

            Comando.Parameters.AddWithValue(Nombre, valor);
        }
        public void AgregarParametro(string nombre, string valor)
        {
            Comando.Parameters.AddWithValue(nombre, valor);

        }

        public void SetearSp(string sp)
        {

            Comando.CommandType = System.Data.CommandType.StoredProcedure;
            Comando.CommandText = sp;

        }

        public void CerrarConexion()
        {
            Conexion.Close();
        }

    }
}

