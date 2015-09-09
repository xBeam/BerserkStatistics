<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="BerserkStatistics.Authentication.Authorization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 477px; height: 129px;">
        <table border="0" cellpadding="5" cellspacing="0" style="width: 472px">
            <tr>
                <td>Логин
                </td>
                <td class="auto-style3">
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
                    Пароль
                </td>
                <td class="auto-style3">
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
                <td colspan="2" align="center" class="auto-style5">
                    <asp:Button OnClick="Enter_Click" Text="Вход" runat="server" Width="69px" 
                        ValidationGroup="Authentication"/>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center" style="text-align: left">
                    <asp:Label ID="WelcomeLabel" ForeColor="black" Text="Здравствуйте, гость!" runat="server" Visible="true" style="text-align: left; font-size: medium;" />
                </td>
            </tr>
        </table>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
