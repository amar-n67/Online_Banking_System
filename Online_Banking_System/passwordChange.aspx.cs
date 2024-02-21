using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace Online_Banking_System
{
    public partial class passwordChange : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(Accounts.GetConnectionString());
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select Password from Account where Password = '" + txtCurrentPassword.Text + "' ", con);

            DataTable dt = new DataTable();
           sqlDataAdapter.Fill(dt);
            if (dt.Rows.Count.ToString() == "1")
            {
                if(txtNewPassword.Text == txtConfirmNewPassword.Text)
                {
                    con.Open();
                    cmd = new SqlCommand("Update Account set Password = '" + txtConfirmNewPassword.Text + "' where Password = '" + txtCurrentPassword.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label7.Text = "Password changed Successfully.";
                    Label7.ForeColor = Color.Green;
                }
            }
            else
            {
                Label7.Text = "Enter Corect password.";
                Label7.ForeColor = Color.Red;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("passwordChange.aspx");
        }
    }
}