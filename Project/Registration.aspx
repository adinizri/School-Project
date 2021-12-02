<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script type="text/javascript"> 
        function valCalander(sender, args) {
            var isValid = true;
            debugger;
            if (('<%= Calendar1.SelectedDate==DateTime.MinValue  %>') || '<%= Calendar1.SelectedDate>DateTime.Now  %>') {
               
                isValid = false;
            }
           
            args.IsValid = isValid;
        }

   </script>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 186px;
        }
        .auto-style3 {
            width: 186px;
            height: 20px;
        }
        .auto-style9 {
            width: 186px;
            height: 29px;
        }
        .auto-style10 {
            width: 164px;
        }
        .auto-style11 {
            width: 164px;
            height: 29px;
        }
        .auto-style12 {
            width: 164px;
            height: 20px;
        }
        .auto-style14 {
            width: 1126px;
            height: 183px;
        }
        .auto-style15 {
            height: 96px;
        }
        .auto-style16 {
            width: 105%;
            height: 229px;
        }
        .auto-style18 {
            height: 96px;
            width: 246px;
        }
        .auto-style19 {
            width: 100%;
            height: 165px;
        }
        .auto-style20 {
            height: 32px;
        }
        .auto-style21 {
            width: 186px;
            height: 216px;
        }
        .auto-style22 {
            width: 164px;
            height: 216px;
        }
        .auto-style23 {
            width: 246px;
            height: 103px;
        }
        .auto-style24 {
            height: 168px;
        }
        .auto-style25 {
            width: 186px;
            height: 31px;
        }
        .auto-style26 {
            width: 164px;
            height: 31px;
        }
        .auto-style32 {
            width: 457px;
        }
        .auto-style33 {
            width: 457px;
            height: 216px;
        }
        .auto-style34 {
            width: 457px;
            height: 29px;
        }
        .auto-style35 {
            width: 457px;
            height: 20px;
        }
        .auto-style36 {
            width: 457px;
            height: 31px;
        }
        .auto-style37 {
            width: 186px;
            height: 71px;
        }
        .auto-style38 {
            width: 164px;
            height: 71px;
        }
        .auto-style40 {
            width: 457px;
            height: 18px;
        }
        .center {
            width: 732px;
            margin-left: 58px;
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
    <center>
<body background="Images\BackGroundNew2.jpg">
    
    <form id="form1" runat="server">
    <div>
    
    </div>
        
            <table class="center">
                <tr>
                    <td>
                        <img alt="" class="auto-style14" src="Images/Logo2.png" /></td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <center>
        <asp:Label ID="lblregTitle" runat="server" Text="Registration" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="True" ForeColor="#CC3300"></asp:Label>
                        </center>
                    </td>
                </tr>
            </table>
        
        <table style="margin-left: 461px" >
          
            <tr>
                <td class="auto-style37">
                    <asp:Label ID="lblUserName" runat="server" Text="User name:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                </td>
                <td class="auto-style38">
                    <asp:TextBox ID="txbUserName" runat="server" Height="16px" style="margin-left: 20px" Width="234px"></asp:TextBox>
                </td>
                <td class="auto-style40">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbUserName" Display="Dynamic" ErrorMessage="Please enter User name" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txbUserName" Display="Dynamic" ErrorMessage="Please Enter User name in english" Font-Bold="True" Font-Size="Large" ForeColor="Black" ValidationExpression="^[a-zA-Z0-9^-_. +]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
          
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="lblEmail2" runat="server" Text="First Name:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txbFirstName" runat="server" Height="16px" style="margin-left: 20px" Width="234px"></asp:TextBox>
                </td>
                <td class="auto-style34">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbFirstName" Display="Dynamic" ErrorMessage="Please enter your First name" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:RequiredFieldValidator>
                </td>
            </tr>
          
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblEmail3" runat="server" Text="Last Name:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txbLastName" runat="server" Height="16px" style="margin-left: 20px" Width="234px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbLastName" Display="Dynamic" ErrorMessage="Please enter your Last Name" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:RequiredFieldValidator>
                </td>
            </tr>
          
            <tr>
                <td class="auto-style21">
                    <table class="auto-style16">
                        <tr>
                            <td class="auto-style18">
                    <asp:Label ID="lblEmail1" runat="server" Text="BirthDay:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Height="27px" style="margin-top: 0px" Width="108px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style23">
                                <asp:Label ID="lblbirthError" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style22">
                   
                    <table class="auto-style19">
                        <tr>
                            <td class="auto-style20">
                                <asp:DropDownList ID="drpYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpYear_SelectedIndexChanged" Width="234px" style="margin-left: 20px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style24">
                   
                    <asp:Calendar ID="Calendar1" runat="server" Font-Bold="True" NextMonthText="&gt;" OnSelectionChanged="Calendar1_SelectionChanged" PrevMonthText="&lt;" style="margin-top: 0px; margin-left: 17px;" CssClass="auto-style3" OnDayRender="Calendar1_DayRender" >
                        <DayStyle BorderStyle="Outset" />

                        <OtherMonthDayStyle BorderStyle="Groove" Font-Strikeout="True" ForeColor="Black" Wrap="True" />

                    </asp:Calendar>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style33">
                   
                    <asp:CustomValidator ID="CalenderValidator" runat="server" ErrorMessage="Please selecte date" ClientValidationFunction="valCalander" Display="Dynamic" Font-Bold="True" Font-Size="Large" ></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txbPassword" runat="server" Height="16px" style="margin-left: 20px" Width="234px" OnTextChanged="txbPassword_TextChanged" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style34">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbPassword" Display="Dynamic" ErrorMessage="Please enter your password" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txbPassword" Display="Dynamic" ErrorMessage="Enter a password that include 8-20 characters with a mix of numbers , uppercase and lowercase letters" Font-Bold="True" Font-Size="Large" ForeColor="Black" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,20}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblVerifyPassword" runat="server" Text="Verify password:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txbVerifyPassword" runat="server" Height="16px" style="margin-left: 20px" Width="234px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txbVerifyPassword" Display="Dynamic" ErrorMessage="Please enter your password" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txbPassword" ControlToValidate="txbVerifyPassword" Display="Dynamic" ErrorMessage="Passwords are not the same" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txbEmail" runat="server" Height="16px" style="margin-left: 20px" Width="234px"></asp:TextBox>
                </td>
                <td class="auto-style35">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txbEmail" Display="Dynamic" ErrorMessage="Please enter your Email" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbEmail" Display="Dynamic" ErrorMessage="Please enter a valid Email Address" Font-Bold="True" Font-Size="Large" ForeColor="Black" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="lblEmail0" runat="server" Text="Gender:" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" BorderStyle="None"></asp:Label>
                </td>
                <td class="auto-style26">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Large" ForeColor="Black">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style36">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic" ErrorMessage="Please select your gender" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
            </tr>
           
        </table>
        
        <p style="height: 0px">
            <asp:Button ID="btnLogIn" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Large" Height="30px" OnClick="btnLogIn_Click" style="margin-left: 0px; margin-right: 0px;" Text="Log in" Width="80px" CausesValidation="False" CssClass="buttonBlue" PostBackUrl="~/LogIn.aspx" ValidateRequestMode="Disabled" />
            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" style="margin-left: 90px" Text="Register" CssClass="buttonGreen" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="30px" Width="85px" />
        </p>
        <p style="height: 0px">
            <asp:Label ID="lblSuc" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Height="23px" style="margin-top: 20px"></asp:Label>
        </p>
    <p style="height: 0px">
            &nbsp;</p>
        <p style="height: 0px">
            &nbsp;</p>
    </form>
       
    </body>
         </center>
</html>
