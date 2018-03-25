using BanHangDienTu.Entity.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanHangDienTu.Helper;
using BanHangDienTu.Entity.EF;

namespace BanHangDienTu.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUsername.Text = string.Empty;
                txtPassword.Text = string.Empty;
            }

            UserSession session = (UserSession)Session[CommonContants.USE_SESSION];
            if (session != null)
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Kiểm tra đăng nhập ở đây

            var userSession = new UserSession();
            if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {

            }
            else
            {
                int check = UserDao.Instance.CheckUser(txtUsername.Text, txtPassword.Text.GetMD5());
                if (check == 1)
                {
                    User user = UserDao.Instance.GetUser(txtUsername.Text);
                    userSession.UserName = user.UserName;
                    userSession.Password = user.Password;
                    Session.Add(CommonContants.USE_SESSION, userSession);
                    Response.Redirect("Index.aspx");
                }else if(check == 0)
                {
                    msg.Text = "Sai Mật khẩu. Kiểm tra và đăng nhập lại";
                    msg.Visible = true;
                }
                else
                {
                    msg.Text = "Tài khoản không tồn tại. Kiểm tra và đăng nhập lại";
                    msg.Visible = true;
                }

            }

        }
    }
}