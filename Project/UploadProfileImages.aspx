<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UploadProfileImages.aspx.cs" Inherits="UploadProfileImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 55%;
            height: 429px;
        }
        .auto-style8 {
            height: 59px;
        }
        .auto-style12 {
            height: 47px;
        }
        .auto-style15 {
            height: 46px;
        }
        .auto-style16 {
            height: 59px;
            width: 322px;
        }
        .auto-style18 {
            height: 46px;
            width: 322px;
        }
        .auto-style19 {
            height: 47px;
            width: 322px;
        }
        .auto-style21 {}
        .auto-style22 {
            width: 322px;
            height: 20px;
        }
        .auto-style23 {
            height: 29px;
            width: 322px;
        }
        .auto-style24 {
            height: 29px;
        }
        .auto-style25 {
            height: 87px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table class="auto-style4" style="background-color: #808080">
        <tr>
            <td class="auto-style16"></td>
            <td class="auto-style8"></td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23"></td>
            <td class="auto-style24"></td>
            <td class="auto-style24">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22"></td>
            <td class="auto-style3"></td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Image Name"></asp:Label>
            </td>
            <td class="auto-style15">
                <asp:TextBox ID="txbImageName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbImageName" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Image Level"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="txbLevel" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbLevel" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style25" colspan="2">
                <asp:FileUpload ID="FileUpload1" runat="server" Height="34px" Width="349px" />
            </td>
            <td class="auto-style25">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" colspan="2">
                <asp:Button ID="btnUpload" runat="server" Font-Bold="True" Font-Size="X-Large" OnClick="btnUpload_Click" Text="Upload" />
            </td>
            <td class="auto-style21">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
   </center>
</asp:Content>

