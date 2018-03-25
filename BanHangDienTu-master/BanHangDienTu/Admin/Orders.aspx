<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="BanHangDienTu.Admin.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Các Đơn hàng</h1>
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
                                    <td>Tên</td>
                                    <td>Địa chỉ</td>
                                    <td>Điện thoại</td>
                                    <td>Tên hàng</td>
                                    <td>Số lượng</td>
                                    <td>Tổng tiền</td>
                                    <td>Trạng thái</td>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < 10; i++)
                                    { %>
                                <tr>
                                    <td> <% Response.Write(i + 1); %> </td>
                                    <td> <% Response.Write("Khach hang " + (i + 1)); %> </td>
                                    <td> <% Response.Write("Dia chi " + (i + 1)); %> </td>
                                    <td> <% Response.Write("So dien thoai " + (i + 1)); %> </td>
                                    <td> <% Response.Write("Ten hang " + (i + 1)); %> </td>
                                    <td> <% Response.Write("So luong " + (i + 1)); %> </td>
                                    <td> <% Response.Write("Tong tien " + (i * 5)); %> </td>
                                    <% bool a = (i % 2 == 0) ? true : false; %>
                                    <td> <asp:CheckBox runat="server" ID="ckb_Status" Checked="true" Text="Da chuyen hang" /> </td>
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
