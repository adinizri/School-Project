using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class BuyPoints : System.Web.UI.Page
{
    ServiceReference1.CreditCardSoapClient service = new ServiceReference1.CreditCardSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.Items.Add("Ils ‏₪‏‏");
            DropDownList1.Items.Add("Dollar $");
            DropDownList1.Items.Add("Euro €");
            for (int intYear = DateTime.Now.Year; intYear < DateTime.Now.Year +20; intYear++)
            {
                drpYear.Items.Add(intYear.ToString());
              
            }
            DataSet ds = service.AllCompanies();

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpCompany.Items.Add(ds.Tables[0].Rows[i][0].ToString());
               
            }

        }
       
    }
   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

            //int p = int.Parse(txbPoints.Text) / 1000;
            //if (DropDownList1.SelectedIndex == 0)
            //{
            //    lblCost.Text = p.ToString("#,##") + "‏₪";
            //}
            //if (DropDownList1.SelectedIndex == 1)
            //{
            //    lblCost.Text = Math.Round(p / 3.7).ToString("#,##") + "‏$";
            //}
            //if (DropDownList1.SelectedIndex == 2)
            //{
            //    lblCost.Text = Math.Round(p / 4.1).ToString("#,##") + "€";
            //}
        
    }
    protected void btnCal_Click(object sender, EventArgs e)
    {
        double p = double.Parse(txbPoints.Text) / 1000;
        if (DropDownList1.SelectedIndex == 0)
        {
            lblCost.Text = Math.Round(p,2).ToString("#,##0.00") + "‏₪";
        }
        if (DropDownList1.SelectedIndex == 1)
        {
            lblCost.Text = Math.Round(p / 3.7,2).ToString("#,##0.00") + "‏$";
        }
        if (DropDownList1.SelectedIndex == 2)
        {
            lblCost.Text = Math.Round(p / 4.1,2).ToString("#,##0.00") + "€";
        }
        
    }
    protected void BtnBuy_Click(object sender, EventArgs e)
    {
        if (txbPoints.Text !="")
        {
            long cost = long.Parse(txbPoints.Text) / 1000;

            long id = long.Parse(txbId.Text);
            int cvv = int.Parse(txbCVV.Text);
            string card = txbCreditCard.Text;
            string val = drpMonth.SelectedValue.ToString() + "/" + drpYear.SelectedValue.ToString();
            string company = drpCompany.SelectedValue.ToString();
            lblError.Visible = true;
            if (service.Exist(card))
            {
                if (service.IsNotExpired(card))
                {
                    if (service.companyBelongToCredit(card, company))
                    {
                        if (service.cvvBelongToCredit(card, cvv))
                        {
                            if (service.IDBelongToCredit(card, id))
                            {
                                if (service.Pay(card, cost))
                                {
                                    Users.UpdatePoints(int.Parse(txbPoints.Text), Session["User name"].ToString());
                                    lblError.Text = "Purchase successful";
                                }
                                else
                                {
                                    lblError.Text = "You don't have enoth money ";
                                }

                            }
                            else
                            {
                                lblError.Text = "Wrong Id";
                            }
                        }
                        else
                        {
                            lblError.Text = "Card's Cvv Error";
                        }
                    }
                }
                else
                {
                    lblError.Text = "Card's company error";
                }
            }
            else
            {
                lblError.Text = "Card's number Error";
            }
        }
    }
   
}