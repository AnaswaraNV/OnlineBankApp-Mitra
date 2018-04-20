<%@ Page Title="About Us" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="OnlineBankApp_Mitra.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2><%: Title %></h2>
   
    <div class="responsive">
  <div class="gallery">
    <asp:Image ID="Image2" ImageUrl="~/Resources/1.jpg" 
                class="image-container" runat="server" />  
    <div class="desc">The Ready Commitment</div>
  </div>
</div>


<div class="responsive">
  <div class="gallery">
    <asp:Image ID="Image1" ImageUrl="~/Resources/2.jpg" 
                class="image-container" runat="server" />  
    <div class="desc">We celebrate diverse Community</div>
  </div>
</div>

<div class="responsive">
  <div class="gallery">
    <asp:Image ID="Image3" ImageUrl="~/Resources/3.jpg" 
                class="image-container" runat="server" />  
    <div class="desc">Pay online bills on a click</div>
  </div>
</div>

<div class="responsive">
  <div class="gallery">
   <asp:Image ID="Image4" ImageUrl="~/Resources/4.jpg" 
                class="image-container" runat="server" />  
    <div class="desc">We offer variety of services for your financial needs</div>
  </div>
</div>

<div class="clearfix"></div>
</asp:Content>
