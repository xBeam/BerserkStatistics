using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace BerserkStatistics.Rating
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userId = Request.Cookies["UserId"];

            if (userId == null)
            {
                Response.Redirect("~/Authentication/Authorization.aspx");
            }

            // Чтение значения строки подключения из web.config из секции <connectionStrings>
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Настройка объекта подключения к базе и открытие подключения.
            _connection = new SqlConnection(connectionString);
            _connection.Open();
        }
        protected void Page_Unload(object sender, EventArgs e)
        {
            // При выгрузке страницы из памяти сервера закрываем подключение к базе данных.
            if (_connection != null && _connection.State != ConnectionState.Closed)
            {
                _connection.Close();
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            bool d = DeckNameTextBox.Visible ? DeckNameTextBox.Visible = false : DeckNameTextBox.Visible = true;
            bool t = TournamentsNumberTextBox.Visible ? TournamentsNumberTextBox.Visible = false : TournamentsNumberTextBox.Visible = true;
            bool w = WinNumberTextBox.Visible ? WinNumberTextBox.Visible = false : WinNumberTextBox.Visible = true;
            bool a = AddButton.Visible ? AddButton.Visible = false : AddButton.Visible = true;
            bool r = RatingGridView.Columns[0].Visible ? RatingGridView.Columns[0].Visible = false : RatingGridView.Columns[0].Visible = true;
            bool g = RatingGridView.Columns[6].Visible ? RatingGridView.Columns[6].Visible = false : RatingGridView.Columns[6].Visible = true;
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            HttpCookie userId = Request.Cookies["UserId"];

            try
            {
                if (TournamentsNumberTextBox.Text == null || DeckNameTextBox.Text == null || WinNumberTextBox.Text == null)
                {
                    return;
                }

                var win = Convert.ToInt32(WinNumberTextBox.Text);
                var tourn = Convert.ToInt32(TournamentsNumberTextBox.Text);
                var loss = tourn * 3 - win;
                var points = tourn == 0
                    ? 0
                    : (decimal.Divide(win, (tourn * 3)) * 100);

                var command = new SqlCommand("INSERT INTO Rating (DeckName, NumberOfTournaments, Win, Loss, PercentPoint, UserId)VALUES(@deckName, @tournaments, @win, @loss, @points, @userId)", _connection);
                // Инициализация переменных в запросе.
                command.Parameters.AddWithValue("@deckName", DeckNameTextBox.Text);
                command.Parameters.AddWithValue("@tournaments", TournamentsNumberTextBox.Text);
                command.Parameters.AddWithValue("@win", WinNumberTextBox.Text);
                command.Parameters.AddWithValue("@loss", loss);
                command.Parameters.AddWithValue("@points", points);
                command.Parameters.AddWithValue("@userId", userId.Value);

                // Выполнение запроса.
                command.ExecuteNonQuery();

                WinNumberTextBox.Text = null;
                DeckNameTextBox.Text = null;
                TournamentsNumberTextBox.Text = null;

                Response.Redirect("~/Rating/Default.aspx");
            }
            catch (Exception ex)
            {
                DeckNameTextBox.Text = ex.Message;
            }
        }
    }
}