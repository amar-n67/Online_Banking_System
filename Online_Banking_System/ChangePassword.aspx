<%@ Page Title="" Language="C#" MasterPageFile="~/TopHeader.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Online_Banking_System.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <h3> <u> Change Password</u></h3>
            </td>
        </tr>
        <tr>
            <td style="width:160px;">
                <asp:Label ID="Label3" runat="server" Text="New Password"></asp:Label>
                <asp:HiddenField ID="hdnAnswer" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Required *"
                ForeColor="Red" ControlToValidate="txtNewPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularrExpressionValidator1" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txtNewPassword" ForeColor="Red"
                        SetFocusOnError="true" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td style="width:160px;">
                  <asp:Label ID="Label5" runat="server" Text="Confirm New Password"></asp:Label>
            </td>
                <td>
        <asp:TextBox ID="txtConfirmNewPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required *"
        ForeColor="Red" ControlToValidate="txtConfirmNewPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
        <div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txtConfirmNewPassword" ForeColor="Red"
                setfocusonerror="true" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>
            <asp:CompareValidator ID="CompareValidate" runat="server" ErrorMessage="Password not matched" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtConfirmNewPassword" ControlToCompare="txtNewPassword"></asp:CompareValidator>
        </div>
    </td>
    </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" Height="30px" Style="color:darkgray" OnClick="btnChangePassword_Click" />
            </td>
            <td align="left">
                <asp:Button ID="btnCancel" runat="server" Text="Click to Cancel" Height="30px" Style="color:darkgray" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
        <td>
            <div id="error" runat="server" style="color:red">
            </div>
        </td>
            </tr>
    </table>

</asp:Content>
