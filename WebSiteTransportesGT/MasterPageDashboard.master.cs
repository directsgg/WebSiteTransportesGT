﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageDashboard : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["usuario"] == null) Response.Redirect("default.aspx");
        //else LabelUsuario.Text = Session["usuario"].ToString();
    }
}
