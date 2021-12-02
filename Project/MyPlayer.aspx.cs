using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class MyPlayer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (!IsPostBack)
        {
            //DataService.Path = Page.MapPath(@"\Project\App_Data\Database.mdf");
            bool manager = (bool)Session["IsManager"];
            if (!manager)
            {
                btnManager.Visible = false;
                btnAdd.Visible = false;
                btnUpload.Visible= false;

            }
            string userName = Session["User name"].ToString();

            DataSet ds = UserShips.GetUserSpaceShip(userName);
            int row = ds.Tables["UserShips"].Rows.Count;
            for (int i = 0; i < row; i++)
            {
                DropDownList1.Items.Add(ds.Tables["UserShips"].Rows[i]["Ship"].ToString());
            }
        }
        
            GridView1.DataSource = Users.GetUserData(Session["User name"].ToString());
            GridView1.DataBind();
            string shipName = DropDownList1.SelectedItem.ToString();

            Session["ShipName"] = shipName;
            DataSet ds2 = UserShips.GetSpaceShipByName(shipName, Session["User name"].ToString());
            DataList1.DataSource = ds2;
            DataList1.DataBind();

            int damagePrice = int.Parse(ds2.Tables["UserShips"].Rows[0]["DamageUpgradePrice"].ToString());
            int SpeedPrice = int.Parse(ds2.Tables["UserShips"].Rows[0]["SpeedUpgradePrice"].ToString());

            double sellingPrice = double.Parse(ds2.Tables["UserShips"].Rows[0]["SellPrice"].ToString());
        }
       
    
    protected void btnManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManagerPage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("InsertShipPage.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSell_Click(object sender, EventArgs e)
    {
        string shipName = ((Label)DataList1.Items[0].FindControl("lblShip")).Text;
        if (shipName != "Default Ship")
        {
            int priceSell = (int.Parse(((Label)DataList1.Items[0].FindControl("lblSell")).Text));

            if (Users.UpdatePoints(priceSell, Session["User name"].ToString()))
            {
                if (UserShips.Delete(Session["User name"].ToString(), shipName))
                {
                    DataSet ds = UserShips.GetUserSpaceShip(Session["User name"].ToString());
                    int row = ds.Tables["UserShips"].Rows.Count;

                    DropDownList1.Items.RemoveAt(DropDownList1.Items.IndexOf(DropDownList1.Items.FindByText(shipName)));
                    DataSet ds2 = UserShips.GetSpaceShipByName("Default Ship", Session["User name"].ToString());
                    DataList1.DataSource = ds2;
                    DataList1.DataBind();
                    GridView1.DataSource = Users.GetUserData(Session["User name"].ToString());
                    GridView1.DataBind();
                }
            }
        }
        else
        {
            Response.Write("<script>alert('You can't sell this SpaceShip');</script>");
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //if (e.CommandName == "Sell")
        //{
        //    int priceSell = (int.Parse(((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblSell")).Text)) * -1;
        //    string ShipName = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblShip")).Text;
        //    if (Users.UpdatePoints(priceSell, Session["User name"].ToString()))
        //    {
        //        if (UserShips.Delete(Session["User name"].ToString(), ShipName))
        //        {
        //            DataSet ds = UserShips.GetUserSpaceShip(Session["User name"].ToString());
        //            int row = ds.Tables["UserShips"].Rows.Count;
        //            for (int i = 0; i < row; i++)
        //            {
        //                DropDownList1.Items.Add(ds.Tables["UserShips"].Rows[i]["Ship"].ToString());
        //            }
        //            DataList1.DataSource = SpaceShips.GetSpaceShipByName("Default Ship");
        //            DataList1.DataBind();
        //        }
        //    }
        //}
        //if (e.CommandName == "UpgradeDamage")
        //{
        //    string user=Session["User name"].ToString();
        //    int price = (int.Parse(((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblDmgPrice")).Text));
        //    string ShipName = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblShip")).Text;
        //    if (Users.GetPoints(user) >= price)
        //    {
        //        if (UserShips.UpgradeDamage(ShipName, user))
        //        {
        //            if (Users.UpdatePoints(price * (-1), user))
        //            {
        //                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Updated');</script>");
        //            }
        //        }
        //    }
        //}
        //if (e.CommandName == "UpgradeSpeed")
        //{
        //    string user = Session["User name"].ToString();
        //    int price = (int.Parse(((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblSpeedPrice")).Text));
        //    string ShipName = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblShip")).Text;
        //    if (Users.GetPoints(user) >= price)
        //    {
        //        if (UserShips.UpgradeSpeed(ShipName, user))
        //        {
        //            if (Users.UpdatePoints(price * (-1), user))
        //            {
        //            }
        //        }
        //    }
        //}
    }


    protected void BtnUpgradeDamage_Click(object sender, EventArgs e)
    {
        string user = Session["User name"].ToString();
        int price = (int.Parse(((Label)DataList1.Items[0].FindControl("lblDmgPrice")).Text));
        string shipName = ((Label)DataList1.Items[0].FindControl("lblShip")).Text;
        if (Users.GetPoints(user) >= price)
        {
            if (UserShips.UpgradeDamage(shipName, user))
            {
                if (Users.UpdatePoints(price * (-1), user))
                {
                    DataSet ds2 = UserShips.GetSpaceShipByName(shipName, Session["User name"].ToString());
                    DataList1.DataSource = ds2;
                    DataList1.DataBind();
                    GridView1.DataSource = Users.GetUserData(Session["User name"].ToString());
                    GridView1.DataBind();
                }
            }
        }
        else
        {
            Response.Write("<script>alert('You dont have enough points');</script>");
        }
    }
    protected void BtnUpgradeSpeed_Click(object sender, EventArgs e)
    {
        string user = Session["User name"].ToString();
        int price = (int.Parse(((Label)DataList1.Items[0].FindControl("lblSpeedPrice")).Text));
        string shipName = ((Label)DataList1.Items[0].FindControl("lblShip")).Text;
        if (Users.GetPoints(user) >= price)
        {
            if (UserShips.UpgradeSpeed(shipName, user))
            {
                if (Users.UpdatePoints(price * (-1), user))
                {

                    DataSet ds2 = UserShips.GetSpaceShipByName(shipName, Session["User name"].ToString());
                    DataList1.DataSource = ds2;
                    DataList1.DataBind();
                    GridView1.DataSource = Users.GetUserData(Session["User name"].ToString());
                    GridView1.DataBind();
                }
            }
        }
        else
        {
            Response.Write("<script>alert('You dont have enough points');</script>");
            
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        Response.Redirect("UploadProfileImages.aspx");
    }


    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
    