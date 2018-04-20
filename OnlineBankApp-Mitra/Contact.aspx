<%@ Page Title="Contact Us" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="OnlineBankApp_Mitra.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>
    <p>Feel free to write us on the below address</p>

    <address>
        One Yonge Street<br />
        Ontario, ON M4H 1F4<br />
        <abbr title="Phone">P:</abbr>
        647.555.0100
    </address>

    <address>
        <strong>Support:</strong><a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong><a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>

    
</asp:Content>
