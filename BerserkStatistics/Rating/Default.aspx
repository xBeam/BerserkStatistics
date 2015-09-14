<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BerserkStatistics.Rating.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
         <div style="margin-top: 0px" class="auto-style11">
                    <div class="auto-style11">
                    <asp:GridView 
                        ID="RatingGridView" 
                        runat="server" 
                        AutoGenerateColumns="False" 
                        BackColor="White" 
                        BorderColor="#DEDFDE" 
                        BorderStyle="None" 
                        BorderWidth="1px" 
                        CellPadding="4" 
                        DataKeyNames="Id" 
                        DataSourceID="RatingSqlDataSource" 
                        ForeColor="Black" 
                        GridLines="Vertical" 
                        AllowSorting="True" HorizontalAlign="Center" Width="675px">
                        <AlternatingRowStyle BackColor="Wheat" />
                        <Columns>
                            <asp:CommandField HeaderText="Редактировать" ShowEditButton="True" Visible="False" />
                            <asp:BoundField DataField="DeckName" HeaderText="Колода" SortExpression="DeckName" />
                            <asp:BoundField DataField="NumberOfTournaments" HeaderText="Количество турниров" SortExpression="NumberOfTournaments" />
                            <asp:BoundField DataField="Win" HeaderText="Победы" SortExpression="Win" />
                            <asp:BoundField DataField="Loss" HeaderText="Поражения" ReadOnly="True" SortExpression="Loss" />
                            <asp:BoundField DataField="PercentPoint" HeaderText="Очки %" ReadOnly="true" SortExpression="PercentPoint" />
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
                    </div>
                    <asp:SqlDataSource ID="RatingSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Rating] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Rating] ([DeckName], [NumberOfTournaments], [Win], [Loss], [PercentPoint], [UserId]) VALUES (@DeckName, @NumberOfTournaments, @Win, @Loss, @PercentPoint, @UserId)" SelectCommand="SELECT * FROM [Rating] WHERE ([UserId] = @UserId) ORDER BY [PercentPoint] DESC" UpdateCommand="UPDATE [Rating] SET [DeckName] = @DeckName, [NumberOfTournaments] = @NumberOfTournaments, [Win] = @Win, [Loss] = @Loss, [PercentPoint] = @PercentPoint, [UserId] = @UserId WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DeckName" Type="String" />
                            <asp:Parameter Name="NumberOfTournaments" Type="Int32" />
                            <asp:Parameter Name="Win" Type="Int32" />
                            <asp:Parameter Name="Loss" Type="Int32" />
                            <asp:Parameter Name="PercentPoint" Type="Decimal" />
                            <asp:Parameter Name="UserId" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:CookieParameter CookieName="UserId" Name="UserId" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DeckName" Type="String" />
                            <asp:Parameter Name="NumberOfTournaments" Type="Int32" />
                            <asp:Parameter Name="Win" Type="Int32" />
                            <asp:Parameter Name="Loss" Type="Int32" />
                            <asp:Parameter Name="PercentPoint" Type="Decimal" />
                            <asp:Parameter Name="UserId" Type="Int32" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:Button ID="EditButton" runat="server" OnClick="EditButton_Click" align="center" Text="Редактировать" Width="130px" />

                    <asp:TextBox ID="DeckNameTextBox" runat="server" ForeColor="Silver" ToolTip="Введите название колоды" Visible="False">Название колоды</asp:TextBox>
                    <script>
                        $(document).ready(function () {
                            $("DeckNameTextBox").focus(function () {
                                $("DeckNameTextBox").text.set(null);
                            });
                        });
                    </script>
                    <asp:TextBox ID="TournamentsNumberTextBox" runat="server" ForeColor="Silver" ToolTip="Введите количество турниров" Visible="False">Количество турниров</asp:TextBox>
                    <asp:TextBox ID="WinNumberTextBox" runat="server" ForeColor="Silver" ToolTip="Введите количество побед" Visible="False">Количество побед</asp:TextBox>
                    <asp:Button ID="AddButton" runat="server" style="margin-left: 0px" Text="Добавить" Visible="False" Width="130px" OnClick="AddButton_Click" />
            </div>
</asp:Content>
