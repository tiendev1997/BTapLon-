<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Catalogs.aspx.cs" Inherits="BanHangDienTu.Admin.AddCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Danh mục mặt hàng</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <asp:Button ID="btnAdd" runat="server" CssClass="form-control btn btn-success" Text="Thêm mới danh mục" />

                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table width="100%" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Danh mục</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% string[] result = { "SmartPhone", "Mouse", "CPU", "Keyboard",
                                        "Laptop", "Mainboard", "Monitor", "CoolAir", "PSU", "RAM",
                                    "Case", "Stronges", "Tablet","USB","VGA"}; %>
                                <% int i = 1; %>
                                <% foreach (string item in result)
                                    { %>
                                    <tr>
                                        <td><% Response.Write(i); %></td>
                                        <td><% Response.Write(item); %></td>
                                        <td class="last"><a href="#" class="edit-delete">Sửa</a>|<a href="#" class="edit-delete">Xóa</a></td>
                                    </tr>
                                    <% i++; %>
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
