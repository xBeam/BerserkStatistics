﻿using System;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace BerserkStatistics
{
    public partial class Default : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       

        //protected void Enter_Click(object sender, EventArgs e)
        //{
        //    if (!Page.IsValid)
        //    {
        //        return;
        //    }

        //    var loginCookie = new HttpCookie("Login", LoginTextBox.Text);
        //    var passwordCookie = new HttpCookie("Password", PasswordTextBox.Text);

        //    Response.Cookies.Add(loginCookie);
        //    Response.Cookies.Add(passwordCookie);

        //    var readAllOutput = new Dictionary<string,string>();

        //    SqlDataReader reader = null;
        //    string login = null;

        //    // Чтение нескольких строк из базы данных.
        //    try
        //    {
        //        // Создание объекта запроса.
        //        var command = new SqlCommand("SELECT Login, Password FROM Users", _connection);

        //        // Создание объекта для построчного считывания данных из базы.
        //        reader = command.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            // Получение данных из колонок.
        //            string resultKey = Convert.ToString(reader["Login"]);
        //            string resultValue = Convert.ToString(reader["Password"]);

        //            readAllOutput.Add(resultKey, resultValue);
        //        }

        //        foreach (var key in readAllOutput.Keys)
        //        {
        //            if (LoginTextBox.Text == key)
        //            {
        //                login = key;
        //            }
        //        }

        //        if (login == null)
        //        {
        //            WelcomeLabel.Text = "Вы ввели неверные данные!";
        //            WelcomeLabel.ForeColor = Color.Red;
        //        }
        //        else
        //        {
        //            var pass = readAllOutput.SingleOrDefault(c => c.Key == login).Value;

        //            if (pass == null)
        //            {
        //                WelcomeLabel.Text = "Вы ввели неверные данные!";
        //                WelcomeLabel.ForeColor = Color.Red;
        //                return;
        //            }

        //            WelcomeLabel.Text = string.Format("Привет, {0}!", LoginTextBox.Text);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //       WelcomeLabel.Text = "Error: " + ex.Message;
        //    }
        //    finally
        //    {
        //        // Если reader был открыт освобождаем память, закрывая объект.
        //        if (reader != null)
        //        {
        //            reader.Close();
        //        }
        //    }
        //}

        
    }
}