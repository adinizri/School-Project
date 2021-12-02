<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Store1.aspx.cs" Inherits="Store1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 103%;
            height: 324px;
        }
        .auto-style11 {            height: 177px;
            width: 1072px;
        }
        .auto-style12 {
            height: 49px;
            width: 1072px;
        }
        .auto-style13 {
    }
        .auto-style17 {
            height: 49px;
        }
        .button5 {
  /*background-color:dimgray;
  color:black;
  border: 30px double #555555;*/
  border:double;
  background-color:dimgray;
  color:black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display:inline-block;
  font-size: large;
  margin: 4px 2px;
  /*transition-duration: 0.1s;*/
  cursor: pointer;
}

.button5:active {
  background-color:#555555;
  color: white;
}

   .buttonGold {
  /*background-color:dimgray;
  color:black;
  border: 30px double #555555;*/
  border:double;
  background-color:#efbf00;
  color:black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display:inline-block;
  font-size: large;
  margin: 4px 2px;
  /*transition-duration: 0.1s;*/
  cursor: pointer;
}

.buttonGold:hover {
  background-color:gold;
  color: black;
}

        .auto-style18 {
            width: 1072px;
        }
        .auto-style19 {
            width: 1072px;
            height: 45px;
        }
        .auto-style20 {
            width: 1072px;
            height: 48px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                <asp:Button ID="Button1" runat="server" style="margin-left: 684px" Text="Buy Points" Width="137px" CssClass="buttonGold" PostBackUrl="~/BuyPoints.aspx" />

    <asp:Label ID="lblPoints" runat="server" Font-Bold="True" Font-Size="Large" Height="32px" style="margin-left: 59px" Width="185px"></asp:Label>

            </td>
        </tr>
        <tr>
            <td>
    <asp:DataList ID="DataList1" runat="server" GridLines="Both" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Width="1038px" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" style="margin-right: 0px" Height="381px" RepeatColumns="3" BackColor="Gray" BorderColor="Black" BorderWidth="5px" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="auto-style4">
                
                <tr>
                    <td class="auto-style11">
                        <center>
                        <asp:Image ID="Image1" runat="server" Height="140px" ImageUrl='<%# Eval("Picture") %>' Width="132px" BorderStyle="Ridge" BorderColor="Black" />
                  </center>
                              </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <center>
                        <asp:Label ID="lblSpceShipName" runat="server" Text='<%# Eval("Name") %>' Height="24px" Width="154px" style="margin-left:0px" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </center>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20">
                      <center>
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="X-Large" Height="29px" Text="Ship's Level:    " Width="135px"></asp:Label>
                        <asp:Label ID="lblShipLevel" runat="server" Font-Bold="True" Font-Size="X-Large" Height="24px" style="margin-left:0px" Text='<%# Eval("Level") %>' Width="36px"></asp:Label>
                      </center>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <center>
                            <asp:Label ID="Label2" runat="server" Text="Price:" Font-Bold="True" Font-Size="X-Large" Height="25px" Width="64px"></asp:Label>
                            <asp:Label ID="lblShipPrice" runat="server" Height="20px" style="margin-left: 0px; margin-right: 0px;" Text='<%# Eval("Price") %>' Width="66px" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </center>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">&nbsp;
                        <center>

                            <asp:Label ID="Label4" runat="server" Text="Damage:" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            <asp:Label ID="lblDamage" runat="server" Text='<%# Eval("ShipDamage") %>' Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False"></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text="%" Font-Bold="True" Font-Overline="False" Font-Size="X-Large"></asp:Label>

                        </center>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;
                        <center>

                            <asp:Label ID="Label5" runat="server" Text="Speed:" Font-Bold="True" Font-Overline="False" Font-Size="X-Large"></asp:Label>
                            <asp:Label ID="lblSpeed" runat="server" Text='<%# Eval("ShipSpeed") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text="%" Font-Bold="True" Font-Size="X-Large"></asp:Label>

                        </center>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <center>
                            <asp:Button ID="btnBuy" runat="server" Text="Buy" Width="100px" OnClick="btnBuy_Click" CommandName="Buy" style="margin-left: 0px" CssClass="button5" />
                            </center>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
                </td>
            </tr>
        </table>
</asp:Content>

