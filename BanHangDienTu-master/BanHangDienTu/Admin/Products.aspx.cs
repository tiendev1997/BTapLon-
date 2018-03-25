using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BanHangDienTu.Entity.EF;
using BanHangDienTu.Entity.Dao;


namespace BanHangDienTu.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //FillData();
            }

        }


        /// <summary>
        /// Fill data từ csdl vào list view
        /// </summary>
        //private void FillData()
        //{
        //    cbxCatalogs.DataBind();
        //    cbxCatalogs.SelectedIndex = 0;

        //    products.DataBind();  
        //}

        protected void btnFilter_Click(object sender, EventArgs e)
        {
        }

        protected void products_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateItem")
            {
                Response.Write("Chạy update");
                string productID = e.CommandArgument.ToString();
                Product product = ProductDao.Instance.GetProduct(int.Parse(productID));
                txtProduct_ID.Text = product.ProductID + "";
                txtName_Update.Text = product.Name;
                txtDescribe_Update.Text = product.Describe;
                txtContent_Update.Text = product.Content;
                txtSale_Update.Text = product.Sale + "";
                txtPrice_Update.Text = product.Price + "";
                txtAmount_Update.Text = product.Amount +"";
                txtContent_Update.Text = product.Content;
                productImage.Src = "../"+ product.Image;
                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "update", "$('#update').modal('show');", true);
                updateModal.Update();
            }
            else if (e.CommandName == "DeleteItem")
            {
                //Response.Write("Chạy update");
                //string catalogID = e.CommandArgument.ToString();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "update", "$('#update').modal('show');", true);
                //updateModal.Update();
            }
        }

        protected void btnUpload_UD_Click(object sender, EventArgs e)
        {

        }
    }
}