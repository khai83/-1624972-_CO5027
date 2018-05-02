<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadImage.aspx.cs" Inherits="Montech.admin.UploadImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Admin - Upload Image: Montech Inc.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header2" runat="server">
    <p>
        Admin Page - Upload Image</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content1" runat="server">
    <form id="formUpload" runat="server">
        <asp:Image ID="uploadedImage" runat="server" />
        <br />
        <br />
        <asp:FileUpload ID="FileUploadImage" runat="server" />
        <br />
        <br />
        <asp:Button CssClass="buttonUp" ID="uploadButton" runat="server" OnClick="updloadButton_Click" Text="Upload" />
        <ul>
            <li><a href="~/admin/index.aspx" runat="server"> Go Back</a></li>
        </ul>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Header3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
