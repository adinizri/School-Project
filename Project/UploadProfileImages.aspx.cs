using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UploadProfileImages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (!PlayersImages.Exist(txbImageName.Text))
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("Images//" + FileUpload1.FileName));
                PlayersImages image = new PlayersImages(txbImageName.Text, "Images/" + FileUpload1.FileName.ToString(), int.Parse(txbLevel.Text));
                if (image.Insert())
                {
                    lblError.Text = "Image uploaded successfully";
                }
                else
                {
                    lblError.Text = "Image upload failed please try again";
                }

            }
        }
        else
        {
            lblError.Text = "Image name already taken please try other name";
        }
    }
   
}