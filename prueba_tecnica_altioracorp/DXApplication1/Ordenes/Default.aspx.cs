using System;

namespace Ordenes
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewArticulos.DataBind();
            }
        }
    }
}