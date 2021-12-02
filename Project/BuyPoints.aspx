<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BuyPoints.aspx.cs" Inherits="BuyPoints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         .TextBox {
  width: 20%;
  padding: 12px 20px;
  
  box-sizing: border-box;
}
         .buttonGreen {
  border-radius: 4px;
  background-color: #4CAF50; 
  color: black; 
  border: 2px solid #4CAF50;
}

.buttonGreen:hover {
  background-color: #15900e;
  color: white;
}
 .buttonGray {
  border-radius: 4px;
  background-color: #b2b2b2; 
  color: black; 
  border: 2px solid #000000 ;
}

.buttonGray:hover {
  background-color: #838383;
  color: white;
}
        .auto-style26 {
            width: 100%;
            height: 359px;
            margin-top: 0px;
        }
        .auto-style30 {
        }
        .auto-style33 {
            width: 99%;
            height: 251px;
            margin-top: 0px;
            margin-bottom: 78px;
        }
        .auto-style34 {
            width: 777px;
        }
        .auto-style35 {
        }
              
        .auto-style41 {
            width: 706px;
            height: 126px;
        }
              
        .auto-style42 {
            height: 126px;
        }
        .auto-style43 {
            height: 81px;
        }
              
    </style>
     <script type="text/javascript"> 
        function BtnBuyClientClick(e) {
            if (!Page_ClientValidate('1') || !Page_ClientValidate('2')) {
                e.preventDefault();
                
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
                  <center>
                  <table class="auto-style26">
                      <center>
                      <tr>
                          <td class="auto-style34" rowspan="7" style="background-color: #666666">
                              <table class="auto-style33">
                                  <tr>
                                      <td class="auto-style41">
                                <asp:Label ID="lblAmount" runat="server" Height="23px" style="margin-left: 0px; margin-right: 0px; margin-bottom: 0px;" Text="How much points would you like to buy?" Width="518px" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                <asp:TextBox ID="txbPoints" runat="server" style="margin-left: 0px; margin-right: 0px; margin-top: 0px;" Font-Bold="True" Font-Size="Large" TextMode="Number" ValidationGroup="1" CssClass="TextBox" Width="162px" Height="8px"></asp:TextBox>
                                      </td>
                                      <td class="auto-style42">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbPoints" Display="Dynamic" ErrorMessage="*" ForeColor="Red" Height="23px" style="margin-left: 8px" Width="40px" ValidationGroup="1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbPoints" Display="Dynamic" ErrorMessage="Enter at least 1000 Points" Font-Bold="True" Font-Size="Medium" ForeColor="Red" style="margin-left: 0px" ValidationExpression="(\D*\d){4,}\D*" Width="170px" ValidationGroup="1"></asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="auto-style43" colspan="2">
                                          <center>
                                <asp:Label ID="lblAmount0" runat="server" Height="23px" style="margin-left: 0px; margin-right: 0px; margin-bottom: 0px;" Text="Price:" Width="78px" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                <asp:Label ID="lblCost" runat="server" Height="22px" style="margin-left: 3px" Width="131px" Font-Bold="True" Font-Size="X-Large">0</asp:Label>
      <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-left: 0px" Font-Bold="True" Font-Size="Medium">
                                </asp:DropDownList>
                                              </center>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="auto-style35" colspan="2">
                                          <center>
                              
                                                <asp:Button ID="btnCal" runat="server" OnClick="btnCal_Click" style="margin-left: 0px" Text="Calculate" ValidationGroup="1" CssClass="buttonGray" Font-Bold="True" Font-Size="Large" Height="33px" Width="152px" />
                                    </center>
                                                </td>
                                  </tr>
                              </table>
                          </td>
                          <td class="auto-style30" style="background-color: #143957">
                              <asp:Label ID="Label1" runat="server" Text="Id:"></asp:Label>
&nbsp;<asp:TextBox ID="txbId" runat="server" style="margin-left: 112px" Width="208px" TextMode="Number" CssClass="TextBox" Height="16px"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbId" Display="Dynamic" ErrorMessage="*" ForeColor="Red" Height="23px" style="margin-left: 2px" Width="40px"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      </center>
                      <center>
                      <tr>
                          <td style="background-color: #143957">
                              <asp:Label ID="Label2" runat="server" Text="Credit Card:"></asp:Label>
                              <asp:TextBox ID="txbCreditCard" runat="server" style="margin-left: 55px" Width="208px" TextMode="Number" CssClass="TextBox"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbCreditCard" Display="Dynamic" ErrorMessage="*" ForeColor="Red" Height="23px" style="margin-left: 2px" Width="40px"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      </center>
                      <center>
                      <tr>
                          <td style="background-color: #143957">
                              <asp:Label ID="Label3" runat="server" Text="CVV:"></asp:Label>
                              <asp:TextBox ID="txbCVV" runat="server" style="margin-left: 95px" Width="206px" TextMode="Number" CssClass="TextBox"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbCVV" Display="Dynamic" ErrorMessage="*" ForeColor="Red" Height="23px" style="margin-left: 2px" Width="40px"></asp:RequiredFieldValidator>
                              

                          </td>
                      </tr>
                      </center>
                      <center>
                      <tr>
                          <td style="background-color: #143957">
                              <asp:Label ID="Label5" runat="server" Text="Validity:"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:DropDownList ID="drpMonth" runat="server" style="margin-left: 82px" Width="65px">
                                  <asp:ListItem Value="01"></asp:ListItem>
                                  <asp:ListItem Value="02"></asp:ListItem>
                                  <asp:ListItem Value="03"></asp:ListItem>
                                  <asp:ListItem Value="04"></asp:ListItem>
                                  <asp:ListItem Value="05"></asp:ListItem>
                                  <asp:ListItem Value="06"></asp:ListItem>
                                  <asp:ListItem Value="07"></asp:ListItem>
                                  <asp:ListItem Value="08"></asp:ListItem>
                                  <asp:ListItem Value="09"></asp:ListItem>
                                  <asp:ListItem Value="10"></asp:ListItem>
                                  <asp:ListItem Value="11"></asp:ListItem>
                                  <asp:ListItem Value="12"></asp:ListItem>
                              </asp:DropDownList>
                              <asp:DropDownList ID="drpYear" runat="server" style="margin-left: 4px; margin-right: 82px;" Height="16px" Width="64px">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      </center>
                      <center>
                      <tr>
                          <td style="background-color: #143957">
                              <asp:Label ID="Label4" runat="server" Text="Company:"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:DropDownList ID="drpCompany" runat="server" Height="24px" style="margin-left: 61px; margin-right: 35px;" Width="177px">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      </center>
                      <tr>
                          <td style="background-color: #143957">
                  <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Visible="False"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td style="background-color: #143957">
                              <center>
                             
                                     <asp:Button ID="BtnBuy" runat="server" style="margin-right: 0px; margin-top: 0px;" Text="Buy" Width="89px" OnClick="BtnBuy_Click" CssClass="buttonGreen" Font-Bold="True" />
                         </center>
                                   </td>
                      </tr>
                      </table>
                      </center>
             
</asp:Content>

