using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ManagerPage : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        bool ships =Convert.ToBoolean(Session["BoolShips"].ToString());
          DataService.Path = Page.MapPath(@"\Project\App_Data\Database.mdf");
          if (!IsPostBack)
          {
             
              txbShip.CssClass = "button1";
              txbImg.CssClass = "button2";
              Session["BoolShips"] = true;
              
              this.GridView1.DataSource = SpaceShips.GetSpaceShip();
              GridView1.DataBind();
              this.GridView2.DataSource = PlayersImages.GetAllImagesExceptBeginner();
              this.GridView2.DataBind();
              this.GridView2.Visible = false;

             
          }
          if (!ships)
          {
              this.GridView2.Visible = true;
              this.GridView1.Visible = false;
          }
          else
          {
              this.GridView2.Visible =false;
              this.GridView1.Visible = true;
          }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
     
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string shipName = this.GridView1.Rows[e.RowIndex].Cells[0].Text;
        if (shipName != "Default Ship")
        {
            if (SpaceShips.Delete(shipName))
            {
                if (UserShips.DeleteByShip(shipName))
                {
                    this.GridView1.EditIndex = -1;
                    this.GridView1.DataSource = SpaceShips.GetSpaceShip();
                    this.DataBind();
                }
            }
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        this.GridView1.DataSource = SpaceShips.GetSpaceShip();
        this.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        string shipName = this.GridView1.Rows[e.RowIndex].Cells[0].Text;
        string pic = "Images/";
        int hight = int.Parse(((TextBox)this.GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
        int width = int.Parse(((TextBox)this.GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
        int price = int.Parse(((TextBox)this.GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text);
        TextBox img = (((TextBox)this.GridView1.Rows[e.RowIndex].Cells[4].Controls[0]));
        float speed = float.Parse(((TextBox)this.GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text);
        float damage = float.Parse(((TextBox)this.GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text);
        int level = int.Parse(((TextBox)this.GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text);

        pic += img.Text;


        if(SpaceShips.UpdateAll(shipName, img.Text,hight, width,price,speed/100,(damage/100),level))
        {   
            this.GridView1.EditIndex = -1;
            this.GridView1.DataSource = SpaceShips.GetSpaceShip();
            this.DataBind();
          
        }
        else{
            Response.Write("<script> alert('Update failed')</script>");
        }

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        this.GridView1.EditIndex = -1;
        this.GridView1.DataSource = SpaceShips.GetSpaceShip();
        this.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void txbShip_Click(object sender, EventArgs e)
    {
        Session["BoolShips"] = true;
        txbShip.CssClass = "button1";
        txbImg.CssClass = "button2";
    }
    protected void txbImg_Click(object sender, EventArgs e)
    {
        Session["BoolShips"] = false;
        txbShip.CssClass = "button2";
        txbImg.CssClass = "button1";
    }
}