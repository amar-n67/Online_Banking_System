<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="myDebits.aspx.cs" Inherits="Online_Banking_System.myDebits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPH" runat="server">
    <div align="center">
    <div>
        <h3> <u> My Debit Trtansactions</u></h3>
    </div>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="From :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFrom" runat="server" Height="28px" Width="150px" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Date *"
                    forecolor="Red" ControlToValidate="txtFrom" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="From :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTo" runat="server" Height="28px" Width="150px" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Date *"
                    forecolor="Red" ControlToValidate="txtTo" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td style="padding-right:7px;">
                <asp:Button ID="btnApply" runat="server" Text="Apply Filter" Height="28px" Style="color:darkcyan" OnClick="btnApply_Click" />
            </td>
            <td>
                 <asp:Button ID="btnClear" runat="server" Text="Clear Filter" Height="28px" Style="color:darkcyan" OnClick="btnClear_Click" CausesValidation="false" />
            </td>
        </tr>
        <asp:GridView ID="gvMyDebitTransactions" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Transaction Date">
                    <ItemTemplate>
                    <asp:Label id="transactionDate" runat="server" text='<%# Eval("TransactionDate") %>' ></asp:Label>
                </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="To Account">
                <ItemTemplate>
                <asp:Label id="accountnumber" runat="server" text='<%# Eval("AccountNumber") %>' ></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Holder Name">
                 <ItemTemplate>
                    <asp:Label id="HolderName" runat="server" text='<%# Eval("UserName") %>' ></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount">
            <ItemTemplate>
            <asp:Label id="amount" runat="server" text='<%# Eval("Amount") %>' ></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Notes">
            <ItemTemplate>
            <asp:Label id="notes" runat="server" text='<%# Eval("Notes") %>' ></asp:Label>
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
            </Columns>
        </asp:GridView> 
    </table>
    <table align="center">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="error" runat="server" style="color:red"></div>
</div>
</asp:Content>
