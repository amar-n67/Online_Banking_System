<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="passwordChange.aspx.cs" Inherits="Online_Banking_System.passwordChange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPH" runat="server">

    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <h3> <u> Change Password </u></h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Current Password :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCurrentPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required *" ForeColor="Red" ControlToValidate="txtCurrentPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txtCurrentPassword" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{4,15}$"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td style="width:160px">
                <asp:Label ID="Label3" runat="server" Text="New Password :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="Required *" ForeColor="Red" ControlToValidate="txtNewPassword" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txtNewPassword" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>
        <tr>
           <td style="width:160px">
    <asp:Label ID="Label2" runat="server" Text="New Password :-"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtConfirmNewPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required *" ForeColor="Red" ControlToValidate="txtConfirmNewPassword" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>
    <div>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txtNewPassword" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not matched" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtConfirmNewPassword" ControlToCompare="txtNewpassword"></asp:CompareValidator>
    </div>
    </td>
            <td style="width:160px;">
                <asp:Label ID="Label7" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
        <td align="right">
            <asp:Button ID="btnChangePassword" runat="server" Text="Change Passowrd" Height="30px" Style="color:darkcyan" OnClick="btnChangePassword_Click" />
        </td>
        <td align="right">
    <asp:Button ID="btnCancel" runat="server" Text="Click To Cancel" Height="30px" Style="color:darkcyan" OnClick="btnCancel_Click" />
        </td>
        </tr>
        <tr>
        <td colspan="2">
            <div id="error" runat="server" style="color:red">
            </div>
        </td>
            </tr>
    </table>
</asp:Content>
