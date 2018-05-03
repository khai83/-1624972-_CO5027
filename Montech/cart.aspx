<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Montech.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Shopping Cart: Montech Inc.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content1" runat="server">
    <form id="formCart" runat="server">
       
       <asp:DataList ID="dataList1" runat="server" CssClass ="cart">

            <HeaderTemplate>
                <h3>Shopping Cart</h3>
                <table>
                    <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                        </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>                  
                    <td><%#Eval("productName") %></td>
                    <td><%#Eval("productPrice") %></td>
                    <td><%#Eval("quantity") %></td>                    
                    <td><a href="deleteCart.aspx?id=<%#Eval("productID") %>">Remove</a></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
               </table>
            </FooterTemplate>

        </asp:DataList>

        <div class="grandTotal">
            <p>
                <asp:Label ID="gTotal" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
       
        <div class="payBtn">
        <asp:Button ID="Button1" runat="server" Text="Check-Out" OnClick="payment" CssClass="pay" />
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Header3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
