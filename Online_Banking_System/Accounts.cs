using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

namespace Online_Banking_System
{
    public class Accounts
    {
        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["BankingTransactionDBConnectionString"].ConnectionString;
        }
    }
    public class Utils
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable datatable;

        public int accountbalance(int userID)
        {
            int balanceamount = 0;
            try
            {
                con = new SqlConnection(Accounts.GetConnectionString());
                cmd = new SqlCommand(@"Select Amount from Account where AccountID = @AccountID", con);
                cmd.Parameters.AddWithValue("@AccountID", userID);
                adapter = new SqlDataAdapter(cmd);
                datatable = new DataTable();
                adapter.Fill(datatable);
                balanceamount = Convert.ToInt32(datatable.Rows[0]["Amount"]) == 0 ? 0 : Convert.ToInt32(datatable.Rows[0]["Amount"]);
            }
            catch (Exception ex)
            {
                System.Web.HttpContext.Current.Response.Write("<script>alert('Error - '" + ex.Message + "); <script>");
            }
            return balanceamount;
        }
    }

}