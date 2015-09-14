using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BerserkStatistics.Authentication
{
    public partial class Authorization : System.Web.UI.Page
    {
        SqlConnection _connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userId = Request.Cookies["UserId"];

            if (userId == null)
            {
                WelcomeLabel.Text = "Здравствуйте, гость! <br/> Для продолжения работы вам нужно авторизироваться.";
            }
            else
            {
                HttpCookie userName = Request.Cookies["UserName"];
                HttpCookie login = Request.Cookies["Login"];

                WelcomeLabel.Text = string.Format("Привет, {0}!", userName != null ? userName.Value : login.Value);
            }

            // Чтение значения строки подключения из web.config из секции <connectionStrings>
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Настройка объекта подключения к базе и открытие подключения.
            _connection = new SqlConnection(connectionString);
            _connection.Open();
        }

        protected void Enter_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            var outputList = new List<UserId>();

            SqlDataReader reader = null;
            string login = null;

            // Чтение нескольких строк из базы данных.
            try
            {
                // Создание объекта запроса.
                var command = new SqlCommand("SELECT Login, Password, Id, Name FROM Users", _connection);

                // Создание объекта для построчного считывания данных из базы.
                reader = command.ExecuteReader();

                while (reader.Read())
                {
                    // Получение данных из колонок.
                    outputList.Add(new UserId
                    {
                        Login = Convert.ToString(reader["Login"]),
                        Password = Convert.ToString(reader["Password"]),
                        Name = Convert.ToString(reader["Name"]),
                        Id = Convert.ToInt32(reader["Id"])
                    });
                }

                foreach (var value in outputList)
                {
                    if (LoginTextBox.Text == value.Login)
                    {
                        login = value.Login;
                    }
                }

                if (login == null)
                {
                    WelcomeLabel.Text = "Вы ввели неверные данные!";
                    WelcomeLabel.ForeColor = Color.Red;
                }
                else
                {
                    var user = outputList.SingleOrDefault(c => c.Login == login);

                    if (user == null || user.Password == null || user.Password != PasswordTextBox.Text)
                    {
                        WelcomeLabel.Text = "Вы ввели неверные данные!";
                        WelcomeLabel.ForeColor = Color.Red;
                        return;
                    }

                    WelcomeLabel.Text = string.Format("Привет, {0}!", user.Name ?? LoginTextBox.Text);

                    var loginCookie = new HttpCookie("Login", LoginTextBox.Text);
                    var passwordCookie = new HttpCookie("Password", PasswordTextBox.Text);
                    var userIdCookie = new HttpCookie("UserId", user.Id.ToString());
                    var userNameCookie = new HttpCookie("UserName", user.Name ?? LoginTextBox.Text);

                    Response.Cookies.Add(loginCookie);
                    Response.Cookies.Add(passwordCookie);
                    Response.Cookies.Add(userIdCookie);
                    Response.Cookies.Add(userNameCookie);
                }
            }
            catch (Exception ex)
            {
                WelcomeLabel.Text = "Error: " + ex.Message;
            }
            finally
            {
                // Если reader был открыт освобождаем память, закрывая объект.
                if (reader != null)
                {
                    reader.Close();
                    _connection.Close();
                }
            }
        }
    }

    class UserId
    {
        public int Id;
        public string Login;
        public string Password;
        public string Name;
    }
}