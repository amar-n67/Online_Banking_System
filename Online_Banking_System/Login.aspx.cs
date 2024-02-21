using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Online_Banking_System
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(Accounts.GetConnectionString());
            cmd = new SqlCommand(@"Select * from Account where AccountNumber=@AccountNumber and Password=@Password", con);
            cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                bool isTrue = false;
                while(reader.Read())
                {
                    isTrue = true;
                    Session["userID"] = reader["AccountId"].ToString();
                }
                if (isTrue)
                {
                    Response.Redirect("PerformTransaction.aspx", false);
                }
                else
                {
                    error.InnerText = "Invalid Input.";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert(Error - " + ex.Message + " ');<script>");
            }
            finally
            {
                reader.Close();
                con.Close();
            }
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void lblForgotPassword_Click(object sender, EventArgs e)
        {
            if(txtAccountNumber.Text.Trim() == string.Empty)
            {
                error.InnerText = "Invalid Input.";
                txtAccountNumber.Focus();
            }
            else
            {
                Session["ForgotPassword"] = txtAccountNumber.Text.Trim();
                Response.Redirect("ForgotPassword.aspx");
            }
        }
    }
}

