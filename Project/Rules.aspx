<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Rules.aspx.vb" Inherits="Rules" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Table ID="Table1" runat="server" Height="512px" style="margin-left: 0px" Width="845px">
        <asp:TableFooterRow>
            <asp:TableCell Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Font-Underline="True">
                <center>
                The Game Ruels
                </center>
            </asp:TableCell>
           
        </asp:TableFooterRow>
         <asp:TableFooterRow>
             <asp:TableCell HorizontalAlign="Left" Font-Size="X-Large" Font-Bold="True" >
                 
               The Purpose of the game is to beat the boss in the shortest time. <br /> 

                 Watch out the boss's soldiers will try to kill you so try to kill them first. <br /> 

                 Every red solider kill will give you 10 points and 50 Exp points but if they hit you your power will down by 1  . <br /> 

                 Every gold solider kill will give you 100 points and 300 Exp but if they hit you your power will down by 2. <br /> 

                 Watch out from Asteroids! Asteroids can't be destroyed and if they hit you your power will down by 3.
                 
                  <br /> 
             </asp:TableCell>
        </asp:TableFooterRow>

    </asp:Table>
</asp:Content>


