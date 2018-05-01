<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Montech._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Home: Welcome to Montech Inc.</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header2" runat="server">
    <h2>Montech Inc.</h2> 
    <p id="phead">One place to shop monitor screen</p>
   
     <img id="introImage" src="image/OriginalJPG.jpg" alt="Dell UltraSharp Monitor" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content1" runat="server">

    <p class="intro">
        Montech Inc. provides you collections of monitor screen from various brand including Dell, HP, Acer and etc. </p>

    <p class="intro">
        We value your time and money, so now you can shop monitor from our online store with best price and get delivered to your doorstep.
    </p>

    <p class="intro"> Save your time and your money by shopping with us, Montech Inc.
    </p>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Header3" runat="server">
    Product
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
    <form id="form1" runat="server">
   
        <div class="productList">
        <p>
            <asp:Repeater ID="productList" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate><ul></HeaderTemplate>

            <ItemTemplate>
                <li>
                    
                    <a href="<%#Eval("productID", "Product.aspx?id={0}") %>"><img src="<%#Eval("productID", "productImages/{0}.jpg") %>" alt=<%#Eval("productName") %> />
                       <p>&nbsp;</p> <%#Eval("productName") %>
                    </a>

                </li>
                 
            </ItemTemplate>

            <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_1624972_co5027_asgConnectionString %>" SelectCommand="SELECT * FROM [tblproduct]"></asp:SqlDataSource>
        </p>
    </div>

    </form>

</asp:Content>

