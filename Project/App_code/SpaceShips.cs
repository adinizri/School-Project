using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for SpaceShips
/// </summary>
public class SpaceShips
{

    private string name;// The ship name
    private string picture=@"~\Images\";// the ship's picture img
    private int high;//the ship's hight
    private int width;//the ship's width
    private int price;//the ship's price
    private float speed;// the ship's speed
    private float damage;// the ship's damage
    private int level;// the ship's level
    public SpaceShips(string name, string pic, int high, int width,int price,float speed,float damage,int level)
	{
        this.name = name;
        this.picture = pic;
        this.high = high;
        this.width=width;
        this.price = price;
        this.speed = speed;
        this.damage = damage;
        this.level = level;
	}//  constructor
    public bool Insert()  // function that insert the object to the table
    {
        string query1 = "insert into [SpaceShips]  values('" + this.name + "','" + this.picture + "','" + this.high + "','" + this.width + "','" + this.price + "','" + this.speed + "','" + this.damage + "','"+this.level+"')";
        int row = DataService.ExectureNonQuery(query1);
        if (row > 0)
        {
            return true;
        }
        return false;
    }   
    public static bool Delete(string Name)
    {
        string query = "Delete From[SpaceShips] where([Name]= '" + Name + "')";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;
        }
        return false;
    } // function that get ship's name and deleted the ship from the table 
    public static bool Existed(string Name)
    {
        string query = "select [Name] from [SpaceShips] where ([Name] ='" + Name + "')";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    } //function that return if ship existed in the database 
    public static int GetHight(string name)
    {
        string query = "select [Hight] from [SpaceShips] where([Name]= '" + name + "') ";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return int.Parse(obj.ToString());
        return 0;
    }// function that return the ship's hight
    public static int GetLevel(string name)
    {
        string query = "select [Level] from [SpaceShips] where([Name]= '" + name + "') ";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return int.Parse(obj.ToString());
        return 0;
    }// function that return the ship's level
    public static float GetSpeed(string name)
    {
        string query = "select [Speed] from [SpaceShips] where([Name]= '" + name + "') ";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return float.Parse(obj.ToString());
        return 0;
    }// function that return the ship's speed
    public static float GetDamage(string name)
    {
        string query = "select [Damage] from [SpaceShips] where([Name]= '" + name + "') ";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return float.Parse(obj.ToString());
        return 0;
    }//function that return the ship's damage
    public static int GetWidth(string name)
    {
        string query = "select [Width] from [SpaceShips] where([Name]= '" + name + "') ";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return int.Parse(obj.ToString());
        return 0;
    }// function that return the ship's width
    public static string GetPicture(string name)
    {
        string query = "select [Picture] from [SpaceShips] where([Name]= '" + name + "') ";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return obj.ToString();
        return null;
    }//function that return the ship's picture
    public static int GetPrice(string name)
    {
        string query = "select [Price] from [SpaceShips] where([Name]= '" + name + "') ";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return int.Parse(obj.ToString());
        return 0;
    } //function that return the ship's price 
    public static bool UpdatePicture(string name, string picture)
    {
        string pic = @"~\Images\" + picture;
        string query = "Update [SpaceShips] set [Picture]='"  + pic + "' where([Name]='" + name + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        
    }   //function that update the ship's picture
    public static bool UpdateAll(string name, string pic, int high, int width, int price, float speed, float damage,int level)
    {

        string query = "Update [SpaceShips] set [Picture]='" + pic + "',[Hight]='" + high + "',[Width]='"
            + width + "',[Price]='" + price + "',[Speed]='" + speed + "',[Damage]='" + damage + "',[Level]='"+level+"' where ([Name]='" + name + "')";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;
        }
        return false;
    }//function that update  all the ship's valuse
    public static DataSet GetSpaceShip()
    {
        string query = "select [Name],[Picture],[Hight],[Width],[Price],[Speed]*100 AS [ShipSpeed],[Damage]*100 AS [ShipDamage],[Level] from [SpaceShips]";
        DataSet ds = DataService.GetDataSet(query, "SpaceShips");
        if (ds.Tables["SpaceShips"].Rows.Count == 0)
        {
            return null;
        }
        return ds;
    }//function that return data set of all the ships from the table
    public static DataSet GetSpaceShipForStore()
    {
        string query = "select [Name],[Level],[Picture],[Hight],[Width],[Price],[Speed]*100 AS [ShipSpeed],[Damage]*100 AS [ShipDamage] from [SpaceShips] where [Name]!= 'Default Ship'";
        DataSet ds = DataService.GetDataSet(query, "SpaceShips");
        if (ds.Tables["SpaceShips"].Rows.Count == 0)
        {
            return null;
        }
        return ds;
    }//function that return data set of all the ships except the defult ship from the table 
    public static DataSet GetSpaceShipByName(string ship)
    {
        string query = "select [Name],[Picture],[Hight],[Width],[Price]*0.5 AS[SellPrice],[Speed]*100 AS [ShipSpeed],[Damage]*100 AS [ShipDamage] from [SpaceShips] where([Name]='"+ship+"')";
        DataSet ds = DataService.GetDataSet(query, "SpaceShips");
        if (ds.Tables["SpaceShips"].Rows.Count == 0)
        {
            return null;
        }
        return ds;
    }//function that return data set of the requested ship from the table
}