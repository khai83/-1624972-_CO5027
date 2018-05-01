<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="Montech.admin.list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header2" runat="server">
    <p>
        Admin Page - Add &amp; List of Product</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content1" runat="server">
    <form id="form2" runat="server">

        <h2>Add Product</h2>
        <p>&nbsp</p>
        <p>&nbsp</p>
        
        <asp:FormView CssClass="adminListView" ID="FormView1" runat="server" DataKeyNames="productID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
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
                Product Name:
                <asp:TextBox CssClass="adminTextBox" ID="productNameTextBox" runat="server" Text='<%# Bind("productName") %>' />
                <br />
                Product Desc:
                <asp:TextBox CssClass="adminTextBox" ID="productDescTextBox" runat="server" Text='<%# Bind("productDesc") %>' />
                <br />
                Product Price:
                <asp:TextBox CssClass="adminTextBox" ID="productPriceTextBox" runat="server" Text='<%# Bind("productPrice") %>' />
                <br />
                Quantity:
                <asp:TextBox CssClass="adminTextBox" ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                productID:
                <asp:Label ID="productIDLabel" runat="server" Text='<%# Eval("productID") %>' />
                <br />
                productName:
                <asp:Label ID="productNameLabel" runat="server" Text='<%# Bind("productName") %>' />
                <br />
                productDesc:
                <asp:Label ID="productDescLabel" runat="server" Text='<%# Bind("productDesc") %>' />
                <br />
                productPrice:
                <asp:Label ID="productPriceLabel" runat="server" Text='<%# Bind("productPrice") %>' />
                <br />
                quantity:
                <asp:Label ID="quantityLabel" runat="server" Text='<%# Bind("quantity") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db_1624972_co5027_asgConnectionString %>" DeleteCommand="DELETE FROM [tblproduct] WHERE [productID] = @original_productID AND (([productName] = @original_productName) OR ([productName] IS NULL AND @original_productName IS NULL)) AND (([productDesc] = @original_productDesc) OR ([productDesc] IS NULL AND @original_productDesc IS NULL))" InsertCommand="INSERT INTO [tblproduct] ([productName], [productDesc]) VALUES (@productName, @productDesc)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblproduct]" UpdateCommand="UPDATE [tblproduct] SET [productName] = @productName, [productDesc] = @productDesc WHERE [productID] = @original_productID AND (([productName] = @original_productName) OR ([productName] IS NULL AND @original_productName IS NULL)) AND (([productDesc] = @original_productDesc) OR ([productDesc] IS NULL AND @original_productDesc IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_productID" Type="Int32" />
                <asp:Parameter Name="original_productName" Type="String" />
                <asp:Parameter Name="original_productDesc" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="productName" Type="String" />
                <asp:Parameter Name="productDesc" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="productName" Type="String" />
                <asp:Parameter Name="productDesc" Type="String" />
                <asp:Parameter Name="original_productID" Type="Int32" />
                <asp:Parameter Name="original_productName" Type="String" />
                <asp:Parameter Name="original_productDesc" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <p>&nbsp</p>
        <p>&nbsp</p>
        <div class="listP">
        <h2>List of Product</h2>

        <asp:GridView CssClass="adminList" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="productID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="productID" HeaderText="productID" InsertVisible="False" ReadOnly="True" SortExpression="productID" />
                <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                <asp:BoundField DataField="productDesc" HeaderText="productDesc" SortExpression="productDesc" />
                <asp:BoundField DataField="productPrice" HeaderText="productPrice" SortExpression="productPrice" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
                <asp:HyperLinkField DataNavigateUrlFields="productID" DataNavigateUrlFormatString="Edit.aspx?productID={0}" Text="Edit" />
                <asp:HyperLinkField DataNavigateUrlFields="productID" DataNavigateUrlFormatString="UploadImage?productID={0}" Text="Upload Image" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db_1624972_co5027_asgConnectionString %>" DeleteCommand="DELETE FROM [tblproduct] WHERE [productID] = @original_productID AND (([productName] = @original_productName) OR ([productName] IS NULL AND @original_productName IS NULL)) AND (([productDesc] = @original_productDesc) OR ([productDesc] IS NULL AND @original_productDesc IS NULL)) AND (([productPrice] = @original_productPrice) OR ([productPrice] IS NULL AND @original_productPrice IS NULL)) AND (([quantity] = @original_quantity) OR ([quantity] IS NULL AND @original_quantity IS NULL))" InsertCommand="INSERT INTO [tblproduct] ([productName], [productDesc], [productPrice], [quantity]) VALUES (@productName, @productDesc, @productPrice, @quantity)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblproduct]" UpdateCommand="UPDATE [tblproduct] SET [productName] = @productName, [productDesc] = @productDesc, [productPrice] = @productPrice, [quantity] = @quantity WHERE [productID] = @original_productID AND (([productName] = @original_productName) OR ([productName] IS NULL AND @original_productName IS NULL)) AND (([productDesc] = @original_productDesc) OR ([productDesc] IS NULL AND @original_productDesc IS NULL)) AND (([productPrice] = @original_productPrice) OR ([productPrice] IS NULL AND @original_productPrice IS NULL)) AND (([quantity] = @original_quantity) OR ([quantity] IS NULL AND @original_quantity IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_productID" Type="Int32" />
                <asp:Parameter Name="original_productName" Type="String" />
                <asp:Parameter Name="original_productDesc" Type="String" />
                <asp:Parameter Name="original_productPrice" Type="Decimal" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="productName" Type="String" />
                <asp:Parameter Name="productDesc" Type="String" />
                <asp:Parameter Name="productPrice" Type="Decimal" />
                <asp:Parameter Name="quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="productName" Type="String" />
                <asp:Parameter Name="productDesc" Type="String" />
                <asp:Parameter Name="productPrice" Type="Decimal" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="original_productID" Type="Int32" />
                <asp:Parameter Name="original_productName" Type="String" />
                <asp:Parameter Name="original_productDesc" Type="String" />
                <asp:Parameter Name="original_productPrice" Type="Decimal" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            </div>
      
        
        
      </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Header3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
