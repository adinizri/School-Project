using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for UserShips
/// </summary>
public class UserShips
{
    private string userName;//שם המשתמש
    private string ShipName;//שם החללית
    private float shipSpeed;//מהירות החללית
    private float shipDamage;//כח החללית
    private float speedUpgrade;//שידרוג מהירות
    private float damageUpgrade;//שידרוג כח
   
    public UserShips(string userName, string ShipName, float shipSpeed, float shipDamage, float speedUpgrade, float damageUpgrade)
	{
        this.userName = userName;
        this.ShipName = ShipName;
        this.shipSpeed = shipSpeed;
        this.shipDamage = shipDamage;
        this.speedUpgrade = speedUpgrade;
        this.damageUpgrade = damageUpgrade;
        

	}//פעולה בונה

    public bool Insert()
    {
        string query1 = "insert into [UserShips]  values('" + this.userName + "','" + this.ShipName + "','"+this.damageUpgrade+"','"+this.speedUpgrade+"','"+this.shipSpeed+"','"+this.shipDamage+"')";
        int row = DataService.ExectureNonQuery(query1);
        if (row > 0)
        {
            return true;
        }
        return false;
    }//מכניסה את העצם לטבלה user Ships  
    public static bool CanBuyByLevel(string userName, string ShipName,int level)
    {
        string query = "select [Name] from [SpaceShips] where ([Level] <='" + level + "' And [Name] ='" + ShipName + "')";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }//פעולה הבודקת אם השחקן יכול לקנות את החללית  
    public static bool Delete(string userName, string ShipName)
    {
        string query1 = "Delete from  [UserShips]  where ([User Name]='" + userName + "'And [Ship]='" + ShipName + "')";
        int row = DataService.ExectureNonQuery(query1);
        if (row > 0)
        {
            return true;
        }
        return false;
    }//פעולה המוחקת חללית של שחקן מהטבלה
    public static bool DeleteUser(string userName)
    {
        string query1 = "Delete from  [UserShips]  where ([User Name]='" + userName + "')";
        int row = DataService.ExectureNonQuery(query1);
        if (row > 0)
        {
            return true;
        }
        return false;
    }//פעולה המוחקת את כל החלליות של השחקן מהטבלה
    public static bool DeleteByShip(string ShipName)
    {
        string query1 = "Delete from  [UserShips]  where ([Ship]='" + ShipName + "')";
        int row = DataService.ExectureNonQuery(query1);
        if (row > 0)
        {
            return true;
        }
        return false;
    }//פעולה המוחקת את החללית מכל המשתמשים
    public static bool Existed(string userName, string ShipName)// פעולה הבודקת אם החללית קיימת עם השחקן בטבלה
    {
        string query = "select [User name] from [UserShips] where ([User name] ='" + userName + "' And [Ship] ='" + ShipName + "')";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static float GetShipSpeed(string userName, string ShipName)
    {
        string query = "select [Ship Speed] from [UserShips] where ([User name] ='" + userName + "' And [Ship] ='" + ShipName + "')";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
        {
            return float.Parse(obj.ToString());
        }
        else
        {
            return 0;
        }
    }//פעולה המחזירה את מהירות החללית הנדרשת של השחקן
    public static float GetShipDamage(string userName, string ShipName)
    {
        string query = "select [Ship Damage] from [UserShips] where ([User name] ='" + userName + "' And [Ship] ='" + ShipName + "')";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
        {
            return float.Parse(obj.ToString());
        }
        else
        {
            return 0;
        }
    }//פעולה המחזירה את הכח של החללית הנדרשת של השחקן
    public static bool UpgradeSpeed(string ship, string userName)
    {
        string query = "Update [UserShips] set [Ship Speed]=ROUND([Ship Speed]*1.03,2),[Speed Upgrade]=[Speed Upgrade]+1 where([Ship]='" + ship + "' AND [User Name]='" + userName + "' AND ([Damage Upgrade]+[Speed Upgrade]<14))";
    int row = DataService.ExectureNonQuery(query);
    if (row > 0)
    {
        return true;

    }
    return false;
    }  // פעולה שמשדרגת את מהירות החללית הנדרשת של השחקן
    public static bool UpgradeDamage(string ship, string userName)
    {
        string query = "Update [UserShips] set [Ship Damage]=ROUND([Ship Damage]*1.03,2),[Damage Upgrade]=[Damage Upgrade]+1 where([Ship]='" + ship + "' AND [User Name]='" + userName + "' AND ([Damage Upgrade]+[Speed Upgrade]<14))";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;

        }
        return false;
    }// פעולה שמשדרגת את כח החללית הנדרשת של השחקן
    public static DataSet GetUserSpaceShip(string userName)
    {
        string query = "select [Ship] from [UserShips] where([User Name]='"+userName+"')";
        DataSet ds = DataService.GetDataSet(query, "UserShips");
        if (ds.Tables["UserShips"].Rows.Count == 0)
        {
            return null;
        }
        return ds;
    } // פעולה המחזירה דטה סט של כל חלליות השחקן
    public static DataSet GetSpaceShipByName(string ship ,string userName)
    {
        string query;
        if (ship == "Default Ship")
        {
            query = "select [Ship],[Picture],CAST([Price]*0.5 As INT) AS [SellPrice],[Ship Speed]*100 AS [ShipSpeed],[Ship Damage]*100 AS [ShipDamage],ROUND([Ship Damage]*1.03*100,0) AS[AfterDamageUpgrade],ROUND([Ship Speed]*1.03*100,0) AS[AfterSpeedUpgrade],1000*0.5*[Damage Upgrade] AS [DamageUpgradePrice],1000*0.5*[Speed Upgrade] As[SpeedUpgradePrice],14-[Speed Upgrade]-[Damage Upgrade] AS [UpgradesLeft] from [UserShips],[SpaceShips] where([Name]='" + ship + "' AND [User Name]='" + userName + "' AND [Ship]='" + ship + "')";
        }
        else
        {
            query = "select [Ship],[Picture],CAST([Price]*0.5 As INT) AS[SellPrice],[Ship Speed]*100 AS [ShipSpeed],[Ship Damage]*100 AS [ShipDamage],ROUND([Ship Damage]*1.03*100,0) AS[AfterDamageUpgrade],ROUND([Ship Speed]*1.03*100,0) AS[AfterSpeedUpgrade],[Price]*0.5*[Damage Upgrade] AS [DamageUpgradePrice],[Price]*0.5*[Speed Upgrade] As[SpeedUpgradePrice],14-[Speed Upgrade]-[Damage Upgrade] AS [UpgradesLeft] from [UserShips],[SpaceShips] where([Name]='" + ship + "' AND [User Name]='" + userName + "' AND [Ship]='" + ship + "')";
        } 
        DataSet ds = DataService.GetDataSet(query, "UserShips");
        if (ds.Tables["UserShips"].Rows.Count == 0)
        {
            return null;
        }
        return ds;
    }// פעולה המחזירה דטה סא של חחלי השחקן
    

}