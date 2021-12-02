using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DataService
/// </summary>
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
            return @"Data Source=(LocalDB)\v11.0;AttachDbFilename='" + DataService.path + "';Integrated Security=True";
        }
    }

    static public object ExecuteScalar(string strSql)
    {
        object obj = null;
        SqlConnection conn = new SqlConnection(DataService.ConnectionString);
        SqlCommand cmd = new SqlCommand(strSql, conn);
        try
        {
            conn.Open();
            obj = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            return ex;
        }
        finally
        {
            conn.Close();
        }
        return obj;
    }
    static public int ExecuteNonQuery(string strsql)
    {
        int rowAffected;
        SqlConnection conn = new SqlConnection(DataService.ConnectionString);
        SqlCommand cmd = new SqlCommand(strsql, conn);
        try
        {
            conn.Open();
            rowAffected = cmd.ExecuteNonQuery();
        }
        catch
        {
            return -1;
        }
        finally
        {
            conn.Close();
        }
        return rowAffected;
    }

   

    static public DataSet GetDataSet(string sql, string tblName)
    {
        DataSet ds = new DataSet();
        SqlConnection conn = new SqlConnection(DataService.ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        try
        {
            ad.Fill(ds, tblName);
        }
        catch
        {
            return null;
        }
        if (ds.Tables[0].Rows.Count == 0)
            return null;
        return ds;
    }

}






