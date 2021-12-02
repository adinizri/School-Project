using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
/// <summary>
/// Summary description for CreditCard
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class CreditCard : System.Web.Services.WebService {

     public CreditCard () {
        DataService.Path=Server.MapPath("~/App_Data/DataBase.mdf");
       
    }

    [WebMethod]
    public bool IsNotExpired(string cardNumber)
    {
        return CreditAction.IsNotExpired(cardNumber);
    }
    [WebMethod]
    public bool Exist(string cardNumber)
    {
        return CreditAction.Exist(cardNumber);
    }
    [WebMethod]
    public bool Pay(string cardNumber, float price)
    {
        return CreditAction.Pay(cardNumber, price);
    }
    [WebMethod]
    public bool cvvBelongToCredit(string cardNumber,int cvv)
    {
        return CreditAction.cvvBelongToCredit(cardNumber, cvv);
    }
    [WebMethod]
    public bool ExpireDateBelongToCredit(string cardNumber, string ExpireDate)
    {
        return CreditAction.ExpireDateBelongToCredit(cardNumber, ExpireDate);
    }
    [WebMethod]
    public bool companyBelongToCredit(string cardNumber, string company)
    {
        return CreditAction.CompanyBelongToCredit(cardNumber, company);
    }
    [WebMethod]
    public bool IDBelongToCredit(string cardNumber, long ID)
    {
        return CreditAction.IDBelongToCredit(cardNumber, ID);
    }
    [WebMethod]
    public DataSet AllCompanies()
    {
        return CreditAction.AllCompanies();
    }
}
