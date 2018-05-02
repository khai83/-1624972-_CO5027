<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Montech.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    About: Welcome to Montech Inc.</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header2" runat="server">
    <div id="bannerContact">
    <img src="image/Customer-Services-PPT-Backgrounds.jpg" alt="Montech" />
        <div class="textOver1">
            Contact Us
        </div>
    </div>
   <p>&nbsp;</p>
    <h4>We're ready to help you</h4>
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content1" runat="server">

    <p class="textContact">
    Need further help?
    </p>
    <p class="textContact">
        &nbsp;</p>
    <p class="textContact">
    Please complete our contact form below and we will assist you at our soonest.
    </p>
    <p class="textContact">
        &nbsp;</p>
    <p class="textContact">
    You may also contact or visit us with the address below for more help.
     
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Header3" runat="server">

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
    <form id="form1" runat="server">
<div class="cForm">
    <h3>Contact Form</h3>
  
    
  
    &nbsp;<p>&nbsp;</p>
    <p>Email</p>
    <p>
        <asp:TextBox class="email" ID="emailTextBox" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:RequiredFieldValidator ID="textBoxV" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Email is Mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
    </p>
    <p>Subject</p>
    <p>
        <asp:TextBox class="sub" ID="txtSubject" runat="server"></asp:TextBox>
    </p>
      <p>
        <asp:RequiredFieldValidator ID="subjectTxtV" runat="server" ControlToValidate="txtSubject" ErrorMessage="Subject cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
    </p>
   
    <p>Message:</p>
    <p>
        <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
    <asp:RequiredFieldValidator ID="txtBodyV" runat="server" ControlToValidate="txtBody" ErrorMessage="Please fill in the body" ForeColor="Red"></asp:RequiredFieldValidator>
    </p>
    <p>&nbsp;</p>
    &nbsp;<asp:Button class="sButton" ID="Button1" runat="server" Text="Submit" OnClick="submitButton"></asp:Button>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <asp:Literal ID="litResult" runat="server"></asp:Literal>
    <p>&nbsp;</p>
  
    </div>

    </form>
    <div id="contact">
<h4>Address:</h4>

<ul>
<li>Montech Inc.</li>
<li>Unit 10, Kompleks Seri Niaga</li>
<li>Kampong Kiulap</li>
<li>Bandar Seri Begawan BE1518</li>
<li>Negara Brunei Darussalam</li>
</ul>
</div>
      <div id="map"><noscript><img src="https://maps.googleapis.com/maps/api/staticmap?center=4.902095,114.927434&zoom=15&size=600x300&maptype=roadmap
&markers=color:red%7Clabel:S%7C4.902095,114.927434&key=AIzaSyDg26heJqavCEPExhjcNiiqHoS5Hr71M0U" /></noscript></div>
    <script>
        var map;
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 4.902095, lng: 114.927434 },
                zoom: 15
            });
            var marker = new google.maps.Marker({
                position: { lat: 4.902095, lng: 114.927434 },
                map: map,
                title: 'Montech Inc.'
            });
        }
    </script>
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAPqLyjnoQy4k4-tMWhxE97ZuFJpTe5XZ0&callback=initMap"
    async defer></script>
    
       
</asp:Content>