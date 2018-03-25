using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using BanHangDienTu.Admin.Models;

namespace BanHangDienTu.Admin.Controller
{
    public class LoginController
    {
        private SqlConnection conn;

        public string query
        {
            get
            {
                return @"SELECT [UserID] ,[RoleID],[Avatar],[FullName],[UserName],[Email],[Password] ,[Sex],[Address],[Phone]";
            }
        }

        public LoginController()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLBanHang"].ConnectionString);

        }

        private User GetUser(DataRow dr)
        {
            User user = new User();
            user.ID = int.Parse(dr["UserID"].ToString());
            user.RoleID = int.Parse(dr["RoleID"].ToString());
            if (dr["Avatar"] != null)
            {
                user.Avatar = dr["Avatar"].ToString();
            }
            user.FullName = dr["FullName"].ToString();
            user.UserName = dr["UserName"].ToString();
            user.Email = dr["Email"].ToString();
            user.Password = dr["Password"].ToString();
            user.Sex = bool.Parse(dr["Sex"].ToString());
            if (dr["Address"] != null)
            {
                user.Address = dr["Address"].ToString();
            }
            if (dr["Phone"] != null)
            {
                user.Phone = dr["Phone"].ToString();
            }
            return user;
        }

        public User GetUser(string userName, string password)
        {
            User user = new User();

            string str = query + " FROM [dbo].[User] WHERE UserName = @username and Password = @pass";

            SqlCommand cmd = new SqlCommand(str, conn);
            cmd.Parameters.Add(new SqlParameter("username", userName));
            cmd.Parameters.Add(new SqlParameter("pass", password));

            try
            {
                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while(dr.Read())
                {
                    //User user = new User();
                    user.ID = int.Parse(dr["UserID"].ToString());
                    user.RoleID = int.Parse(dr["RoleID"].ToString());
                    if (dr["Avatar"] != null)
                    {
                        user.Avatar = dr["Avatar"].ToString();
                    }
                    user.FullName = dr["FullName"].ToString();
                    user.UserName = dr["UserName"].ToString();
                    user.Email = dr["Email"].ToString();
                    user.Password = dr["Password"].ToString();
                    //user.Sex = bool.Parse(dr["Sex"].ToString());
                    if (dr["Address"] != null)
                    {
                        user.Address = dr["Address"].ToString();
                    }
                    if (dr["Phone"] != null)
                    {
                        user.Phone = dr["Phone"].ToString();
                    }
                    return user;
                }
            }
            catch { }
            return null;
        }
    }
}