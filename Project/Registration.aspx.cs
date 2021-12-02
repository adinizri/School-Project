using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Registration : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
      
            DataService.Path = Page.MapPath(@"\Project\App_Data\Database.mdf");
            for (int intYear = DateTime.Now.Year; intYear >= DateTime.Now.Year - 30; intYear--)
            {
                drpYear.Items.Add(intYear.ToString());

            }
        }

        int year = Convert.ToInt32(drpYear.SelectedValue);
        //drpYear.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {


        int manager = 0;
        string gender="";
        string birthDay="";
        if (RadioButtonList1.Items[0].Selected)
        {
            gender = "Male";
        }
        else if (RadioButtonList1.Items[1].Selected)
        {
            gender = "Female";
        }
        else if (RadioButtonList1.Items[2].Selected)
        {
            gender = "Other";
        }
        else
        {
            Response.Write("Must pick gender");
        }

        //if (Calendar1.SelectedDate.Date == DateTime.MinValue.Date)
        //{
        //    lblCError.Text = "Please select your BirthDay";
        //}
        //else if (Calendar1.SelectedDate > DateTime.Now)
        //{
           
        //    lblCError.Text = "Please select your BirthDay";
        //}
       
        //else 
        //{
             birthDay = Calendar1.SelectedDate.ToString();
             if (!Users.Existed(txbUserName.Text))
             {
                 Users u = new Users(txbUserName.Text, (txbPassword.Text), txbEmail.Text, gender.ToString(), birthDay.ToString(), txbFirstName.Text, txbLastName.Text, manager);
                 //Ships s = new Ships(txbUserName.Text);

                 if (u.Insert())
                 {
                    
                     string ship = "Default Ship";
                     UserShips s = new UserShips(txbUserName.Text, ship, SpaceShips.GetSpeed(ship), SpaceShips.GetDamage(ship), 1, 1);
                     bool Ship = s.Insert();
                     UserImage ui = new UserImage(txbUserName.Text, "beginner");
                     ui.Insert();
                     Response.Redirect("LogIn.aspx");

                     //}


                 }
                 else
                 {
                     lblSuc.Visible = true;
                     lblSuc.Text = "Error ";
                 }
             }
             else
             {
                 lblSuc.Visible = true;
                 lblSuc.Text = "User already exist";

             }
            
        //}

    }
   
    protected void txbPassword_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogIn.aspx");
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        
    }
    protected void drpYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        int year = Convert.ToInt32(drpYear.SelectedValue);
        Calendar1.VisibleDate = new DateTime(year, 1, 1);   
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsOtherMonth)
        {
            e.Day.IsSelectable = false;
            
        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void RadioButton1_CheckedChanged1(object sender, EventArgs e)
    {

    }
   
}
