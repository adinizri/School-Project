<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyPlayer.aspx.cs" Inherits="MyPlayer" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

       
        .auto-style4 {
            width: 100%;
            height: 729px;
        }
        .auto-style5 {
        }
        .auto-style7 {
            height: 59px;
        }
        .auto-style8 {
            height: 45px;
        }
        .auto-style10 {
            height: 59px;
            width: 715px;
        }
        .auto-style12 {
            width: 100%;
            height: 619px;
        }
        .auto-style13 {
            height: 393px;
        }
        .auto-style14 {
            height: 86px;
        }

     
        .auto-style16 {
            height: 228px;
            }

     
        .auto-style19 {
            height: 87px;
            }
        .auto-style20 {
        }

     
        .auto-style22 {
            height: 44px;
        }
        .auto-style23 {
            height: 87px;
            width: 520px;
        }

  
          
.button {


  
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

.button6 {
 
  border:double;
  background-color:gray;
  color:black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  font-size: large;
  cursor: pointer;
}

.button6:hover {
  background-color:#555555;
  color: white;
}
     
        .auto-style24 {
            height: 87px;
            width: 491px;
        }
     
        .auto-style25 {
            height: 52px;
        }

     
        </style>
    </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style4">
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style7" style="clip: rect(auto, auto, auto, auto)">
               
                <asp:Button ID="btnUpload" runat="server" Text="Upload image" Font-Bold="True" Font-Size="Large" 
                   style="margin-left: 0px; margin-bottom: 24px; margin-right: 0px;" Width="168px" Height="57px" OnClick="btnUpload_Click" CssClass="button6" />
                    
                <asp:Button ID="btnAdd" runat="server" Font-Bold="True" Font-Size="Large" OnClick="Button1_Click" 
                    style="margin-left: 16px; margin-top: 0px; margin-bottom: 25px" Text="Add New Space Ship" Width="243px" CssClass="button6" Height="57px" />
               
                <asp:Button ID="btnManager" runat="server" Text="Manager Page" Font-Bold="True" Font-Size="Large" 
                    OnClick="btnManager_Click" style="margin-left: 11px; margin-bottom: 24px; margin-right: 0px;" Width="176px" CssClass="button6" Height="57px" />
                    
            </td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="2">
              <center>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84"
                     BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="31px" style="margin-left: 0px" Width="1216px">
                    <Columns>
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Profile Image">
                            <ControlStyle Font-Bold="False" Height="120px" Width="150px" />
                            <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ImageField>
                        <asp:BoundField DataField="User name" HeaderText="User Name">
                        <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                        <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Level" HeaderText="Level">
                        <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                        <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Best Time" HeaderText="Best Time">
                        <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                        <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Num Wins" HeaderText="Num Wins">
                        <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                        <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Num Games" HeaderText="Num Games">
                        <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                        <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Points" HeaderText="Points">
                        <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                        <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
              </center>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="2">
                <center>
                <table class="auto-style12">
                    <tr>
                        <td class="auto-style14">
                            <center>
                            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" 
                                AutoPostBack="True" Font-Bold="True" Font-Size="X-Large" Height="58px" Width="176px">
                            </asp:DropDownList>
                                </center>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">
                            <center>
                                <asp:DataList ID="DataList1" runat="server" BorderColor="Black" BorderWidth="5px" GridLines="Both" RepeatDirection="Horizontal" 
                                    BackColor="Gray" OnItemCommand="DataList1_ItemCommand" Width="660px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                        HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemTemplate>
                                        <table class="auto-style12">
                                            <tr>
                                                
                                                <td class="auto-style16" colspan="2" style="font-variant: normal; border-style: solid">
                                                    <center>
                                                    <asp:Image ID="Image1" runat="server" Height="146px" Width="162px" BorderColor="Black" BorderStyle="Ridge" ImageUrl='<%# Eval("Picture") %>' 
                                                        style="margin-left: 71px; margin-right: 72px" ImageAlign="AbsMiddle" />
                                                    </center>
                                                        </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style20" colspan="2" style="font-variant: normal; border-style: solid">&nbsp;
                                                    <center>

                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Damage:"></asp:Label>
                                                        <asp:Label ID="lblDamage" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("ShipDamage") %>'></asp:Label>
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="X-Large" Text="%"></asp:Label>

                                                    </center>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style22" colspan="2" style="font-variant: normal; border-style: solid">&nbsp;
                                                     <center>

                                                         <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Speed:"></asp:Label>
                                                         <asp:Label ID="lblSpeed" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("ShipSpeed") %>'></asp:Label>
                                                         <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="X-Large" Text="%"></asp:Label>

                                                    </center>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style24" style="font-variant: normal; border-style: solid">
                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Upgrade Damage To:"></asp:Label>
                                                    <asp:Label ID="lblDmgUpgrade" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("AfterDamageUpgrade") %>'></asp:Label>
                                                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="X-Large" Text="%"></asp:Label>
                                                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Update Price:" ForeColor="Red"></asp:Label>
                                                    <asp:Label ID="lblDmgPrice" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" Text='<%# Eval("DamageUpgradePrice") %>'></asp:Label>
                                                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" Text="Points"></asp:Label>
                                                    <asp:Button ID="BtnUpgradeDamage" runat="server" style="margin-left: 90px" Text="Upgrade" CommandName="UpgradeDamage" 
                                                        Font-Bold="True" Font-Size="Large" Height="53px" Width="122px" OnClick="BtnUpgradeDamage_Click" CssClass="button5" />
                                                </td>
                                                <td class="auto-style23" style="font-variant: normal; border-style: solid">
                                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Upgrade Speed To: "></asp:Label>
                                                    <asp:Label ID="lblSpeedUpgrade" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("AfterSpeedUpgrade") %>'></asp:Label>
                                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="X-Large" Text="%"></asp:Label>
                                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" Text="Update Price:"></asp:Label>
                                                    <asp:Label ID="lblSpeedPrice" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" Text='<%# Eval("SpeedUpgradePrice") %>'></asp:Label>
                                                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" Text="Points"></asp:Label>
                                                    <asp:Button ID="BtnUpgradeSpeed" runat="server" CommandName="UpgradeSpeed" Font-Bold="True" 
                                                        Font-Size="Large" Height="53px" style="margin-left: 91px" Text="Upgrade" Width="122px" OnClick="BtnUpgradeSpeed_Click" CssClass="button5" />
                                                   
                                                     </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style19" colspan="2" style="font-variant: normal; border-style: solid">
                                                    <center>
                                                    <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Upgrade Left:"></asp:Label>
                                                    <asp:Label ID="lblUpgrades" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("UpgradesLeft") %>'></asp:Label>
                                                     </center>
                                                         </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style20" colspan="2" style="font-variant: normal; border-style: solid">
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Sell for:"></asp:Label>
                                                    <asp:Label ID="lblSell" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("SellPrice") %>'></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Points"></asp:Label>
                                                    <asp:Button ID="btnSell" runat="server" BorderColor="Black" CommandName="Sell" Font-Bold="True" Font-Size="Large" Height="53px" 
                                                        OnClick="btnSell_Click" style="margin-left: 39px" Text="Sell Ship" Width="122px" CssClass="button5" />
                                                    <asp:Label ID="lblShip" runat="server" Text='<%# Eval("Ship") %>' Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                               
                                
                                </center>
                        </td>
                    </tr>
                </table>
                    </center>
            </td>
        </tr>
    </table>
    <Body>
       
                     
       <%-- <table class="auto-style4" border="0" dir="ltr" style="padding: inherit; border: medium none #000000; line-height: normal; vertical-align: middle; visibility: visible; text-align: center; table-layout: auto; border-collapse: inherit; height: 728px;">
        <tr>
            <td class="auto-style24" style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton10" runat="server"  Height="178px" ImageUrl="~/Images/Ship0.png" Width="156px" />
                           
                        </td>
                        <td class="auto-style24"  style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton1" runat="server"  Height="178px" ImageUrl="~/Images/Ship5.png" Width="156px" />
                           
                        </td>
                    
          
                        <td class="auto-style24"   style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="168px" ImageUrl="~/Images/Ship2.png" Width="201px" />
                        </td>
                 

           
          
                        <td class="auto-style14"   style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton3" runat="server" Height="176px" ImageUrl="~/Images/Ship3.png" Width="135px" />
                        </td>
              <td class="auto-style46"   style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton6" runat="server" Height="192px" ImageUrl="~/Images/Ship4.png" Width="143px" />
                        </td>
          
                       
                  
        </tr>
        <tr>
          
                      
                  
               
            <td class="auto-style43"   style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton5" runat="server" Height="194px" ImageUrl="~/Images/Ship6.png" Width="116px" />
                        </td>
                        <td class="auto-style43"  style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton4" runat="server" Height="197px" ImageUrl="~/Images/Ship7.png" Width="138px" />
                             <td class="auto-style32"  style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton7" runat="server" ForeColor="Black" Height="178px" ImageUrl="~/Images/Ship8.png" Width="171px" />
                        </td>
                   
           
                        <td class="auto-style31"  style="border-style: inset; visibility: visible; table-layout: auto"> 
                            <asp:ImageButton ID="ImageButton8" runat="server" Height="188px" ImageUrl="~/Images/ship9.png" Width="106px" />
                        </td>
                 
          
                        <td class="auto-style33"  style="border-style: inset; visibility: visible; table-layout: auto">
                            <asp:ImageButton ID="ImageButton9" runat="server" Height="176px" ImageUrl="~/Images/Ship10.PNG" Width="124px" />
                        </td>
                   
                    
        </tr>
        
    </table>
              --%>
    
</Body>
</asp:Content>

