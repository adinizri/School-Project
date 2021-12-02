<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 100%;
            height: 220px;
        }
        .auto-style5 {
            height: 42px;
        }
        .auto-style6 {
            height: 453px;
        }
        .auto-style7 {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">
                <center>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="My Profile Images"></asp:Label>
                    </center>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <center>
                <asp:DataList ID="DataList1" runat="server" BorderColor="Black" BorderWidth="5px" GridLines="Both" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" CellSpacing="20" BackColor="#686868" RepeatDirection="Horizontal">
                    <ItemStyle BackColor="Gray" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("Profile Image") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="211px" ImageUrl='<%# Eval("Image") %>' Width="243px" CommandName="Choose" />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                   
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Level:  "></asp:Label>
                                    <asp:Label ID="lblLevel" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("ImageLevel") %>'></asp:Label>
                                   
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="Green" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ForeColor="Blue" />
                    <SeparatorStyle BackColor="Black" BorderColor="Black" HorizontalAlign="Center" />
                </asp:DataList>
                    </center>
            </td>
        </tr>
    </table>
        </center>
</asp:Content>

