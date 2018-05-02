<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Montech.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Login: Montech Inc.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header2" runat="server">
    <p>
        Login&nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content1" runat="server">
    <form id="form1" runat="server">
        <div class ="lForm">
        <p>Username:</p>
        <p>
            <asp:TextBox CssClass="formText" ID="logUserNBox" runat="server"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
      
        <p>Password:</p>
        <p>
            <asp:TextBox CssClass="formText" ID="logPassBox" runat="server" TextMode="password"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
      
        <p>
            <asp:Button CssClass="formButton" ID="logButton" runat="server" Text="Login" OnClick="logButton_Click"/>
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>
            <asp:Literal ID="errorLoginLiteral" runat="server"></asp:Literal>
        </p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
            </div>
            <p>
                &nbsp;</p>
        <p>
                &nbsp;</p>
        <p>
                &nbsp;</p>
            <h3>
                New user? Fill in the sign-up form below</h3>
        <p>
                &nbsp;</p>
        <p>
                &nbsp;</p>
        

             <div class ="lForm">
            <h2>
                Sign-up Account</h2>
                 <p>
                     &nbsp;</p>
            <p>
                Username:</p>
            <p>
                <asp:TextBox CssClass="formText" ID="RegUName" runat="server"></asp:TextBox>
        </p>
            <p>
                &nbsp;</p>
            <p>
                Password:</p>
            <p>
                <asp:TextBox CssClass="formText" ID="RegPassw" runat="server" TextMode="password"></asp:TextBox>
        </p>
            <p>
                &nbsp;</p>
                 <p>
                     &nbsp;</p>
                 <p>
                     <asp:Button CssClass="formButton" ID="Button1" runat="server" Text="Sign Up" OnClick="reg_click" style="height: 22px" />
        </p>
                 <p>
                     &nbsp;</p>
            <p>
                <asp:Literal ID="errorRegLiteral" runat="server"></asp:Literal>
            </p>
                 <p>
                     &nbsp;</p>
            <p>
                &nbsp;</p>

            </div>

    </form>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Header3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
