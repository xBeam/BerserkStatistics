<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BerserkStatistics.Default" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" Text="Home page" ></asp:Label>                      
    <%--<hr BorderColor="black" />--%>
    <asp:Image runat="server" src="/Images/Unicorn.jpg"  alt="Deleted" title="Unicorn" width="600px" ImageAlign="AbsMiddle"/>
    <asp:Image runat="server" src="/Images/Колонна Ivory Left.jpg" alt="Deleted" title="Колонна" Height="750" ImageAlign="Left"/>
    <asp:Image runat="server" src="/Images/Колонна Ivory Right.jpg" alt="Deleted" title="Колонна" Height="750" ImageAlign="Right"/>
</asp:Content>


 
 