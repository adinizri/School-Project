using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class GameOver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        hdfTitle.Value = "0" ;
        int x = int.Parse(Session["GamePoints"].ToString());
        Users.UpdateAfterGame(int.Parse(Session["GamePoints"].ToString()), int.Parse(Session["Win"].ToString()), Session["User name"].ToString());
        int w=int.Parse(Session["Win"].ToString());
        if(w>0)
        {
            hdfTitle.Value = "1";
        bool b=Users.UpdateBestTime(double.Parse(Session["Time"].ToString()), Session["User name"].ToString());
        }
        Users.UpdateTotalExp(int.Parse(Session["TotalExp"].ToString()), Session["User name"].ToString());
        Users.UpdateLevel(int.Parse(Session["Level"].ToString()), Session["User name"].ToString());
        Users.UpdateNeedExp(Session["User name"].ToString());
       
        int level = Users.GetLevel(Session["User name"].ToString());
        DataSet img = PlayersImages.GetImagesByLevel(level);
        if (img.Tables.Count > 0)
        {
            for (int i = 0; i < img.Tables[0].Rows.Count; i++)
            {
                if (!UserImage.Existed(Session["User name"].ToString(), img.Tables[0].Rows[i][0].ToString()))
                {
                    UserImage ui = new UserImage(Session["User name"].ToString(), img.Tables[0].Rows[i][0].ToString());
                    ui.Insert();
                }
            }
        }
        
    }
}