using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteUserPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        lblError.Visible = true;
        if (Users.Existed(txbUser.Text, txbPass.Text))
        {
            if (Users.Delete(txbUser.Text)) 
            {
                if (UserShips.DeleteUser(txbUser.Text))
                {
                    if (UserImage.DeleteUser(txbUser.Text))
                    {
                        lblError.Text = "User delete";
                    }
                }
            }

        }
        else if (Users.Existed(txbUser.Text))
        {
            lblError.Text = "Wrong Password";
        }
        else
        {
            lblError.Text = "User Name dosen't exist";
        }
    }
}