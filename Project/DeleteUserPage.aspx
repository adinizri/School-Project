<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteUserPage.aspx.cs" Inherits="DeleteUserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style9 {
            height: 154px;
            width: 1186px;
        }
        .auto-style10 {
            height: 91px;
        }
        .buttonRed {
  border-radius: 12px;
  background-color: white; 
  color: black; 
  border: 2px solid #f44336;
}

.buttonRed:hover {
  border-radius: 12px;
  background-color: #f44336;
  color: white;
}
.buttonBlue {
  border-radius: 12px;
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.buttonBlue:hover {
     border-radius: 12px;
  background-color: #008CBA;
  color: white;
}
    </style>
</head>
<body background="Images\BackGroundNew2.jpg">
    <form id="form1" runat="server">
    <div>
     <center >
       <table class="auto-style8">
           <tr>
               <td class="auto-style13">
                   <center>
                   <img alt="" class="auto-style9" src="Images/Logo2.png" /></td>
                   </center>
           </tr>
           <tr>
               <td class="auto-style10">
                   <center>
                   <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Font-Strikeout="False" Text="Delete" Font-Underline="True" ForeColor="#CC3300"></asp:Label>
                   </center>
               </td>
           </tr>
       </table>
    <table class="auto-style1">
        
        <tr>
            <td class="auto-style21">
    
        <asp:Label ID="lblUser" runat="server" Text="User name:" Font-Bold="True" Font-Size="X-Large" ForeColor="#CC3300"></asp:Label>
    
            </td>
            <td class="auto-style25">
                <asp:TextBox ID="txbUser" runat="server" style="margin-left: 0px" Width="119px" Height="16px"></asp:TextBox>
            </td>
            <td class="auto-style17">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbUser" ErrorMessage="Enter User name" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">
    
        <asp:Label ID="lblPass" runat="server" Text="Password:" Font-Bold="True" Font-Size="X-Large" ForeColor="#CC3300"></asp:Label>
    
            </td>
            <td class="auto-style26">
                <asp:TextBox ID="txbPass" runat="server" Width="119px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style18">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbPass" ErrorMessage="Enter Password" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:Button ID="Button1" runat="server" CausesValidation="False" CssClass="buttonBlue" Font-Bold="True" Font-Size="Large" PostBackUrl="~/LogIn.aspx" Text="Log In" ValidateRequestMode="Disabled" Width="119px" />
            </td>
            <td class="auto-style27">
                <asp:Button ID="btnDelete" runat="server" Font-Bold="True" Font-Size="Large" OnClick="btnDelete_Click" Text="Delete User" CssClass="buttonRed" />
            </td>
            <td class="auto-style19">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24">
                &nbsp;</td>
            <td class="auto-style28">
                &nbsp;</td>
            <td class="auto-style20">
                <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                &nbsp;</td>
            <td class="auto-style28">
                &nbsp;</td>
            <td class="auto-style20">
                &nbsp;</td>
        </tr>
    </table>
   </center>
    </div>
    </form>
</body>
</html>
