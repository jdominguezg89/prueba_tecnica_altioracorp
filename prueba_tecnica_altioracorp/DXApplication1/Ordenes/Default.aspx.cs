using System;

namespace Ordenes
{
    public partial class _Default : System.Web.UI.Page
    {
        private BusinessLogic.BusinessLogic _businessLogic;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewArticulos.DataBind();
                GridViewOrdenes.DataBind();
            }
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                _businessLogic = new BusinessLogic.BusinessLogic();
                _businessLogic.InsertarCliente(txbNombres.Text, txbApellidos.Text);
                txbNombres.Text = "";
                txbApellidos.Text = "";
                GridViewClientes.DataBind();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfIdCliente.Value != null)
                {
                    _businessLogic = new BusinessLogic.BusinessLogic();
                    _businessLogic.ActualizarCliente(int.Parse(hfIdCliente.Value.ToString()), txbNombres.Text, txbApellidos.Text);
                    txbNombres.Text = "";
                    txbApellidos.Text = "";
                    GridViewClientes.DataBind();
                }
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfIdCliente.Value != null)
                {
                    _businessLogic = new BusinessLogic.BusinessLogic();
                    _businessLogic.EliminarCliente(int.Parse(hfIdCliente.Value.ToString()));
                    txbNombres.Text = "";
                    txbApellidos.Text = "";
                    GridViewClientes.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}