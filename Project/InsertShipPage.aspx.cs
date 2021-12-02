using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertShipPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)

    {
        
       
            if (!SpaceShips.Existed(txbName.Text))
            {
                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(Server.MapPath("Images//" + FileUpload1.FileName));
                    SpaceShips s = new SpaceShips(txbName.Text, "Images/" + FileUpload1.FileName, int.Parse(txbHight.Text), int.Parse(txbWidth.Text), int.Parse(txbPrice.Text),float.Parse(txbSpeed.Text),float.Parse(txbDamage.Text),int.Parse(txbLevel.Text));
                    s.Insert();
                    if (SpaceShips.Existed(txbName.Text))
                    {
                        lblError.Text = "The Space Ship " + txbName.Text + " uploaded successfully";
                    }
                    else
                    {
                        lblError.Text = "Space Ship fail upload";
                    }
                }
                else
                {
                    lblError.Text = "Please choose Image";
                }
            }
            else
            {
                lblError.Text = "The Space Ship already exist please choose other Space Ship name";
            
            }
      
    }
    
}