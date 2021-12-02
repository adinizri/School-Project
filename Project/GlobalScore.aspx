<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GlobalScore.aspx.cs" Inherits="GlobalScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="867px">
        <Columns>
            <asp:ImageField DataImageUrlField="Image" HeaderText="Profile Image">
                <ControlStyle Height="120px" />
                <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
                <ItemStyle Height="100px" HorizontalAlign="Center" />
            </asp:ImageField>
            <asp:BoundField DataField="User Name" HeaderText="User Name">
            <ControlStyle Height="160px" />
            <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="Best Time" HeaderText="Best Time">
            <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Level" HeaderText="Level">
            <ControlStyle Font-Bold="True" Font-Size="Large" />
            <HeaderStyle BackColor="#CC9900" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" Width="90px" />
            </asp:BoundField>
            <asp:BoundField DataField="Num Wins" HeaderText="Num Wins">
            <FooterStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
            <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" Width="90px" />
            </asp:BoundField>
            <asp:BoundField DataField="Num Games" HeaderText="Num Games">
            <HeaderStyle BackColor="#CC9900" Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" Width="90px" />
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
</asp:Content>

