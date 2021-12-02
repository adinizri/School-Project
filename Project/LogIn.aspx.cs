using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            DataService.Path = Page.MapPath(@"\Project\App_Data\Database.mdf");
       
       
    }
    protected void btnLog_Click(object sender, EventArgs e)
    {

        if (Users.Existed(txbUser.Text, txbPass.Text))
        {
           Session["User name"] = txbUser.Text;
           Session["IsManager"] = false;
           Session["Points"] = Users.GetPoints(txbUser.Text);
           Session["ShipName"] = "Default Ship";
           Session["Level"] = Users.GetLevel(txbUser.Text);
           Session["BoolShips"] = true;

           if (Users.IsManager(txbUser.Text))
           {
               Session["IsManager"] = true;
           }
            //Session["Points"] = DataService.ExecuteScalar(query3);
            //Session["Best Time"] = DataService.ExecuteScalar(query4);
            //Session["Num Games"] = DataService.ExecuteScalar(query5);
            //Session["Num Wins"] = DataService.ExecuteScalar(query6);
            Response.Redirect("Menu2.aspx");
        }
        else
        {
            if (!Users.Existed(txbUser.Text))
            {
                lblError.Visible = true;
                lblError.Text = "User Doesn't Exist";
            }
            else
            {
                lblError.Text = "Wrong Password";
                lblError.Visible = true;
            }
        }
        
      
    }
       
    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeleteUserPage.aspx");
    }


   
}