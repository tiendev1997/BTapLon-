<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BanHangDienTu.Admin.WebForm1" %>

<%@ Register Src="AddItem.ascx" TagName="AddItem" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Bootstrap Core CSS -->
    <link href="Assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="Assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="Assets/dist/css/sb-admin-2.css" rel="stylesheet" />
    <link href="Assets/css/style.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link href="Assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:AddItem ID="AddItem1" runat="server" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Button" />
        </div>
    </form>

    <!-- jQuery -->
    <script src="Assets/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Assets/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="Assets/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="Assets/dist/js/sb-admin-2.js"></script>

</body>
</html>
