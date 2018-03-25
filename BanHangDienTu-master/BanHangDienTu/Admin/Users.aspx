<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BanHangDienTu.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Người dùng</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-6 col-xs-6">
                    <input name="txtSearch" type="text" id="ContentPlaceHolder1_txtSearch" class="form-control">
                </div>
                <div class="form-group col-md-2 col-sm-2 col-xs-2">
                    <input type="submit" name="btnSearch" value="Tìm kiếm" id="ContentPlaceHolder1_btnSearch" class="btn btn-success">
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table width="100%" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Tên đăng nhập</td>
                                    <td>Tên</td>
                                    <td>Avatar</td>
                                    <td>Địa chỉ</td>
                                    <td>Điện thoại</td>
                                    <td>Trạng thái</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < 10; i++)
                                    { %>
                                <tr>
                                    <td><% Response.Write(i + 1); %> </td>
                                    <td><% Response.Write("Tên đăng nhập " + (i + 1)); %> </td>
                                    <td><% Response.Write("Tên " + (i + 1)); %> </td>
                                    <td><% Response.Write("Avatar " + (i + 1)); %> </td>
                                    <td><% Response.Write("Địa chỉ " + (i + 1)); %> </td>
                                    <td><% Response.Write("Điện thoại " + (i + 1)); %> </td>
                                    <td>
                                        <asp:CheckBox runat="server" ID="ckb_Status" Checked="false" Text="Khóa" />
                                    </td>
                                    <td>
                                        <a href="#" class="edit-delete">Sửa</a> | <a href="#" class="edit-delete">Xóa</a>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</asp:Content>
