using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BanHangDienTu.Entity.Dao;
using BanHangDienTu.Entity.EF;
using System.Text;

namespace BanHangDienTu.Admin
{
    public partial class AddCatalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillData();
            }
        }

        /// <summary>
        /// Fill data từ csdl vào list view
        /// </summary>
        private void FillData()
        {
            catalogList.DataBind();
        }

        /// <summary>
        /// Sự kiện phân trang dữ liệu cho list view
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void catalogList_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            FillData();
        }


        /// <summary>
        /// Update một danh mục, khi người dùng nhấn nút ok trên modal 
        /// "sửa thông tin danh mục"
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Update_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(txtCatalogID_Update.Value.ToString());

            Catalog catalog = CatalogDao.Instance.GetCatalog(ID);

            string csName = "InfoScript";
            Type csType = this.GetType();

            ClientScriptManager cs = Page.ClientScript;

            if (catalog != null)
            {
                //Do something to update
                catalog.Name = txtCatalogName_Update.Text.Trim();
                if (CatalogDao.Instance.Update(catalog))
                {
                    //Show notification success create
                    if (!cs.IsStartupScriptRegistered(csType, csName))
                    {
                        StringBuilder csText = new StringBuilder();
                        csText.Append(@"<script> $.notify({
	                title: '<strong>Xong!</strong>',
	                message: 'Sửa thông danh mục thành công.'},{
	                type: 'success'});</script>");
                        cs.RegisterStartupScript(csType, csName, csText.ToString());
                    }
                }
                else
                {
                    //Show notification error create
                    if (!cs.IsStartupScriptRegistered(csType, csName))
                    {
                        StringBuilder csText = new StringBuilder();
                        csText.Append(@"<script> $.notify({
	                title: '<strong>Lỗi!</strong>',
	                message: 'Đã có lỗi xảy ra. Vui lòng thử lại sau.'},{
	                type: 'danger'});</script>");
                        cs.RegisterStartupScript(csType, csName, csText.ToString());
                    }
                }

            }
        }

        /// <summary>
        /// Xóa danh mục khỏi csdl, khi người dùng nhấn nút xóa trên modal
        /// "Xóa danh mục"
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Delete_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(txtCatalogID_Delete.Value.ToString());
            Catalog catalog = CatalogDao.Instance.GetCatalog(ID);

            string csName = "InfoScript";
            Type csType = this.GetType();

            ClientScriptManager cs = Page.ClientScript;

            //Do something to delete
            if (CatalogDao.Instance.Delete(ID))
            {
                //Show notification success create
                if (!cs.IsStartupScriptRegistered(csType, csName))
                {
                    StringBuilder csText = new StringBuilder();
                    csText.Append(@"<script> $.notify({
	                title: '<strong>Xong!</strong>',
	                message: 'Đã xóa danh mục thành công.'},{
	                type: 'success'});</script>");
                    cs.RegisterStartupScript(csType, csName, csText.ToString());
                }
            }
            else
            {
                //Show notification error create
                if (!cs.IsStartupScriptRegistered(csType, csName))
                {
                    StringBuilder csText = new StringBuilder();
                    csText.Append(@"<script> $.notify({
	                title: '<strong>Lỗi!</strong>',
	                message: 'Đã có lỗi xảy ra. Vui lòng thử lại sau.'},{
	                type: 'danger'});</script>");
                    cs.RegisterStartupScript(csType, csName, csText.ToString());
                }
            }
        }


        /// <summary>
        /// Tạo mới danh mục, thêm vào csdl khi người dùng nhấn ok trên modal
        /// "Tạo mới danh mục"
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCreateOk_Click(object sender, EventArgs e)
        {
            Catalog catalog = new Catalog();
            catalog.Name = txtCreateCatalog.Text.Trim();

            string csName = "InfoScript";
            Type csType = this.GetType();

            ClientScriptManager cs = Page.ClientScript;

            if (CatalogDao.Instance.Create(catalog))
            {
                //Show notification success create
                if (!cs.IsStartupScriptRegistered(csType, csName))
                {
                    StringBuilder csText = new StringBuilder();
                    csText.Append(@"<script> $.notify({
	                title: '<strong>Xong!</strong>',
	                message: 'Tạo mới danh mục thành công.'},{
	                type: 'success'});</script>");
                    cs.RegisterStartupScript(csType, csName, csText.ToString());
                }
            }
            else
            {
                //Show notification error create
                if (!cs.IsStartupScriptRegistered(csType, csName))
                {
                    StringBuilder csText = new StringBuilder();
                    csText.Append(@"<script> $.notify({
	                title: '<strong>Lỗi!</strong>',
	                message: 'Đã có lỗi xảy ra. Vui lòng thử lại sau.'},{
	                type: 'danger'});</script>");
                    cs.RegisterStartupScript(csType, csName, csText.ToString());
                }
            }
        }


        /// <summary>
        /// Tạo sự kiện cho nút "Thêm mới danh mục"
        /// hiển thị modal, nhưng chưa tạo mới
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string csName = "CreateScript";
            Type csType = this.GetType();

            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsStartupScriptRegistered(csType, csName))
            {
                StringBuilder csText = new StringBuilder();
                csText.Append("<script> $(document).ready(function(){$('#create').modal({ backdrop: 'static', keyboard: false, show: true });});</script>");
                cs.RegisterStartupScript(csType, csName, csText.ToString());
            }

            
        }


        /// <summary>
        /// Lấy thông tin các item có trong listview, để tạo modal boostrap cũng như gán các giá trị ID
        /// phục vụ cho việc update, delete item.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void catalogList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateItem")
            {
                string catalogID = e.CommandArgument.ToString();
                Catalog catalog = CatalogDao.Instance.GetCatalog(int.Parse(catalogID));
                txtCatalogID_Update.Value = catalog.CatalogID + "";
                txtCatalogName_Update.Text = catalog.Name;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#modalUpdate').modal('show');", true);
                updateModal.Update();
            }
            else if (e.CommandName == "DeleteItem")
            {
                string catalogID = e.CommandArgument.ToString();
                txtCatalogID_Delete.Value = CatalogDao.Instance.GetCatalog(int.Parse(catalogID)).CatalogID + "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#modalDelete').modal('show');", true);
                updateModal.Update();
            }
        }

        protected void btnCreateOk_Click1(object sender, EventArgs e)
        {

        }
    }
}