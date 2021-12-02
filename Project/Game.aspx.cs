using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ship=Session["ShipName"].ToString();

        string userName=Session["User name"].ToString();
        hdfDamage.Value = UserShips.GetShipDamage(userName, ship).ToString();
        hdfSpeed.Value = UserShips.GetShipSpeed(userName, ship).ToString(); ;
        hdfShip.Value = SpaceShips.GetPicture(Session["ShipName"].ToString());
        hdfExpPart.Value = Users.GetHaveExp(userName).ToString();

        hdfNeedExp.Value = Users.GetNeededExp(userName).ToString();
        hdfLevel.Value = Users.GetLevel(userName).ToString();
        hdfTotalExp.Value = Users.GetTotalExp(userName).ToString();
        int h = SpaceShips.GetHight(Session["ShipName"].ToString());
        hdfShipH.Value = h.ToString();
        int w = SpaceShips.GetWidth(Session["ShipName"].ToString());
        hdfShipW.Value = w.ToString();
        bool b = Users.UpdateNumGame(Session["User name"].ToString());
        
    }
   

    protected void data_Click(object sender, EventArgs e)
          {
        Session["GamePoints"] = int.Parse(hdfPoints.Value.ToString());
       Session["Win"] = int.Parse(hdfWin.Value.ToString());
        Session["Time"] = double.Parse(hdfTime.Value.ToString());
        
        Session["Level"] = int.Parse(hdfUpdateLevel.Value.ToString());
        Session["TotalExp"] = int.Parse(hdfUpdateTotalExp.Value.ToString());
        checkEnd.Value = "true";
        Response.Redirect("GameOver.aspx");
    }

}