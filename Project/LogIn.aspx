<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 35%;
            height: 143px;
            margin-top: 7px;
            margin-right: 0px;
            margin-left: 267px;
            margin-bottom: 58px;
        }
        .auto-style8 {
            width: 99%;
            height: 356px;
        }
        .auto-style9 {
            width: 1126px;
            height: 175px;
        }
        .auto-style13 {
            height: 161px;
            width: 1355px;
        }
        .auto-style14 {
            height: 137px;
            width: 1355px;
        }
        .auto-style25 {
            width: 108px;
        }
        .auto-style26 {
            width: 108px;
            height: 43px;
        }
        .auto-style27 {
            height: 21px;
            width: 108px;
        }
        .auto-style28 {
            height: 18px;
            width: 108px;
        }
        .auto-style29 {
            width: 178px;
        }
        .auto-style30 {
            width: 178px;
            height: 43px;
        }
        .auto-style31 {
            height: 21px;
            width: 178px;
        }
        .auto-style32 {
            height: 18px;
            width: 178px;
        }
        .auto-style33 {
            width: 128px;
        }
        .auto-style34 {
            width: 128px;
            height: 43px;
        }
        .auto-style35 {
            height: 21px;
            width: 128px;
        }
        .auto-style36 {
            height: 18px;
            width: 128px;
        }
        .buttonGreen {
  border-radius: 12px;
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.buttonGreen:hover {
  border-radius: 12px;
  background-color: #4CAF50;
  color: white;
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
        
   <center >
       <table class="auto-style8">
           <tr>
               <td class="auto-style13">
                   <center>
                   <img alt="" class="auto-style9" src="Images/Logo2.png" /></td>
                   </center>
           </tr>
           <tr>
               <td class="auto-style14">
                   <center>
                   <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Font-Strikeout="False" Text="Log in" Font-Underline="True" ForeColor="#CC3300"></asp:Label>
                   </center>
               </td>
           </tr>
       </table>
    <table class="auto-style1">
        
        <tr>
            <td class="auto-style33">
    
        <asp:Label ID="lblUser" runat="server" Text="User name:" Font-Bold="True" Font-Size="X-Large" ForeColor="#CC3300"></asp:Label>
    
            </td>
            <td class="auto-style25">
                
                <asp:TextBox ID="txbUser" runat="server" style="margin-left: 0px" Width="142px" Height="16px" ></asp:TextBox>
                
                    </td>
            <td class="auto-style29">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbUser" ErrorMessage="Enter User name" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style34">
    
        <asp:Label ID="lblPass" runat="server" Text="Password:" Font-Bold="True" Font-Size="X-Large" ForeColor="#CC3300"></asp:Label>
    
            </td>
            <td class="auto-style26">
                
                <asp:TextBox ID="txbPass" runat="server" Width="141px" TextMode="Password"></asp:TextBox>
                    
            </td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbPass" ErrorMessage="Enter Password" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style35">
                &nbsp;</td>
            <td class="auto-style27">
                <asp:Button ID="btnLog" runat="server" Text="Log in" Width="147px" Font-Bold="True" Font-Size="Large" OnClick="btnLog_Click" style="margin-left: 0px" CssClass="buttonBlue" />
            </td>
            <td class="auto-style31">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style36">
                <asp:Button ID="btnDel" runat="server" Font-Bold="True" Font-Size="Medium" OnClick="btnDel_Click" Text="Delete User" Width="117px" CausesValidation="False" CssClass="buttonRed" ValidateRequestMode="Disabled" />
            </td>
            <td class="auto-style28">
                <asp:Button ID="btnNew" runat="server" Font-Bold="True" Font-Size="Large" OnClick="btnNew_Click" Text="New account" Width="147px" CssClass="buttonGreen" CausesValidation="False" ValidateRequestMode="Disabled" />
            </td>
            <td class="auto-style32">
                <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style36">
                &nbsp;</td>
            <td class="auto-style28">
                &nbsp;</td>
            <td class="auto-style32">
                &nbsp;</td>
        </tr>
    </table>
   </center>
    </form>
         
    </body>
   
</html>
