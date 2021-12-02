using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for PlayersImages
/// </summary>
public class PlayersImages
{
   
    private string imageName;//שם התמונה
    private string image;//כתובת התמונה
    private int level;//רמה הנדרשת כדי להקבל את התמונה
	public PlayersImages(string name,string img,int level)
	{
       
        this.imageName = name;
        this.image = img;
        this.level = level;
		
	}//פעולה הבונה עצם מסוג playersImages

    public bool Insert()
    {
        string query = "insert into [PlayersImages]  values('" + this.imageName + "','" + this.image + "','" + this.level + "')";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;
        }
        return false;
    }//מכינה את העצם לטבלת PlayersImages
    public static bool DeleteByName(string name)
    {
        string query = "delete * from [PlayersImages] where(ImageName = '" + name + "')";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;
        }
        return false;
    }//פעולה המקבלת שם של תמונה ומוחקת אותה מהטבלה PlayersImages
    public static DataSet GetAllImages()
    {
        string query = "select * from [PlayersImages]";
        DataSet ds = DataService.GetDataSet(query, "PlayersImages");
        if (ds.Tables["PlayersImages"].Rows.Count == 0)
            return null;
        return ds;
    }//פעולה המחזירה דטה סט של המידע של כל התמונות מהטבלה
    public static DataSet GetAllImagesExceptBeginner()
    {
        string query = "select * from [PlayersImages] where(imageName!='beginner')";
        DataSet ds = DataService.GetDataSet(query, "PlayersImages");
        if (ds.Tables["PlayersImages"].Rows.Count == 0)
            return null;
        return ds;
    }// פעולה המחזירה דטה סט של המידע של כל התמונות מהטבלה חוץ מהתמונה ששמה beginner
    public static DataSet GetImagesByLevel(int level)
    {
    
        string query = "select * from [PlayersImages] where([ImageLevel] <= '"+ level +"' AND [ImageName]!= 'beginner')";
        DataSet ds = DataService.GetDataSet(query, "PlayersImages");
        if (ds.Tables["PlayersImages"].Rows.Count == 0)
            return null;
        return ds;
    }//פעולה שמקבלת רמה ומחזירה דטה סט של כל התמונות שמתחת או שוות לרמה שקיבלה
    public static bool Exist(string name)
    {
        string query = "select ImageName from [PlayersImages] where([ImageName]='" + name + "')";
        object obj = DataService.ExecuteScalar(query);
        if (obj != null)
            return true;
        return false;
    }//פעולה הבודקת אם התמונה קיימת בטבלה
   

}