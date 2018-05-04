<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompletePurchase.aspx.cs" Inherits="Montech.CompletePurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Complete Purchase - Thank You
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content1" runat="server">
    <form id="compForm" runat="server">
        <br />
        <br />
        <asp:Literal ID="litInformation" runat="server"></asp:Literal>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Header3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
