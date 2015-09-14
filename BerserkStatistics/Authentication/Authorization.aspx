<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="BerserkStatistics.Authentication.Authorization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 1502px; height: 129px;" HorizontalAlign="Center">
        <table border="0" cellpadding="5" cellspacing="0" style="width: 555px" align="center">
            <tr>
                <td>Логин:
                </td>
                <td class="auto-style3" style="width: 177px">
                    <%--При визуализации превращается в <input type="text"/>--%>
                    <asp:TextBox ID="LoginTextBox" runat="server" />  
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidatorLogin" 
                        runat="server" 
                        ControlToValidate="LoginTextBox" 
                        ErrorMessage="Это поле не может быть пустым!" 
                        ForeColor="Red"
                        ValidationGroup="Authentication">
                     </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Пароль:
                </td>
                <td class="auto-style3" style="width: 177px">
                    <%--TextMode - меняет способ отображения поля ввода--%>
                    <asp:TextBox TextMode="Password" ID="PasswordTextBox" runat="server" />  
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidatorPassword" 
                        runat="server" 
                        ControlToValidate="PasswordTextBox" 
                        ErrorMessage="Это поле не может быть пустым!" 
                        ForeColor="Red"
                        ValidationGroup="Authentication">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button OnClick="Enter_Click" Text="Вход" runat="server" Width="79px" ValidationGroup="Authentication"/>
                </td>
                <td colspan="2">
                    <asp:Label ID="IsForgotPassword" runat="server" Text="Забыли свой пароль?" style="text-align: left; font-size: small;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center" style="text-align: left">
                    <asp:Label ID="WelcomeLabel" ForeColor="black" Text="Здравствуйте, гость!" runat="server" Visible="true" style="text-align: center; font-size: medium;" />
                </td>
            </table>
        </div>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
