<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TransactionWindow.aspx.vb" Inherits="OnlineBankApp_Mitra.TransactionWindow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Perform Transaction on your account</h1>
    <fieldset>
        <div class="alert alert-dismissible alert-warning">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 class="alert-heading">Welcome!</h4>
            <p class="mb-0">Do you know that we offer free consultation on RRSP savings? <a href="#" class="alert-link">Contact your nearest branch for more details.</a>.</p>
        </div>
        <div class="form-group">
            <label for="Username">Username</label>
            <asp:TextBox ID="InputUsername" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="AccountId">Account Id</label>
            <asp:TextBox ID="AutoAccntID" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="AccountTypeSelection">Transaction type</label>
            <asp:ListBox runat="server" ID="TransactionTypeSelection" CssClass="form-control" Width="277px" Height="56px" ValidateRequestMode="Enabled">
                <asp:ListItem Text="Withdraw"></asp:ListItem>
                <asp:ListItem Text="Deposit"></asp:ListItem>
            </asp:ListBox>
        </div>
        <div>
            Amount $<asp:TextBox ID="InputAmount" runat="server"
                type="number" min="10" step="0.01" CssClass="form-control" required="true"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                ControlToValidate="InputAmount" runat="server"
                ErrorMessage="Please enter a valid value!"
                ForeColor="Red"
                ValidationExpression="^(\d){1,}([.](\d){1,})?$">
            </asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <label for="TransxnDesc">Transaction Desc</label>
            <asp:TextBox ID="TransxnDescBox" runat="server" type="text" class="form-control" required="true"></asp:TextBox>
        </div>

        <asp:Button ID="SubmitButton" runat="server" Text="Submit"
            type="submit" Class="btn btn-primary" CausesValidation="False"/>

        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" href="#" data-toggle="modal" 
                        data-target="#mymodal"
                       runat="server">View Details on the current transaction</asp:HyperLink>
        <div class="modal" id="mymodal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Transaction Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Modal body text goes here.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Save changes</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
            <strong>
                <asp:Label ID="lblMessage" runat="server" />
            </strong>
        </div>
        <br />
    </fieldset>
</asp:Content>
