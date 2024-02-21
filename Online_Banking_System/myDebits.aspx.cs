using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.Util;
using System.Configuration;
using System.Reflection.Emit;

namespace Online_Banking_System
{
    public partial class myDebits : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dataTable;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                getMyDebits();
            }
            void getMyDebits()
            {
                try
                {
                    con = new SqlConnection(Accounts.GetConnectionString());
                    cmd = new SqlCommand(@"Select a.AccountNumber, a.UserName, t.Amount, t.Notes, t.TransactionDate from [Transactions] 
                                                    t inner join Account a on t.ReceiverAccountID = a.AccountID
                                                    where t.SenderAccountID = @SenderAccountID", con);
                    cmd.Parameters.AddWithValue("@SenderAccountID", Session["userId"]);
                    adapter = new SqlDataAdapter(cmd);
                    dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    gvMyDebitTransactions.DataSource = dataTable;
                    gvMyDebitTransactions.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(' " + ex.Message + " ');</script>");
                }
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["BankingTransactionDBConnctionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(mainconn);
            string sqlquery = "Select a.Ammount, t.Notes, t.TransactionDate, a.AccountNumber, a.UserName from [Transactions] t inner join [Account] a on t.ReceiverAccountID where Transaction between '" + txtFrom.Text + "'and '" + txtTo.Text + "'";
            SqlCommand command = new SqlCommand(@sqlquery, sqlConnection);
            sqlConnection.Open();

            SqlDataAdapter ad = new SqlDataAdapter(command);
            DataTable dt = new DataTable();

            ad.Fill(dt);
            SqlDataReader sqlDataReader = command.ExecuteReader();
            if (sqlDataReader.Read())
            {
               gvMyDebitTransactions.DataSource = dt;
                gvMyDebitTransactions.DataBind();
            }
            else
            {
                Label3.Text = "No records found";
            }
            sqlConnection.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

            Response.Redirect("myDebits.aspx");
        }
    }
}