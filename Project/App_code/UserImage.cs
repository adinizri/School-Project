using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserImage
/// </summary>
public class UserImage
{
    private string userName; //user name
    private string profileImage;//The user optional Profile Image
	public UserImage(string user,string img)
	{
        this.userName = user;
        this.profileImage = img;
	}

    public bool Insert()// insert into the tabel UserImage the userName with his optional Profile Image
    {
        string query1 = "insert into [UserImage]  values('" + this.userName + "','" + this.profileImage + "')";
        int row = DataService.ExectureNonQuery(query1);
        if (row > 0)
        {
            return true;
        }
        return false;
    }
    public static bool DeleteImageFromUser(string userName, string img)//Delete Image from the tabel in the user row
    {
        string query = "Delete From [UserImage] where([User Name]= '" + userName + "' AND [Profile Image]='" + img + "')";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;
        }
        return false;
    
    }
    public static bool DeleteUser(string userName)//Delete all user Images
    {
        string query = "Delete From [UserImage] where([User Name]= '" + userName + "')";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;
        }
        return false;
    }
    public static bool DeleteImage(string img)//delete image from all users
    {
        string query = "Delete From [UserImage] where([Profile Image]='" + img + "')";
        int row = DataService.ExectureNonQuery(query);
        if (row > 0)
        {
            return true;
        }
        return false;

    }
    public static bool Existed(string userName, string img)//check if the user have the image
    {
        string query = "select [User Name] from [UserImage] where ([User name] ='" + userName + "' And [Profile Image] ='" + img + "')";
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

    public static DataSet GetUserImages(string userName)// return all user's images
    {
        string query = "select [Profile Image],[Image],[ImageLevel] from [UserImage],[PlayersImages] where([User Name]='" + userName + "' And[ImageName]=[Profile Image])  order by([ImageLevel])";
        DataSet ds = DataService.GetDataSet(query, "UserImage");
        if (ds.Tables["UserImage"].Rows.Count == 0)
        {
            return null;
        }
        
        return ds;
    }

}