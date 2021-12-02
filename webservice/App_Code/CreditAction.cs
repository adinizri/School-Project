using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for CreditAction
/// </summary>
public class CreditAction
{
	public CreditAction()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    private string company;// 
    private string cardNumber;//
    private string validity;//
    private int cvv;// 
    private float balance;// 
    private long id;

    // פעולה בונה
    public CreditAction(string company, string cardNumber, string validity, int cvv, float balance, long Id)
    {
        this.id = id;
        this.company = company;
        this.cardNumber = cardNumber;
        this.validity = validity;
        this.cvv = cvv;
        this.balance = balance;
        
    }

    public string Company// שם חברת כרטיסהאשראי
    {
        get
        {
            return this.company;
        }

        set
        {
            this.company = value;
        }
    }
    public string CardNumber// מספר כרטיס האשראי
    {
        get
        {
            return this.cardNumber;
        }

        set
        {
            this.cardNumber = value;
        }
    }
    public string Validity// תוקף של כרטיס האשראי
    {
        get
        {
            return this.validity;
        }

        set
        {
            this.validity = value;
        }
    }
    public int Cvv// מספר ביטחון של כרטיס האשראי
    {
        get
        {
            return this.cvv;
        }

        set
        {
            this.cvv = value;
        }
    }
    public float Balance// יתרה
    {
        get
        {
            return this.balance;
        }

        set
        {
            this.balance = value;
        }
    }
    public long Id// תעודת זהות של בעל כרטיס האשראי
    {
        get
        {
            return this.Id;
        }

        set
        {
            this.Id= value;
        }
    }

    //הפעולה מקבלת מספר כרטיס אשראי ומחזירה אמת אם הוא בתוקף
    static public bool IsNotExpired(string cardNumber)
    {
        string cmd = "select [validity] From [CreditCards] where [cardNumber] = '" + cardNumber + "'";
        object expire = DataService.ExecuteScalar(cmd);
        string e = expire.ToString();
        string year=""+e[3]+e[4]+e[5]+e[6];
        string month=""+e[0]+e[1];
        if (int.Parse(year) > int.Parse(DateTime.Now.Year.ToString()))
            return true;
        else if (int.Parse(year) == int.Parse(DateTime.Now.Year.ToString()))
        {
            if (int.Parse(month) > int.Parse(DateTime.Now.Month.ToString()))
            {
                return true;
            }
            else
                return false;
        }
        return false;
    }

    // הפעולה מקבלת את מספר כרטיס האשראי ומחזירה אמת אם הכרטיס קיים ושקר אם לא
    static public bool Exist(string cardNumber)
    {
        string cmd = "select * From [CreditCards] where [cardNumber] = '" + cardNumber + "'";
        object obj = DataService.ExecuteScalar(cmd);
        if (obj != null)
            return true;
        return false;
    }

    // הפעולה מקבלת את מספר כרטיס האשראיומחיר מסויים ומחזירה אמת אם יש מספיק יתרה כדי לשלם את המחיר ושקר אם לא
    static public bool Pay(string cardNumber, float cost)
    {
        bool CanPay = true;
        string cmd1 = "select [balance] From [CreditCards] where [cardNumber] = '" + cardNumber + "'";
        object obj1 = DataService.ExecuteScalar(cmd1);
        float money = float.Parse(obj1.ToString());
        if (money >= cost)
        {
            float newBalance = float.Parse(obj1.ToString()) - cost;
            string Updatecmd = "update [CreditCards] set [balance]= '" + newBalance + "' where ([cardNumber]= '" + cardNumber + "')";
            DataService.ExecuteNonQuery(Updatecmd);
        }
        else
            CanPay = false;
        return CanPay;
    }

    // הפעולה מקבלת את מספר כרטיס האשראי וקוד ביטחון ומחזירה אמת אם הכרטיס שייך לקוד ביטחון ושקר אם לא
    static public bool cvvBelongToCredit(string cardNumber, int cvv)
    {
        string cmd = "select [cvv] From [CreditCards] where ([cardNumber] = '" + cardNumber + "')";
        object obj = DataService.ExecuteScalar(cmd);
        if (int.Parse(obj.ToString()) == cvv)
            return true;
        return false;
    }

    // טענת כניסה: הפעולה מקבלת את מספר כרטיס האשראי ותוקף של הכרטיס
    //טענת יציאה: הפעולה מחזירה אמת אם הכרטיס שייך לתוקף ושקר אם לא
    static public bool ExpireDateBelongToCredit(string cardNumber, string validity)
    {
        string cmd = "select [validity] From [CreditCards] where ([cardNumber] = '" + cardNumber + "')";
        object obj = DataService.ExecuteScalar(cmd);
        if (obj.ToString() == validity)
            return true;
        return false;
    }

    //  הפעולה מקבלת את מספר כרטיס האשראי וחברת הכרטיס והפעולה מחזירה אמת אם הכרטיס שייך לחברה ושקר אם לא
    static public bool CompanyBelongToCredit(string cardNumber, string company)
    {
        string cmd = "select [company] From [CreditCards] where [cardNumber] = '" + cardNumber + "'";
        object obj = DataService.ExecuteScalar(cmd);
        if (obj.ToString() == company)
            return true;
        return false;
    }

    // הפעולה מקבלת את מספר כרטיס האשראי ות.ז ומחזירה אמת אם הכרטיס שייך לת.ז ושקר אם לא
    static public bool IDBelongToCredit(string cardNumber, long Id)
    {
        string cmd = "select [Id] From [CreditCards] where [cardNumber] = '" + cardNumber + "'";
        object obj = DataService.ExecuteScalar(cmd);
        if (long.Parse(obj.ToString()) == Id)
            return true;
        return false;
    }
    //הפעולה מחזירה את כל חברות כרטיס האשראי הנמצאות בדטה בייס
    public static DataSet AllCompanies()
    {
        string cmd = "select distinct [Company] from [CreditCards]";
        DataSet ds = DataService.GetDataSet(cmd, "Companies");
        if (ds.Tables["Companies"].Rows.Count == 0)
            return null;
        return ds;
    }
    

   

}