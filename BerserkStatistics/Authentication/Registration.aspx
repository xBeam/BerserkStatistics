<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BerserkStatistics.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="width: 1501px; height: 129px;" class="auto-style11">
        <table align="center" border="0" cellpadding="5" cellspacing="0" style="width: 731px">
            <tr>
                <td style="text-align: left">Имя</td>
                <td class="auto-style3">
                    <asp:TextBox ID="NameTextBox" ToolTip="Введите своё имя" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">Логин
                </td>
                <td class="auto-style3">
                    <%--При визуализации превращается в <input type="text"/>--%>
                    <asp:TextBox ID="LoginTextBox" ToolTip="Введите логин" runat="server" />  
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator1" 
                        runat="server" 
                        ControlToValidate="LoginTextBox" 
                        ErrorMessage="Это поле не может быть пустым!" 
                        ForeColor="Red"
                        ValidationGroup="Registration">
                     </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    Пароль
                </td>
                <td class="auto-style3">
                    <%--TextMode - меняет способ отображения поля ввода--%>
                    <asp:TextBox ID="PasswordTextBox" TextMode="Password" ToolTip="Введите пароль" runat="server" />  
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator2" 
                        runat="server" 
                        ControlToValidate="PasswordTextBox" 
                        ErrorMessage="Это поле не может быть пустым!" 
                        ForeColor="Red"
                        ValidationGroup="Registration">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
                <td style="text-align: left">
                    Подтверждение пароля
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="ConfirmPasswordTextBox" TextMode="Password" ToolTip="Подтвердите пароль" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator3" 
                        runat="server" 
                        ControlToValidate="ConfirmPasswordTextBox" 
                        ErrorMessage="Это поле не может быть пустым!" 
                        ForeColor="Red"
                        ValidationGroup="Registration">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="auto-style6">
                    <asp:CompareValidator 
                        ID="CompareValidatorPassword" 
                        runat="server" 
                        ControlToValidate="ConfirmPasswordTextBox" 
                        ControlToCompare="PasswordTextBox"
                        ErrorMessage="Пароли не совпадают!" 
                        ForeColor="Red"
                        ValidationGroup="Registration">
                    </asp:CompareValidator>
                </td>
            <tr>
                <td style="text-align: left">
                    Email</td>
                <td class="auto-style3">
                    <asp:TextBox ID="EmailTextBox" ToolTip="Введите email" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidatorPassword1" 
                        runat="server" 
                        ControlToValidate="EmailTextBox" 
                        ErrorMessage="Это поле не может быть пустым!" 
                        ForeColor="Red"
                        ValidationGroup="Registration">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style5" style="text-align: left">
                    <asp:Button OnClick="SignUp_Click" Text="Зарегистрироваться" runat="server" Width="145px" ValidationGroup="Registration"/>
                </td>
            </tr>
            </table>
       </div>
</asp:Content>
