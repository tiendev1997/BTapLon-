<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddItem.ascx.cs" Inherits="BanHangDienTu.Admin.AddItem.Add" %>


<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="popupmodal-container">
            <h1>Login to Your Account</h1>
            <br>
            <form>
                <fieldset>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="DropDownList1">Danh mục hàng:</label>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Tên hàng:</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Tên Hàng"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Giá:</label>
                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TextMode="Number" placeholder="Giá"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Sales:</label>
                            <asp:TextBox ID="txtSales" runat="server" CssClass="form-control" TextMode="Number" placeholder="Sales"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Số lượng:</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" TextMode="Number" placeholder="Số lượng"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Ảnh:</label>
                            <input id="File1" type="file" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label>Mô tả:</label>
                            <asp:TextBox ID="txtDescribe" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Mô tả"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label>Chi tiết sản phẩm:</label>
                            <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Chi tiết"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <asp:CheckBox ID="ckbRememberMe" runat="server" Text="Remember me" CssClass="checkbox-inline" />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-lg btn-success btn-block" Text="Thêm hàng" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-lg btn-success btn-block" Text="Đóng" />
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
