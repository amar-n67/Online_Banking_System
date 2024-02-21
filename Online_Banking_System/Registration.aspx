<%@ Page Title="" Language="C#" MasterPageFile="~/TopHeader.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Online_Banking_System.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td colspan="2" align="left">
                <h3 style="color:brown"> <b> <u>  <font>registration </font></u></b></h3>
            </td>
        </tr>
        <tr>
            <td style="width:50%">
                <asp:Label ID="Label1" runat="server" Text="Account Number :-"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAccountnumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:50%">
                <asp:Label ID="Label2" runat="server" Text="Account Type :-"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlAcconutType" runat="server" Height="28px" Width="200px">
                    <asp:ListItem>Savings</asp:ListItem>
                    <asp:ListItem>Current</asp:ListItem>
                    <asp:ListItem>Salary</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width:50px">
                <asp:Label ID="label3" runat="server" Text="User Name :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required *"
                    Forecolor="Red" ControlToValidate="txtUserName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid User Name" ControlToValidate="txtUserName" ForeColor="Red"
                        SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>  
                </div>
            </td>
        </tr>
        <tr>
             <td style="width:50px">
                 <asp:Label ID="label4" runat="server" Text="Password :-"></asp:Label>
            </td>
            <td>
                   <asp:TextBox ID="txtPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required *"
                      Forecolor="Red" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
             <div>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid/Wrong Password" ControlToValidate="txtPassword" ForeColor="Red"
                          SetFocusOnError="true" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>  
                </div>
                </td>
             </tr>
        <tr>
             <td style="width:50px">
     <asp:Label ID="label5" runat="server" Text="Confirm Password :-"></asp:Label>
 </td>
 <td>
     <asp:TextBox ID="txtRetypePassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required *"
         Forecolor="Red" ControlToValidate="txtRetypePassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
     <div>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter valid User Name" ControlToValidate="txtRetypePassword" ForeColor="Red"
             SetFocusOnError="true" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>
         <asp:CompareValidator ID="Comparevalidator1" runat="server" ErrorMessage="Password not matched" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtRetypePassword" ControlToCompare="txtPassword"></asp:CompareValidator>
     </div>
 </td>
        </tr>
        <tr>
            <td style="width:50%">
                <asp:Label ID="Label6" runat="server" Text="Gender :-"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server" Height="28px" Width="200px">
                    <asp:ListItem>Male</asp:ListItem>
                     <asp:ListItem>Female</asp:ListItem>
                     <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
             <td style="width:50px">
     <asp:Label ID="Label7" runat="server" Text="Email :-"></asp:Label>
 </td>
 <td>
     <asp:TextBox ID="txtEmail" runat="server" Height="28px" Width="200px" TextMode="Email"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required *"
         Forecolor="Red" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
     <div>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter valid Email" ControlToValidate="txtUserName" ForeColor="Red"
             SetFocusOnError="true" Display="Dynamic" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>  
     </div>
 </td>
        </tr>
        <tr>
             <td style="width:50px">
     <asp:Label ID="Label8" runat="server" Text="Address :-"></asp:Label>
 </td>
 <td>
     <asp:TextBox ID="txtAddress" runat="server" Height="28px" Width="200px"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required *"
         Forecolor="Red" ControlToValidate="txtAddress" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
     
 </td>
        </tr>
        <tr>
            
        </tr>
        <tr>
             <td style="width:50px">
     <asp:Label ID="Label9" runat="server" Text="Amount :-"></asp:Label>
 </td>
 <td>
     <asp:TextBox ID="txtAmount" runat="server" Height="28px" Width="200px"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required *"
         Forecolor="Red" ControlToValidate="txtAmount" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
     <div>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Enter Amount" ControlToValidate="txtAmount" ForeColor="Red"
             SetFocusOnError="true" Display="Dynamic" ValidationExpression="\d{1,9}"></asp:RegularExpressionValidator>  
     </div>
 </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnRegister" runat="server" Text="Click to Register" Height="30px" style="color:darkolivegreen" OnClick="btnRegister_Click" />
                </td>
                    <td>
                <asp:Button ID="btnCancel" runat="server" Text="Click to Register" Height="30px" style="color:darkolivegreen" OnClick= "btnCancel_Click" />
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
