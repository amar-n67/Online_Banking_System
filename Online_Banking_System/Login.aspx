<%@ Page Title="" Language="C#" MasterPageFile="~/TopHeader.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Banking_System.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td colspan="4" align="center">
                <h3 style="color:darkcyan"> <b>< <u> Login </u></b></h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Enter User Account Number :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAccountNumber" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Account Number *"
                Forecolor="Red" ControlToValidate="txtAccountNumber" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Password :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Height="28px" Width="200px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Correct Password *"
                     Forecolor="Red" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td colspan="4" style="padding-right:7px;">
                <asp:Button ID="btnLogin" runat="server" Text="Login" Height="30px" Style="color:darkgoldenrod" OnClick= "btnLogin_Click"/>
            </td>
            <td style="padding-top:40px;"></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="New Regiatration" Height="30px" style="color:darkcyan" OnClick= "Button1_Click" CausesValidation="false" />
            </td>
            
            <td colspan="3">
                <div id="error" runat="server" style="color:red">
                </div>
            </td>
            <td>
                <asp:LinkButton ID="lblForgotPassword" runat="server" Height="28px" CausesValidation="false" OnClick= "lblForgotPassword_Click"> Forgot password</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content> 

