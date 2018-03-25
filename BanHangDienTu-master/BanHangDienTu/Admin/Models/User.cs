using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanHangDienTu.Admin.Models
{
    public class User
    {
        public int ID { get; set; }
        public int RoleID { get; set; }
        public string Avatar { get; set; }
        public string FullName { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool Sex { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
    }
}