using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["Points"] = Users.GetPoints(Session["User name"].ToString());
            DataList1.DataSource = SpaceShips.GetSpaceShipForStore();
            DataList1.DataBind();
           
        }
        lblPoints.Text = "Points: " + Session["Points"].ToString();
        
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Buy")
        {
            
                int points = int.Parse(Session["Points"].ToString());
                string ship = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblSpceShipName")).Text;
                int price = int.Parse(((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblShipPrice")).Text);

            

                if (!UserShips.Existed(Session["User Name"].ToString(), ship))
                {
                    if (points >= price)
                    {
                        if(UserShips.CanBuyByLevel(Session["User Name"].ToString(),ship,int.Parse(Session["Level"].ToString())))
                        {
                        UserShips u = new UserShips(Session["User Name"].ToString(), ship,SpaceShips.GetSpeed(ship),SpaceShips.GetDamage(ship),1,1);
                        u.Insert();
                        Users.UpdatePoints((points - price), Session["User Name"].ToString());
                        Session["Points"] = points - price;
                        lblPoints.Text = "Points: " + Session["Points"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('You'r level is too low.');</script>");
                            
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('You Don't have enough points to buy this Space Ship.');</script>");
                    }
                }
                else
                {
                 
                    Response.Write("<script>alert('You already have this Space Ship');</script>");
                }
            
        }
            
    }
}