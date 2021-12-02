using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class MyProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = UserImage.GetUserImages(Session["User name"].ToString());
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Choose")
        {
            string ImgName = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblName")).Text;
            Users.UpdateProfileImage(Session["User name"].ToString(), ImgName);
        }
    }
}