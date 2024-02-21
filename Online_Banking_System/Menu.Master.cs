using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Banking_System
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["userId"] != null)
                {
                    Utils utils = new Utils();  
                    lblBalance.Text = utils.accountbalance(Convert.ToInt32(Session["userId"])).ToString();
                }
            }
            lblCurrentDate.Text = System.DateTime.Now.ToString();
            lblCurrenttime.Text = System.DateTime.Now.ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}