using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Banking_System
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["forgotPassword"] != null)
            {
                con = new SqlConnection(Accounts.GetConnectionString());
                cmd = new SqlCommand(@"Update Account set Password = @Password where AccountNumber=@AccountNumber", con);
                cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Accountnumber", Session["forgotPassword"]);
                try
                {
                    con.Open();
                    int r = cmd.ExecuteNonQuery();
                    if (r > 0)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {
                        error.InnerText = "Invalid Input.";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script> alert(Error - " + ex.Message + " ');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}