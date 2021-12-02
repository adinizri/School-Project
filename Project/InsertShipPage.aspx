<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertShipPage.aspx.cs" Inherits="InsertShipPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 56%;
            height: 59px;
            margin-bottom: 1px;
        }
        .auto-style5 {
            height: 41px;
            width: 898px;
        }
        .auto-style6 {}
        .auto-style10 {
            height: 41px;
            width: 1267px;
        }
        .auto-style11 {
            width: 1267px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="width: 825px">
    <table  class="auto-style4" style="background-color: #808080" >
        <tr>
            <td class="auto-style10">
                &nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style5" style="background-color: #808080">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">
                &nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblName" runat="server" Text="Spaceship name:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txbName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbName" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblSpaceshipeHight" runat="server" Text="Spaceshipe Hight:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txbHight" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbHight" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblSpaceshipeWidth" runat="server" Text="Spaceshipe Width:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txbWidth" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbWidth" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblSpaceshipeLevel" runat="server" Text="Spaceshipe Level:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txbLevel" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbLevel" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txbPrice" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbPrice" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblSpeed" runat="server" Text="Speed:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txbSpeed" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txbSpeed" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblDamage" runat="server" Text="Damage:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txbDamage" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txbDamage" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblImage" runat="server" Text="Spaceshipe Image"></asp:Label>
            </td>
            <td class="auto-style5">
                <center>
                <asp:FileUpload ID="FileUpload1" runat="server" Font-Bold="True" Height="32px" Width="263px" style="margin-left: 0px; margin-right: 20px" />
                    </center>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                 </td>
            <td class="auto-style6">
                <center>
                <asp:Button ID="btnUpload" runat="server" style="margin-left: 0px; margin-right: 0px" Text="Upload SpaceShipe" Width="158px" Font-Bold="True" OnClick="Button1_Click" />
                </center>
                 </td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style6">
                <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" Height="23px" style="margin-left: 0px"></asp:Label>
                 </td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
    </table>
        </center>
</asp:Content>

