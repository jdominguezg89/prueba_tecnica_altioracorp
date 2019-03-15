using System;

namespace Ordenes.BusinessLogic
{
    public class BusinessLogic
    {
        private Ordenes.DataAccess.DataAccess _dataAccess;
        public BusinessLogic()
        {
            this._dataAccess = new DataAccess.DataAccess();
        }

        /// <summary>
        /// Inserta un nuevo cliente.
        /// </summary>
        /// <param name="Nombres"></param>
        /// <param name="Apellidos"></param>
        public void InsertarCliente(string Nombres, string Apellidos)
        {
            try
            {
                _dataAccess.InsertarCliente(Nombres, Apellidos);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
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
            try
            {
                _dataAccess.ActualizarCliente(IdCliente, Nombres, Apellidos);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Elimina un cliente.
        /// </summary>
        /// <param name="IdCliente"></param>
        public void EliminarCliente(int IdCliente)
        {
            try
            {
                _dataAccess.EliminarCliente(IdCliente);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}