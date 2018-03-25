<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddCatalogs.aspx.cs" Inherits="BanHangDienTu.Admin.AddItem.AddCatalogs" %>
<%@ Register src="AddItem.ascx" tagname="Additem" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <uc1:Additem ID="Add1" runat="server" />
   
</asp:Content>
