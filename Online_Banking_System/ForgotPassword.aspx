<%@ Page Title="" Language="C#" MasterPageFile="~/TopHeader.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Online_Banking_System.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <h3> <u>Forgot Password</u></h3>
            </td>
        </tr>
        <%--- <tr>
            <td style="width:160px;">
                <asp:Label ID="Label1" runat="server" Text="User Account Number :-"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAccountnumber" runat="server"></asp:Label>
            </td>
        </tr>
       <tr>
            <td style="width:160px;">
     <asp:Label ID="Label2" runat="server" Text="Sequrity Questions :-"></asp:Label>
        </td>
             <td>
     <asp:Label ID="lblSequerityQuestion" runat="server"></asp:Label>
        </td>
        </tr>
        <tr>
            <td style="width:160px;">
     <asp:Label ID="Label3" runat="server" Text="Answer :-"></asp:Label>
 </td>
            <td>
                <asp:TextBox ID ="'txtAnswer" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RerquiredFieldValidator" runat="server" ErrorMessage="Required *"
                    forecolor="Red" ControlToValidate="txtAnswer" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr> ---%>
        <tr>
            <td style="width:50%">
                <asp:Label ID="lblEmail" runat="server" Text="Email :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID ="txtEmail" runat="server" Height="28px" Width="200px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required *"
                             forecolor="Red" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter validEmail" ControlToValidate="txtUserName" ForeColor="Red"
    SetFocusOnError="true" Display="Dynamic" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>  
                </div>
        </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnForgotPassword" runat="server" Text="Forgot Password" Height="30px" Style="color:darkkhaki" OnClick="btnForgotPassword_Click" CausesValidation="false" />
            </td>
            <td>
                <asp:Button ID="btnCancel" runat="server" Text="Click to Cancel" Height="30px" Style="color:darkgreen" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Style="color:red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="error" runat="server" style="color:red"></div>
            </td>
        </tr>
    </table>
</asp:Content>
