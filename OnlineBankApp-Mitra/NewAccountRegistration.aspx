<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NewAccountRegistration.aspx.vb" Inherits="OnlineBankApp_Mitra.NewAccountRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="alert alert-dismissible alert-warning">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <h4 class="alert-heading">Welcome!</h4>
  <p class="mb-0">Do you know that we offer free consultation on RRSP savings? <a href="#" class="alert-link">Contact your nearest branch for more details.</a>.</p>
</div>
     <h1>Register your new Account info</h1>
    <fieldset>
        <div class="form-group">
            <label for="Username">Username</label>
            <asp:TextBox ID="InputUsername" runat="server" type="text" class="form-control" readonly="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="AccountId">Account Id</label>
            <asp:TextBox ID="AutoAccntID" runat="server" type="text" class="form-control" readonly="true"></asp:TextBox>
            <small id="accntHelp" class="form-text text-muted">Please take a note of the account Id</small>
        </div>
       <div class="form-group">
      <label for="AccountTypeSelection">Choose Your account type</label>
      <asp:ListBox runat="server" ID="AccountTypeSelection"  CssClass="form-control" Width="277px">
                <asp:ListItem Text="Checquing Account"></asp:ListItem>
                <asp:ListItem Text="Savings Account"></asp:ListItem>
            </asp:ListBox>
    </div>
        <div>
            Initial Amount $<asp:TextBox ID="InputBalance" runat="server" 
                type="number" min="500.00" step="0.01" Cssclass="form-control" required="true"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        ControlToValidate="InputBalance" runat="server"
                        ErrorMessage="Min 500.00 needed!"
                        ForeColor="Red"
                        ValidationExpression="(\d){3,}([.](\d){1,})?">
             </asp:RegularExpressionValidator>
        </div>
       

        <asp:Button ID="RegisterButton" runat="server" Text="Register" 
            type="submit" Class="btn btn-primary" />
        
        <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
            <strong> 
            <asp:Label ID="lblMessage" runat="server" />
            </strong>
        </div>
        <br />      
    </fieldset>

</asp:Content>
