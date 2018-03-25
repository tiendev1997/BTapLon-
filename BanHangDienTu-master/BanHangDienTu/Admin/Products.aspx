<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="BanHangDienTu.Admin.AddProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Assets/stytle.css" rel="stylesheet" />
    <script src="Assets/vendor/jquery/jquery.min.js"></script>
    <script src="ckeditor/ckeditor.js"></script>
    <script src="Assets/vendor/bootstrap/js/bootstrap-notify.js"></script>
    <script src="Assets/vendor/bootstrap/js/bootstrap-notify.min.js"></script>
    <script src="Assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        
        td img {
            width: 50px;
            height: 50px;
        }
        .popupmodal-container{
            padding:0px;
            border-radius:5px;
        }
        .modal-header, h4, .close {
            background-color: #5cb85c;
            color: white !important;
            text-align: center;
            font-size: 30px;
        }

        .modal-footer {
            background-color: #f9f9f9;
        }

        #ContentPlaceHolder1_pager {
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Mặt hàng</h1>
            </div>
            <!-- /.col-lg-12 -->
            <asp:SqlDataSource ID="SqlDs_Catalogs" runat="server" ConnectionString="<%$ ConnectionStrings:qlmhdtConnectionString %>" SelectCommand="SELECT [CatalogID], [Name] FROM [Catalog]"></asp:SqlDataSource>
        </div>
        <div class="row">
            <div class="form-group col-md-5 col-sm-5 col-xs-5">
                <label for="ContentPlaceHolder1_cbxCatalog">Lọc theo:</label>
                <asp:DropDownList runat="server" ID="cbxCatalogs" CssClass="btn btn-primary dropdown-toggle" DataTextField="Name" DataValueField="CatalogID" AutoPostBack="True" DataSourceID="SqlDs_Catalogs">
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-3 col-sm-3 col-xs-3">
                <%--<label for="ContentPlaceHolder1_txtSearch">Nhập tên sản phẩm:</label>--%>
                <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group col-md-2 col-sm-2 col-xs-2">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success form-control" Text="Tìm kiếm" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel-body">
                    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
                    <asp:ListView ID="products" runat="server" OnItemCommand="products_ItemCommand" DataSourceID="SqlDS_ProductByCatalog">
                        <LayoutTemplate>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã sản phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Giảm giá</th>
                                        <th>Số lương</th>
<%--                                        <th>Trạng thái</th>
                                        <th>Đã xóa</th>--%>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <th><%# Container.DataItemIndex + 1 %></th>
                                <td><%# Eval("ProductID") %></td>
                                <td>
                                    <img src='../Images/<%# Eval("Image") %>' /></td>
                                <td><%# Eval("Name") %></td>
                                <td><%#String.Format("{0:n0}", (double)Eval("Price"))%> VNĐ</td>
                                <td><%# Eval("Sale") %></td>
                                <td><%# Eval("Amount") %></td>
                                <%--<td><%# Eval("Status") %></td>
                                <th>Đã xóa</th>--%>
                                <td>
                                    <asp:LinkButton runat="server" CommandName="UpdateItem" CommandArgument='<%#Eval("ProductID") %>' CssClass="edit-delete" Text="Sửa" ID="Update"></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" CommandName="DeleteItem" CommandArgument='<%#Eval("ProductID") %>' CssClass="edit-delete" Text="Xóa" ID="LinkButton1"></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="form-group pull-left">
                        <asp:LinkButton runat="server" data-toggle="modal" class="btn btn-primary form-control" data-target="#login-modal" Text="Thêm mới mặt hàng"></asp:LinkButton>         
                    </div>
                    <asp:DataPager ID="pager" runat="server" PagedControlID="products" PageSize="5">
                        <Fields>
                                <asp:NextPreviousPagerField PreviousPageText="Trang trước" ShowFirstPageButton="false" ShowNextPageButton="false" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField LastPageText="Trang cuối" NextPageText="Trang kế" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                    </asp:DataPager>
                    <asp:SqlDataSource ID="SqlDS_ProductByCatalog" runat="server" ConnectionString="<%$ ConnectionStrings:qlmhdtConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([CatalogID] = @CatalogID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cbxCatalogs" Name="CatalogID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!-- /.container-fluid -->

    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="popupmodal-container">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><span id="delete-label"></span>Thêm mới mặt hàng</h4>
                </div>
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
                            </div>
                        </div>
                        <%--<div class="form-row">
                            <div class="form-group col-md-12">
                                <asp:CheckBox ID="ckbRememberMe" runat="server" Text="Remember me" CssClass="checkbox-inline" />
                            </div>
                        </div>--%>

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

    <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog  modal-lg">
            <asp:UpdatePanel ID="updateModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>

                    <div class="popupmodal-container">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"><span id="delete-label"></span>Thông tin sản phẩm</h4>
                        </div>
                        <br>
                        <form>
                            <fieldset>
                                <div class="form-row">
                                    <div class="form-group col-md-12 text-center">
                                        <img runat="server" id="productImage" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Mã sản phẩm</label>
                                        <asp:TextBox ID="txtProduct_ID" ReadOnly="true" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Tên Hàng"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Tên hàng:</label>
                                        <asp:TextBox ID="txtName_Update" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Tên Hàng"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Giá:</label>
                                        <asp:TextBox ID="txtPrice_Update" runat="server" CssClass="form-control" TextMode="Number" placeholder="Giá"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Sales:</label>
                                        <asp:TextBox ID="txtSale_Update" runat="server" CssClass="form-control" TextMode="Number" placeholder="Sales"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Số lượng:</label>
                                        <asp:TextBox ID="txtAmount_Update" runat="server" CssClass="form-control" TextMode="Number" placeholder="Số lượng"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Ảnh:</label>
                                        <asp:FileUpload runat="server" ID="fileUpload1" />
                                        <asp:Button runat="server" ID="btnUpload_UD" OnClick="btnUpload_UD_Click"/>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label>Mô tả:</label>
                                        <asp:TextBox ID="txtDescribe_Update" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Mô tả"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label>Chi tiết sản phẩm:</label>
                                        <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="txtContent_Update"></asp:TextBox>
                                    </div>
                                </div>
                                <%-- <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <asp:checkbox id="checkbox1" runat="server" text="remember me" cssclass="checkbox-inline" />
                                    </div>
                                </div>--%>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-lg btn-success btn-block" Text="Cập nhật" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <button class="btn btn-lg btn-success btn-block" data-dismiss="modal" id="btnClose">Đóng</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
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
