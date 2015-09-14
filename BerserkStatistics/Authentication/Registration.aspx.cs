using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BerserkStatistics
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Чтение значения строки подключения из web.config из секции <connectionStrings>
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Настройка объекта подключения к базе и открытие подключения.
            _connection = new SqlConnection(connectionString);
            _connection.Open();
        }

            protected void SignUp_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                var command = new SqlCommand("INSERT INTO Users (Login, Password, Email, Name)VALUES(@Login, @Password, @Email, @Name)", _connection);
                // Инициализация переменных в запросе.
                command.Parameters.AddWithValue("@Login", LoginTextBox.Text);
                command.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
                command.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                command.Parameters.AddWithValue("@Name", NameTextBox.Text);

                // Выполнение запроса.
                command.ExecuteNonQuery();

                var loginCookie = new HttpCookie("Login", LoginTextBox.Text);
                var passwordCookie = new HttpCookie("Password", PasswordTextBox.Text);

                Response.Cookies.Add(loginCookie);
                Response.Cookies.Add(passwordCookie);

                Response.Redirect("~/Rating/Default.aspx");
            }
            catch (Exception ex)
            {
                return;
            }
        }
    }
}