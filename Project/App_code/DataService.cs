using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DataService
/// </summary>
/// 

public class DataService
{
     static private string path;
	 public DataService()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
     static public string Path
     {
         set
         {
             path = value;
         }
         get
         {
             return path;
         }
     }
    static private string ConnectionString 
    {
        get 
        {
            return @"Data Source=(LocalDB)\v11.0;AttachDbFilename='"+DataService.path+"';Integrated Security=True";
        }
    }
    //פעולה להוספה עדכון מחיקה

    static public object ExecuteScalar(string strSql1)
    {
        object obj = null;
        SqlConnection connection = new SqlConnection(DataService.ConnectionString);
        SqlCommand command = new SqlCommand(strSql1, connection);
        try
        {
            connection.Open();
            obj = command.ExecuteScalar();
        }
        catch (Exception ex)
        {
            return ex;
        }
        finally
        {
            connection.Close();
        }
        return obj;
    }
    // פעולה להוספה עדכון ומחיקה
    static public int ExectureNonQuery(string strSql1)
    {
        int rowsAffected;
        SqlConnection connection = new SqlConnection(DataService.ConnectionString);
        SqlCommand command = new SqlCommand(strSql1, connection);
        try
        {
            connection.Open();
            rowsAffected = command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            return -1;
        }
        finally
        {
            connection.Close();
        }
        return rowsAffected;
    }
    // פעולה להצגת יותר מנתון אחד בצורה מחוברת
    static public object DataReader(string strSql)
    {
        SqlConnection con = new SqlConnection(DataService.ConnectionString);
        SqlCommand mycmd = new SqlCommand(strSql, con);
        SqlDataReader dr = null;
        string output = "";
        try
        {
            con.Open();
            dr = mycmd.ExecuteReader();
            while (dr.Read())
            {// יש לבנות אותה לפי הנתונים בטבלה
                output += dr["[User name]"].ToString();
                output += "<br>" + dr["Password"].ToString();
                output += "<br>" + dr["Email"].ToString();
               
            }
        }
        catch (Exception es)
        {
            return es;
        }
        finally
        {
            dr.Close();
            con.Close();
        }
        return output;
    }
    // פעולה להצגת יותר מנתון אחד בצורה מנותקת
    public static DataSet GetDataSet(string sql, string tblName)
    {
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(DataService.ConnectionString);

        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        try
        {
            ad.Fill(ds, tblName);
        }
        catch (Exception ex)
        {
            return null;
        }
        finally
        {

        }
        if (ds.Tables[0].Rows.Count == 0)
            return null;
        return ds;
    }
 
}
    