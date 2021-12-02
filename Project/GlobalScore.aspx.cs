using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GlobalScore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataService.Path = Page.MapPath(@"\Project\App_Data\Database.mdf");
        if (!IsPostBack)
        {
            this.GridView1.AllowPaging = true;
            this.GridView1.PageSize = 10;
            this.GridView1.PagerSettings.Mode = PagerButtons.NumericFirstLast;
            this.GridView1.DataSource = Users.GetUsersByTime();
            GridView1.DataBind();
        }

    }
}