using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for User
/// </summary>

    public class Users
    {
        private string userName;// שם משתמש
        private string password;//סיסמא
        private string email;//אימייל
        private string gender;//מין
        private string birthDay;//יום הולדת
        private string firstName;//שם פרטי
        private string lastName;//שם משפחה
        private double bestTime;//הזמן הכי טוב של השחקן
        private int numWins;//מספר נצחונות
        private int numGames;//מספר משחקים
        private int points;//מספר נקודות השחקן
        private int manager;//האם מנהל
        private int level;//רמת השחקן
        private int totalExp;//כמות הexp
        private int needExp;// כמות הexp הדרושה לעליית רמה
        private string profileImg;
        //פעולה בונה
        public Users(string userName, string password, string email, string gender, string birthDay, string firstName, string lastName,int manager)
        {
            this.userName = userName;
            this.password = password;
            this.email = email;
            this.gender = gender;
            this.birthDay = birthDay;
            this.firstName = firstName;
            this.lastName = lastName;
            this.bestTime = 0;
            this.numWins = 0;
            this.numGames = 0;
            this.points = 0;
            this.manager = manager;
            this.level = 1;
            this.totalExp = 0;
            this.needExp = 1000;
            this.profileImg = "beginner";
        }
        public string UserName
        {
            get
            {
                return this.userName;
            }
            set
            {
                this.userName = value;
            }
        }
        public string Password
        {
            get
            {
                return this.password;
            }
            set
            {
                this.password = value;
            }
        }
        public string Email
        {
            get
            {
                return this.email;
            }
            set
            {
                this.email = value;
            }
        }
        public string Gender
        {
            get
            {
                return this.gender;
            }
            set
            {
                this.gender = value;
            }
        }
        public string BirthDay
        {
            get
            {
                return this.birthDay;
            }
            set
            {
                this.birthDay = value;
            }
        }
        public string FirstName
        {
            get
            {
                return this.firstName;
            }
            set
            {
                this.firstName = value;
            }
        }
        public string LasttName
        {
            get
            {
                return this.lastName;
            }
            set
            {
                this.lastName = value;
            }
        }
       
        public bool Insert()//מוסיפה משתמש לממסד הנתונים
        {
            string query1 = "insert into [Registration]  values('" + this.userName + "','" + this.password + "','" + this.email + "','" + this.gender + "','" + this.birthDay + "','" + this.firstName + "','" + this.lastName + "','" + "0" + "','" + 0 + "','" + 0 + "','" + 0 + "','" + this.manager + "','" + this.level + "','" + this.totalExp + "','" + this.needExp + "','"+this.profileImg+"')";
            int row = DataService.ExectureNonQuery(query1);
            if (row > 0)
            {
                return true;
            }
            return false;
        }
        //פעולת מחיקת משתמש
        public static bool Delete(string userName)
        {
            string query = "Delete From[Registration] where([User name]= '" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;
            }
            return false;
        }
        //פעולה המעדכנת את פרטי המשתמש
        public bool Update(string userName, int password, string email, string gender, string birthDay, string firstName, string lastName)
        {

            string query = "Update [Registration] set [User name]='" + userName + "', [Password]='" + password + "',[Email]='" + email + "',[Gender]='" + gender + "',[BirthDay]='" + birthDay + "',[FirstName]='" + firstName + "',[LastName]='" + lastName + "'where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        //פעולה המעדכנת את כמות משחקי השחקן
        public static bool UpdateNumGame(string userName)
        {

            string query = "Update [Registration] set [Num Games]=( [Num games]+'" + 1 + "') where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        //פעולה הבודקת האם המשתמש הוא מנהל
        public static bool IsManager(string userName)
        {
            string query = "select [User name] from [Registration] where ([User name] ='" + userName + "' AND [Manager]='"+true+"')";
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
        //פעולה המעדכנת את נקודות השחקן
        public static bool UpdatePoints(int points ,string userName)
        {
            string query = "Update [Registration] set [Points]=('" + points + "'+[Points]) where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        //פעולה המעדכנת את כמות הexp הנדרשת כדי לעלות רמה
        public static bool UpdateNeedExp(string userName)
        {

            string query = "Update [Registration] set [NeedExp]=(((500*([Level]-1))+1000)*[Level]) where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        public static bool UpdateLevel(int levels,string userName)
        {

            string query = "Update [Registration] set [Level]='" + levels + "' where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        public static bool UpdateTotalExp(int exp, string userName)
        {

            string query = "Update [Registration] set [TotalExp]='" + exp + "' where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }      
        //פעולה המעדכנת את נתוני השחקן לאחר משחק
        public static bool UpdateAfterGame(int points, int win, string userName)
        {
            string query = "Update [Registration] set [Points]=('" + points + "'+[Points]) ,[Num Wins]=([Num Wins]+'" + win + "') where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        //פעולה המעדכנת את זמן השחקן
        public static bool UpdateBestTime(double best, string userName)
        {
            string query = "Update [Registration] set [Best Time]='" + best + "' where([User name]='" + userName + "' AND ([Best Time]>'" + best + "' OR [Best Time]='" + 0 + "'))";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        public static bool UpdateProfileImage(string userName,string img)
        {
            string query = "Update [Registration] set [ProfileImage]='" +img + "' where([User name]='" + userName + "')";
            int row = DataService.ExectureNonQuery(query);
            if (row > 0)
            {
                return true;

            }
            return false;
        }
        //פעולה המחזירה את מספר הנצחונות
        public static int GetWins(string userName)
        {
            string query = "select [Num Wins] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return int.Parse(obj.ToString());

            }
            return 0;
        }
        //פעולה המחזירה את מספר המשחקים
        public static int GetGames(string userName)
        {
            string query = "select [Num Games] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return int.Parse(obj.ToString());

            }
            return 0;
        }
        //פעולה המחזירה את כמות הנקדות של השחקן
        public static int GetPoints(string userName)
        {
            string query = "select [Points] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return int.Parse(obj.ToString());

            }
            return 0;
        }
        //פעולה המחזירה את הזמן הטוב ביותר של השחקן     
        public static string GetBestTime(string userName)
        {
            string query = "select [Best Time] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return obj.ToString();

            }
            return "0";
        }
        //פעולה המחזירה את כמות הexp של השחקן
        public static int GetTotalExp(string userName)
        {
            string query = "select [TotalExp] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return int.Parse(obj.ToString());

            }
            return 0;
        }
        //פעולה המחזירה את שם תמונת הפרופיל של השחקן
        public static string GetProfileImage(string userName)
        {
            string query = "select [ProfileImage] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return obj.ToString();

            }
            return "";
        }
        //פעולה המחזירה את כמות הexp הנדרשת כדי לעלות רמה
        public static int GetNeededExp(string userName)
        {
            string query = "select [NeedExp] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return int.Parse(obj.ToString());

            }
            return 0;
        }
        //פעולה המחזירה את כמות הexp של השחקן
        public static int GetHaveExp(string userName)
        {
            string query = "select ([TotalExp]-([NeedExp]-([Level]*1000))) from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return int.Parse(obj.ToString());

            }
            return 0;
        }
        //פעולה המחזירה את רמת השחקן
        public static int GetLevel(string userName)
        {
            string query = "select [Level] from [Registration] where ([User name]='" + userName + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return int.Parse(obj.ToString());

            }
            return 0;
        }
        // פעולה הבודקת האם ההמשתמש קיים לפי שם משתמש
        public static bool Existed(string userName)
        {
            string query = "select [User name] from [Registration] where ([User name] ='" + userName + "')";
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
        // פעולה הבודקת האם ההמשתמש קיים לפי שם משתמש וסיסמא
        public static bool Existed(string userName, string pass)
        {
            string query = "select [User name] from [Registration] where ([User name] ='" + userName + "' and [Password]='" + pass + "')";
            object obj = DataService.ExecuteScalar(query);
            if (obj != null)
            {
                return true;
            }
            return false;
        }
       //פעולה המחזריה את נתוני כל המשתמשים
        public static DataSet GetUsers()
        {
            string query = "select* from [Registration]";
            DataSet ds = DataService.GetDataSet(query, "Users");
            if (ds.Tables["Users"].Rows.Count == 0)
            {
                return null;
            }
            return ds;

        }
        //  פעולה המחזירה את נתוני המשתמשים לפי סדר זמן הכי טוב (הכי קצר). א 
        public static DataSet GetUsersByTime()
        {
            string query = "select * from [Registration],[PlayersImages] where ([Best Time]> 0 AND ([ProfileImage]=[ImageName]) )  order by([Best Time]) ";
            DataSet ds = DataService.GetDataSet(query, "Users");
           
            if (ds.Tables["Users"].Rows.Count == 0)
            {
                return null;
            }
            
            return ds;

        }
        //פעולה המחזירה דטה סט של המשתמש
        public static DataSet GetUserData(string userName)
        {
            string query = "Select * from[Registration],[PlayersImages] where ([User name] ='" + userName + "' AND [ProfileImage]=[ImageName])";
            DataSet ds = DataService.GetDataSet(query, "Users");
            if (ds.Tables["Users"].Rows.Count == 0)
            {
                return null;
            }
            return ds;

        }
        //מחזירה משתמש לפי השם משתמש
        public static Users GetUserByUserName(string userName)
        {
            string query = "Select * from[Registration] where ([User name] ='" + userName + "')";
            DataSet ds = DataService.GetDataSet(query, "UserByUserName");
            if (ds.Tables["UserByUserName"].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                string firstName = ds.Tables["UserByUserName"].Rows[0]["FirstName"].ToString();
                string lastName = ds.Tables["UserByUserName"].Rows[0]["LastName"].ToString();
                string email = ds.Tables["UserByUserName"].Rows[0]["Email"].ToString();
                string gender = ds.Tables["UserByUserName"].Rows[0]["Gender"].ToString();
                string password = (ds.Tables["UserByUserName"].Rows[0]["Password"].ToString());
                string birthDay = ds.Tables["UserByUserName"].Rows[0]["BirthDay"].ToString();
                int numWins = int.Parse(ds.Tables["UserByUserName"].Rows[0]["Num Wins"].ToString());
                int numGames = int.Parse(ds.Tables["UserByUserName"].Rows[0]["Num Games"].ToString());
                double bestTime = double.Parse(ds.Tables["UserByUserName"].Rows[0]["Best Time"].ToString());
                int manager = int.Parse(ds.Tables["UserByUserName"].Rows[0]["Manager"].ToString());

                Users u = new Users(userName, password, email, gender, birthDay, firstName, lastName,manager);
                return u;
            }

        }
    }
