<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CardsForSale.aspx.cs" Inherits="BerserkStatistics.Cards.CardsForSale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="margin-top: 0px" class="auto-style9">
                    <div class="auto-style11">
                        <div style="text-align: left">
                    <asp:GridView 
                        ID="CardsForSaleGridView" 
                        runat="server" 
                        AutoGenerateColumns="False" 
                        BackColor="White" 
                        BorderColor="#DEDFDE" 
                        BorderStyle="None" 
                        BorderWidth="1px" 
                        CellPadding="4" 
                        DataKeyNames="Id" 
                        DataSourceID="CardsForSaleSqlDataSource" 
                        ForeColor="Black" 
                        GridLines="Vertical" 
                        AllowSorting="True" HorizontalAlign="Center" Width="742px" >
                        <AlternatingRowStyle BackColor="Wheat" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderText="Править" Visible="False" />
                            <asp:BoundField DataField="CardName" HeaderText="Название карты" SortExpression="CardName" />
                            <asp:BoundField DataField="Quantity" HeaderText="Количество" SortExpression="Quantity" />
                            <asp:BoundField DataField="Edition" HeaderText="Выпуск" SortExpression="Edition" />
                            <asp:BoundField DataField="Features" HeaderText="Особенности" SortExpression="Features" />
                            <asp:CommandField HeaderText="Удалить" ShowDeleteButton="True" Visible="False" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor=" #FFFACD" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                            <asp:SqlDataSource ID="CardsForSaleSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Cards] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Cards] ([CardName], [Edition], [Quantity], [Features], [IsForSale], [UserId]) VALUES (@CardName, @Edition, @Quantity, @Features, @IsForSale, @UserId)" SelectCommand="SELECT * FROM [Cards] WHERE [UserId] = @UserId AND [IsForSale] IS NOT NULL AND [IsForSale] = @IsForSale ORDER BY [CardName]" UpdateCommand="UPDATE [Cards] SET [CardName] = @CardName, [Edition] = @Edition, [Quantity] = @Quantity, [Features] = @Features, [IsForSale] = @IsForSale, [UserId] = @UserId WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CardName" Type="String" />
                                    <asp:Parameter Name="Edition" Type="String" />
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                    <asp:Parameter Name="Features" Type="String" />
                                    <asp:Parameter Name="IsForSale" Type="Boolean" />
                                    <asp:Parameter Name="UserId" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:CookieParameter CookieName="UserId" Name="UserId" Type="Int32" />
                                    <asp:QueryStringParameter Name="IsForSale" QueryStringField="true" Type="Boolean" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CardName" Type="String" />
                                    <asp:Parameter Name="Edition" Type="String" />
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                    <asp:Parameter Name="Features" Type="String" />
                                    <asp:Parameter Name="IsForSale" Type="Boolean" />
                                    <asp:Parameter Name="UserId" Type="Int32" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                     <asp:Button ID="EditButton" runat="server" OnClick="EditButton_Click" align="center" Text="Редактировать" Width="130px" />
                     
                    <asp:TextBox ID="CardNameTextBox" runat="server" ForeColor="Silver" ToolTip="Введите название карты" Visible="False">Название карты</asp:TextBox>
                    <asp:TextBox ID="QuantityTextBox" runat="server" ForeColor="Silver" ToolTip="Введите количество" Visible="False">Количество</asp:TextBox>
                    <asp:TextBox ID="EditionTextBox" runat="server" ForeColor="Silver" ToolTip="Укажите выпуск карты" Visible="False">Выпуск</asp:TextBox>
                    <asp:TextBox ID="FeaturesTextBox" runat="server" ForeColor="Silver" ToolTip="Опишите необходимые особенности" Visible="False">Особенности</asp:TextBox>
                    <script>
                        $(document).ready(function () {
                            $("DeckNameTextBox").focus(function () {
                                $("DeckNameTextBox").text.set(null);
                            });
                        });
                    </script>
                    <asp:Button ID="AddButton" runat="server" style="margin-left: 0px" Text="Добавить" Visible="False" Width="130px" OnClick="AddButton_Click" />
            </div>
     </div>
</asp:Content>
