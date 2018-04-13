<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NewAccountRegistration.aspx.vb" Inherits="OnlineBankApp_Mitra.NewAccountRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <div class="alert alert-dismissible alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4 class="alert-heading">Welcome!</h4>
        <p class="mb-0">Once you register your account , we will send you the card within 5 days!</p>
    </div>
    <h1>Register your new Account info</h1>
    <fieldset>
        <div class="form-group">
            <label for="Username">Username</label>
            <asp:TextBox ID="InputUsername" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="AccountId">Account Id</label>
            <asp:TextBox ID="AutoAccntID" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="AccountTypeSelection">Choose Your account type</label>
            <asp:ListBox runat="server" ID="AccountTypeSelection" CssClass="form-control" Width="277px">
                <asp:ListItem Text="Chequing Account"></asp:ListItem>
                <asp:ListItem Text="Savings Account"></asp:ListItem>
            </asp:ListBox>
            <div class="form-group">
                Initial Amount $<asp:TextBox ID="InputBalance" runat="server"
                    type="number" min="200.00" step="0.01" CssClass="form-control" required="true"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    ControlToValidate="InputBalance" runat="server"
                    ErrorMessage="Min 200.00 needed!"
                    ForeColor="Red"
                    ValidationExpression="(\d){3,}([.](\d){1,})?"> </asp:RegularExpressionValidator>
            </div>

            <asp:Button ID="RegisterButton" runat="server" Text="Register"
                type="submit" Class="btn btn-primary" />

            <br />
            <br />

            <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                <strong>
                    <asp:Label ID="lblMessage" runat="server" />
                </strong>
            </div>
        </div>

        <br />
    </fieldset>

    <asp:Button ID="logout" runat="server" Text="Logout"
        type="submit" Class="logoutLblPos" />
    <blockquote class="blockquote text-center">
        <p class="mb-0">I have been customer to Mitra. And working with this institution has been a pleasure</p>
        <footer class="blockquote-footer">Someone famous in <cite title="Source Title">CGI</cite></footer>
    </blockquote>
</asp:Content>
