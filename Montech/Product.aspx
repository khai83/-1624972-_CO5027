<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Montech.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Product: Montech Inc.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content1" runat="server">
    
    <form id="form1" runat="server">
        <div class="productItem">
        <p>
          
        </p>
        
        <p>
        </p>
            <p>
        </p>
        <p>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="productID" DataSourceID="SqlDataSource1" CssClass="spacing">
                <EditItemTemplate>
                    productID:
                    <asp:Label ID="productIDLabel1" runat="server" Text='<%# Eval("productID") %>' />
                  
                    <br />
                  
                    productName:
                    <asp:TextBox ID="productNameTextBox" runat="server" Text='<%# Bind("productName") %>' />
                  
                    <br />
                  
                    productDesc:
                    <asp:TextBox ID="productDescTextBox" runat="server" Text='<%# Bind("productDesc") %>' />
                 
                    <br />
                    productPrice:
                    <asp:TextBox ID="productPriceTextBox" runat="server" Text='<%# Bind("productPrice") %>' />
                    <br />
                    quantity:
                    <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
                    <br />
                 
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    productName:
                    <asp:TextBox ID="productNameTextBox" runat="server" Text='<%# Bind("productName") %>' />
                 
                    <br />
                 
                    productDesc:
                    <asp:TextBox ID="productDescTextBox" runat="server" Text='<%# Bind("productDesc") %>' />
                  
                    <br />
                    productPrice:
                    <asp:TextBox ID="productPriceTextBox" runat="server" Text='<%# Bind("productPrice") %>' />
                    <br />
                    quantity:
                    <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
                    <br />
                  
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    
                    <img id="pImage" src="<%#Eval("productID", "productImages/{0}.jpg") %>" alt=<%#Eval("productName") %> />

                    <h2><asp:Label ID="productNameLabel" runat="server" Text='<%# Bind("productName") %>' /></h2>
                    <h3>Product Description:</h3>
                    <asp:Label ID="productDescLabel" runat="server" Text='<%# Bind("productDesc") %>' />
                    <h3>Price:</h3>
                    <asp:Label ID="productPriceLabel" runat="server" Text='<%# String.Format("{0:C}", Eval("productPrice")) %>' />
                    <h3>Available Stock:</h3>
                    <asp:Label ID="quantityLabel" runat="server" Text='<%# Bind("quantity") %>' />

                 
                </ItemTemplate>
            </asp:FormView>
        </p>
            <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_1624972_co5027_asgConnectionString %>" SelectCommand="SELECT * FROM [tblproduct] WHERE ([productID] = @productID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="productID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
            <p>
                
            </p>
            <p>
                &nbsp;</p>
            <div class="toCart">
                <asp:Label ID="lprod" runat="server" Text="Enter Quantity"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="textQuantity"></asp:TextBox>

                <asp:Button ID="Button1" runat="server" Text="Add to Cart" OnClick="Button1_Click" CssClass="sButton1" />
            
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
            <p>
                <asp:Literal ID="retryQuantity" runat="server"></asp:Literal>
            </p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
            </div>
        </div>
    </form>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Header3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
