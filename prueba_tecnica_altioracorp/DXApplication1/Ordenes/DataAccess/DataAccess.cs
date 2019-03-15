using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Ordenes.DataAccess
{
    public class DataAccess
    {
        private SqlConnection _connection;
        private SqlDataAdapter _dataAdapter;
        private SqlCommandBuilder _commandBuilder;
        private string _cadenaConexion = string.Empty;
        public DataAccess()
        {
            this._cadenaConexion = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
        /// <summary>
        /// Inserta un nuevo cliente.
        /// </summary>
        /// <param name="Nombres"></param>
        /// <param name="Apellidos"></param>
        public void InsertarCliente(string Nombres, string Apellidos)
        {


            string sql = "sp_InsertarClientes";

            try
            {
                _connection = new SqlConnection(_cadenaConexion);
                SqlCommand cmd = new SqlCommand(sql, _connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Nombres", Nombres));
                cmd.Parameters.Add(new SqlParameter("@Apellidos", Apellidos));

                _connection.Open();
                cmd.ExecuteNonQuery();
               
            }
            catch (SqlException sqlExc)
            {
                throw new Exception(sqlExc.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }

        /// <summary>
        /// Actualiza un cliente.
        /// </summary>
        /// <param name="IdCliente"></param>
        /// <param name="Nombres"></param>
        /// <param name="Apellidos"></param>
        public void ActualizarCliente(int IdCliente, string Nombres, string Apellidos)
        {


            string sql = "sp_ActualizarClientes";

            try
            {
                _connection = new SqlConnection(_cadenaConexion);
                SqlCommand cmd = new SqlCommand(sql, _connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@IdCliente", IdCliente));
                cmd.Parameters.Add(new SqlParameter("@Nombres", Nombres));
                cmd.Parameters.Add(new SqlParameter("@Apellidos", Apellidos));

                _connection.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException sqlExc)
            {
                throw new Exception(sqlExc.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }
        /// <summary>
        /// Elimina un cliente.
        /// </summary>
        /// <param name="IdCliente"></param>
        public void EliminarCliente(int IdCliente)
        {


            string sql = "sp_EliminarClientes";

            try
            {
                _connection = new SqlConnection(_cadenaConexion);
                SqlCommand cmd = new SqlCommand(sql, _connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@IdCliente", IdCliente));

                _connection.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException sqlExc)
            {
                throw new Exception(sqlExc.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }
    }
}