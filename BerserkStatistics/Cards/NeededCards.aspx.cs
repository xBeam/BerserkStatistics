﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BerserkStatistics.Cards
{
    public partial class NeededCards : System.Web.UI.Page
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
            bool c = CardNameTextBox.Visible ? CardNameTextBox.Visible = false : CardNameTextBox.Visible = true;
            bool q = QuantityTextBox.Visible ? QuantityTextBox.Visible = false : QuantityTextBox.Visible = true;
            bool et = EditionTextBox.Visible ? EditionTextBox.Visible = false : EditionTextBox.Visible = true;
            //bool f = FeaturesTextBox.Visible ? FeaturesTextBox.Visible = false : FeaturesTextBox.Visible = true;
            bool a = AddButton.Visible ? AddButton.Visible = false : AddButton.Visible = true;
            bool r = NeededCardsGridView.Columns[0].Visible ? NeededCardsGridView.Columns[0].Visible = false : NeededCardsGridView.Columns[0].Visible = true;
            bool g = NeededCardsGridView.Columns[4].Visible ? NeededCardsGridView.Columns[4].Visible = false : NeededCardsGridView.Columns[4].Visible = true;
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (CardNameTextBox.Text == null)
                {
                    return;
                }
                HttpCookie userId = Request.Cookies["UserId"];

                var command = new SqlCommand("INSERT INTO Cards (CardName, Quantity, Edition, UserId)VALUES(@cardName, @quantity, @edition, @userId)", _connection);
                // Инициализация переменных в запросе.
                command.Parameters.AddWithValue("@cardName", CardNameTextBox.Text);
                command.Parameters.AddWithValue("@quantity", QuantityTextBox.Text);
                command.Parameters.AddWithValue("@edition", EditionTextBox.Text);
                command.Parameters.AddWithValue("@userId", userId.Value);
                //command.Parameters.AddWithValue("@features", FeaturesTextBox.Text);

                // Выполнение запроса.
                command.ExecuteNonQuery();

                CardNameTextBox.Text = null;
                QuantityTextBox.Text = null;
                EditionTextBox.Text = null;
                //FeaturesTextBox.Text = null;

                Response.Redirect("~/Cards/NeededCards.aspx");
            }
            catch (Exception ex)
            {
                _connection.Close();
            }
        }
    }
}