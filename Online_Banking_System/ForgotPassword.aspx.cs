using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Drawing;
using System.Runtime.Remoting.Messaging;

namespace Online_Banking_System
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            string mycon = ConfigurationManager.ConnectionStrings["OnlineTransactionDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            string myquery = "Select Email, Password from [dbo].[Account] where Email=@Email";

            SqlCommand cmd = new SqlCommand(myquery, con);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                string username = sdr["Email"].ToString();
                string password = sdr["Password"].ToString();

                MailMessage mm = new MailMessage("Amarnath4172@gmail.com", txtEmail.Text);
                mm.Subject = "Your Password !";
                mm.Body = string.Format("Hello : <h1>{0}</h1> is your Email id <br/> your password is <h1>{1}</h1>", username, password);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = username;
                nc.Password = password;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = 587;
                smtp.Send(mm);
                Label4.Text = "Your Password has been sent " + txtEmail.Text;
                Label4.ForeColor = Color.Green;
            }
            else
            {
                Label4.Text = txtEmail.Text + "*** This Email ID not exist";
                Label4.ForeColor = Color.Red;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}