using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Banking_System
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblAccountnumber.Text = displayAccountsNumber();
            }
        }

        string displayAccountsNumber()
        {
            con = new SqlConnection(Accounts.GetConnectionString());
            cmd = new SqlCommand(@"Select 'ANC10203040500' + CAST( MAX (CAST( SUBSTRING( AccountNumber, 12, 50 ) AS INT)) +1 AS VARCHAR)
                                    AS AccountNumber from Account", con);
            con.Open();
            reader = cmd.ExecuteReader();
            string accountNumber = string.Empty;
            while (reader.Read())
            {
                accountNumber = reader["AccountNumber"].ToString();
            }
            reader.Close();
            con.Close();    
            return accountNumber;
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(Accounts.GetConnectionString());
            cmd = new SqlCommand(@"Insert into Account(AccountNumber,AccountType,UserName,Gender,Email,Address,Amount,Password) values(@AccountNumber,@AccountType,@UserName,@Gender,@Email,@Address,@Amount,@Password)", con);
            cmd.Parameters.AddWithValue("@AccountNumber", lblAccountnumber.Text);
            cmd.Parameters.AddWithValue("@AccounType", ddlAcconutType.Text);
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            cmd.Parameters.AddWithValue("@Gebder", ddlGender.SelectedValue);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            //cmd.Parameters.AddWithValue("@SecurityQuestionID", );
            //cmd.Parameters.AddWithValue("@Answer", );
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.Trim());
            cmd.Parameters.AddWithValue("@AccountNumber", txtPassword.Text.Trim());
            try
            {
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    Response.Redirect("login.aspx", false);
                }
                else
                {
                    error.InnerText = "Invalid Input.";
                }
            }
            catch (Exception ex) 
            {
                if (ex.Message.Contains("Voilation of UNIQUE KEY constraint"))
                {
                    error.InnerText = "User already exist.";
                }
                else
                {
                    Response.Write("<script> alert(Error - " + ex.Message + " ');<script>");
                }
            }
            finally
            {
                con.Close();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}