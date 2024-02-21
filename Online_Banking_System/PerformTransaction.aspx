<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="PerformTransaction.aspx.cs" Inherits="Online_Banking_System.PerformTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPH" runat="server">
    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <h3><u><b>New Transaction</b></u></h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Holder Account Number :-"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlHolderAccountNumber" runat="server" Height="28px" AppendDataBoundItems="true">
                    <asp:ListItem Value="0"> Please Select Account number </asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required *"
                    forecolor="Red" ControlToValidate="ddlHolderAccountNumber" SetFocusOnError="true" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Account Holder Name :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtholderName" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required *"
                    forecolor="Red" ControlToValidate="txtHolderName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Holder Name" ControlToValidate="txtHolderName" ForeColor="Red"
                        SetFocusOnError="true" Display="Dynamic" ValidationExpression="[a-z,A-Z]{4,15}$"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Mobile Number :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMobileNumber" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required *"
                    forecolor="Red" ControlToValidate="txtMobileNumber" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                 <div>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Mobile Number" ControlToValidate="txtMobileNumber" ForeColor="Red"
                    SetFocusOnError="true" Display="Dynamic" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Amount :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAmount" runat="server" Height="28px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required *"
                         forecolor="Red" ControlToValidate="txtAmount" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            <div>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Amount" ControlToValidate="txtAmount" ForeColor="Red"
                SetFocusOnError="true" Display="Dynamic" ValidationExpression="\d{1,9}"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Remarks :-"></asp:Label>
            </td>
            <td>
        <asp:TextBox ID="txtNotes" runat="server" Height="28px" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required *"
             forecolor="Red" ControlToValidate="txtNotes" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Textmode="datetime"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSent" runat="server" Text="Click to Transfer" Height="30px" Style="color:darkcyan" OnClick="btnSent_Click" />
            </td>
            <td>
    <asp:Button ID="btnCancel" runat="server" Text="Click to Cancel" Height="30px" Style="color:darkcyan" OnClick="btnCancel_Click" />
</td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="error" runat="server" style="color:red"></div>
            </td>
        </tr>
    </table>
</asp:Content>
