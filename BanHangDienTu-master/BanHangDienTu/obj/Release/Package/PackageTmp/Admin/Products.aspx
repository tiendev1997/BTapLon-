<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="BanHangDienTu.Admin.AddProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<%@ Register Src="AddItem.ascx" TagName="AddItem" TagPrefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Assets/vendor/jquery/jquery.min.js"></script>
    <script src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Mặt hàng</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-6 col-xs-4">
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control"></asp:TextBox>

                </div>
                <div class="form-group col-md-2 col-sm-2 col-xs-2">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success" Text="Tìm kiếm" />
                </div>
                <div class="form-group col-md-4 col-sm-4 col-xs-4">
                    <a href="#" data-toggle="modal" class="btn btn-primary" data-target="#login-modal">Thêm mới mặt hàng</a>
                </div>
            </div>
        </div>
        <%-- <uc1:AddItem ID="AddItem1" runat="server" />--%>
        <div class="row">
            <div class="col-md-12">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table width="100%" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Danh mục</th>
                                    <th>Tên hàng</th>
                                    <th>Giá</th>
                                    <th>Sale</th>
                                    <th>Số lượng</th>
                                    <th>Ảnh</th>
                                    <th>Mô tả</th>
                                    <th>Chi tiết</th>
                                    <th>Trạng thái</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; i < 10; i++)
                                    { %>
                                <tr>
                                    <td><% Response.Write(i + 1); %> </td>
                                    <td><% Response.Write("Danh muc " + (i + 1)); %> </td>
                                    <td><% Response.Write("Ten hang " + (i + 1)); %> </td>
                                    <td><% Response.Write(i * 2); %> </td>
                                    <td><% Response.Write(i * 3); %> </td>
                                    <td><% Response.Write(i * 5); %> </td>
                                    <td><% Response.Write("Images"); %> </td>
                                    <td><% Response.Write("Mo ta"); %> </td>
                                    <td><% Response.Write("Chi tiet");%> </td>
                                    <td><% Response.Write((i % 2) == 0 ? "Con hang" : "Het hang"); %> </td>
                                    <td class="last">
                                        <a href="#" id="btnUpdate" data-tonge="" data-value="<%= i %>" data-toggle="modal" data-target="#login-modal" class="edit-delete">Sửa</a>|<a data-toggle="modal" data-target="#login-modal" href="#" id="btnDelete" data-value="<%= i %>" class="edit-delete">Xóa</a>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    </div>
    <!-- /.container-fluid -->

    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="popupmodal-container">
                <h1>Thêm mới mặt hàng</h1>
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
                                <asp:FileUpload runat="server" ID="fileUpload" />
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
                                <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="txtContent"></asp:TextBox>
                                <%--<CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl>--%>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <asp:CheckBox ID="ckbRememberMe" runat="server" Text="Remember me" CssClass="checkbox-inline" />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-lg btn-success btn-block" Text="Thêm hàng" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <a href="#" class="btn btn-lg btn-success btn-block" id="btnClose">Đóng</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#btnClose').click(function (e) {
                e.preventDefault();
                $('#login-modal').modal('toggle');
            })

        })
        function showDetails(btn) {
            //var animalType = animal.getAttribute("data-animal-type");
            //alert(animal.innerHTML + " là một loại " + animalType + ".");
            var result = btn.getAttribute("data-value");

        }
    </script>
    <script>
        config = {};
        config.language = 'vi';
        config.entities_latin = false;
        config.toolbarGroups = [
            { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
            { name: 'clipboard', groups: ['clipboard', 'undo'] },
            { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
            { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
            { name: 'links', groups: ['links'] },
            { name: 'insert', groups: ['insert'] },
            { name: 'forms', groups: ['forms'] },
            { name: 'tools', groups: ['tools'] },
            { name: 'document', groups: ['mode', 'document', 'doctools'] },
            { name: 'others', groups: ['others'] },
            '/',
            { name: 'styles', groups: ['styles'] },
            { name: 'colors', groups: ['colors'] },
            { name: 'about', groups: ['about'] }
        ];

        config.removeButtons = 'Underline,Subscript,Superscript,Blockquote,About,Styles,Format,Image,Table,HorizontalRule,SpecialChar,Maximize,Source,Cut,Copy,Paste,PasteText,PasteFromWord,Scayt';
        CKEDITOR.replace('ContentPlaceHolder1_txtContent', config);

    </script>
</asp:Content>
