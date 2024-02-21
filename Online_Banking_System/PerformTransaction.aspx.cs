using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Util;

namespace Online_Banking_System
{
    public partial class PerformTransaction : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dataTable;
        SqlDataReader dr;
        SqlTransaction transaction = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                getAccountNumber();    
            }
        }
        void getAccountNumber()
        {
            try
            {
                con = new SqlConnection(Accounts.GetConnectionString());
                cmd = new SqlCommand(@"Select AccountID, Accountnumber from Account where AccountID != @AccountID ", con);
                cmd.Parameters.AddWithValue("@AccountID", Session["userId"]);
                adapter = new SqlDataAdapter(cmd);
                dataTable = new DataTable();
                adapter.Fill(dataTable);
                ddlHolderAccountNumber.DataSource = dataTable;
                ddlHolderAccountNumber.DataTextField = "AccountNumber";
                ddlHolderAccountNumber.DataValueField = "AccountID";
                ddlHolderAccountNumber.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script(' " + ex.Message + " ');<script>");
            }
        }

        protected void btnSent_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                con = new SqlConnection(Accounts.GetConnectionString());
                con.Open();
                try
                {
                    int r = 0;
                    Utils utils = new Utils();
                    int BalanceAmount = utils.accountbalance(Convert.ToInt32(Session["userId"]));
                    if (Convert.ToInt32(txtAmount.Text.Trim()) <= BalanceAmount)
                    {
                        transaction = con.BeginTransaction();
                        cmd = new SqlCommand(@"Insert into [Transactions](SenderAccountID,ReceiverAccountID,mobileNumber,Amount,TransactionType,Notes,TransactionDate) values
                                             (@SenderAccountID,@ReceiverAccountID,@mobileNumber,@Amount,@TransactionType,@Notes,@TransactionDate)", con, transaction);
                        cmd.Parameters.AddWithValue("@SenderAccountID", Session["userId"]);
                        cmd.Parameters.AddWithValue("@ReceiverAccountID", ddlHolderAccountNumber.SelectedValue);
                        cmd.Parameters.AddWithValue("@mobileNumber", txtMobileNumber.Text.Trim());
                        cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.Trim());
                        cmd.Parameters.AddWithValue("@TransactionType", "DR");
                        cmd.Parameters.AddWithValue("@Notes", txtNotes.Text.Trim());
                        cmd.Parameters.AddWithValue("@TransactionDate", System.DateTime.Now);
                        r = cmd.ExecuteNonQuery();

                        UpdateSenderAccountBalance(Convert.ToInt32(Session["userId"]), BalanceAmount, Convert.ToInt32(txtAmount.Text.Trim()), con, transaction);
                        UpdateReceiverAccountBalance(Convert.ToInt32(ddlHolderAccountNumber.SelectedValue), Convert.ToInt32(txtAmount.Text.Trim()), con, transaction);
                        transaction.Commit();
                        r = 1;
                        if (r > 0)
                        {
                            Response.Redirect("myDebits.aspx", false);
                        }
                        else
                        {
                            error.InnerText = "Invalid Input";
                        }
                    }
                    else
                    {
                        error.InnerText = "Invalid Input";
                    }
                }
                catch (Exception)
                {
                    try
                    {
                        transaction.Rollback();
                    }
                    catch(Exception ex) 
                    {
                        Response.Write("<script(' " + ex.Message + " ');<script>");
                    }
                }
                finally
                {
                    con.Close();
                }
            }
        }

        void UpdateSenderAccountBalance(int _senderId, int _dbAmount, int _amount, SqlConnection sqlConnection, SqlTransaction sqlTransaction)
        {
            try
            {
                if(_dbAmount >= _amount)
                {
                    cmd = new SqlCommand("Update Account set Amount=@Amount where AccountID, @AccountID", sqlConnection, sqlTransaction);
                    cmd.Parameters.AddWithValue("@Amount", _dbAmount);
                    cmd.Parameters.AddWithValue("@AccountID", _senderId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script(' " + ex.Message + " ');<script>");
            }
        }
        void UpdateReceiverAccountBalance(int _receiverId, int _amount, SqlConnection sqlConnection, SqlTransaction sqlTransaction)
        {
            int _dbAmount = 0;
            cmd = new SqlCommand("Select Amount from Account where AccountID, @AccountID", sqlConnection, sqlTransaction);
            cmd.Parameters.AddWithValue("@AccountID", _receiverId);
            try
            {
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    _dbAmount = (int)dr["Amount"];
                    _dbAmount = _dbAmount + _amount;
                    cmd = new SqlCommand("Update Account set Amount=@Amount where AccountID=@AccountID", sqlConnection, sqlTransaction);
                    cmd.Parameters.AddWithValue("@Amount", _dbAmount);
                    cmd.Parameters.AddWithValue("@AccountID", _receiverId);
                    cmd.ExecuteNonQuery ();
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script(' " + ex.Message + " ');<script>");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerformTransaction.aspx");
        }
    }
}