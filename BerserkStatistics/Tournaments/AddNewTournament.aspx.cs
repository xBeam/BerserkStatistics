using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BerserkStatistics.Tournaments
{
    public partial class AddNewTournament : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userId = Request.Cookies["UserId"];

            if (userId == null)
            {
                Response.Redirect("~/Authentication/Authorization.aspx");
            }
        }
    }
}