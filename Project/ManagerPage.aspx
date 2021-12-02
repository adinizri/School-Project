<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManagerPage.aspx.cs" Inherits="ManagerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <head>
<style>
    .button1 {
  background-color:gray;
  color: black;
  border: 2px solid #555555;
  
}

.button1:hover {
  background-color: #555555;
  color: white;
}
 .button2 {
  background-color:lightgray;
  color: black;
  border: 2px solid #555555;
  
}

.button2:hover {
  background-color: #555555;
  color: white;
}
</style>
</head>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="txbImg" runat="server" Text="Profile images" OnClick="txbImg_Click" CssClass="button5" Height="40px" Width="470px" />
    <asp:Button ID="txbShip" runat="server" Text="SpaceShips" OnClick="txbShip_Click" CssClass="button5" Height="40px" Width="470px"  />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="941px" Height="353px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" >
            <HeaderStyle Font-Bold="True" Font-Overline="False" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Hight" HeaderText="Hight" >
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Width" HeaderText="Width" >
            <HeaderStyle Font-Bold="True" Font-Overline="False" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="Price" >
            <HeaderStyle Font-Bold="True" Font-Overline="False" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="Picture" HeaderText="Image" ControlStyle-Width="105" ControlStyle-Height="130">
<ControlStyle Height="130px" Width="105px"></ControlStyle>
                <HeaderStyle Font-Bold="True" Font-Overline="False" Font-Size="X-Large" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
            <asp:BoundField DataField="ShipSpeed" HeaderText="Speed">
            <HeaderStyle Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" />
            </asp:BoundField>
            <asp:BoundField DataField="ShipDamage" HeaderText="Damage">
            <HeaderStyle Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" />
            </asp:BoundField>
            <asp:BoundField DataField="Level" HeaderText="Level">
            <ControlStyle Font-Bold="True" Font-Size="Large" />
            <HeaderStyle Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Bold="True" Font-Size="Large" />
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
            <ControlStyle ForeColor="Black" />
            <FooterStyle ForeColor="White" />
            <ItemStyle ForeColor="Black" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="932px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ImageName" HeaderText="Image Name" />
            <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
                <ControlStyle Height="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="ImageLevel" HeaderText="Image Level" />
            <asp:CommandField ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
</asp:Content>

