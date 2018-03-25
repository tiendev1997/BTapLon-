using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BanHangDienTu.Entity.EF;

namespace BanHangDienTu.Entity.Dao
{
    public class UserDao
    {
        private DataEntities db;
        private static UserDao instance;

        public static UserDao Instance
        {
            get { if (instance == null) instance = new UserDao(); return instance; }
        }

        private UserDao()
        {
            db = new DataEntities();
        }

        public int CheckUser(string userName, string pass)
        {
            var user = db.Users.Where(x => (x.UserName.Equals(userName) || x.Email.Equals(userName))).FirstOrDefault();
            if(user != null)
            {
                if (user.Password.Equals(pass))
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return -1;
            }
        }

        public User GetUser(string userName)
        {
            return db.Users.Where(x => (x.UserName.Equals(userName) || x.Email.Equals(userName))).First();
        }


        public bool CreateUser(User user)
        {
            try
            {
                db.Users.Add(user);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool UpdateUser(User user)
        {
            var result = db.Users.Find(user.UserID);
            if(result != null)
            {
                result.UserName = user.UserName;
                result.Email = user.Email;
                result.FullName = user.FullName;
                result.Phone = user.Phone;
                result.Sex = user.Sex;
                result.Password = user.Password;
                try {
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}