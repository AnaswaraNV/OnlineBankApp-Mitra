<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TransactionWindow.aspx.vb" Inherits="OnlineBankApp_Mitra.TransactionWindow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- LOGOUT -->
    <div class="logout-container">
        <span class="avatar-position">
            <asp:Image ID="Image2" ImageUrl="~/Resources/avatar.png"
                class="image-container" runat="server" />
        </span>
        <asp:HyperLink ID="HyperLink1" href="Default.aspx"
            runat="server">
            <asp:Image ID="Image1" ImageUrl="~/Resources/logout.jpg"
                class="image-container" runat="server" />
        </asp:HyperLink>
    </div>
    <h2>Perform Transaction on your account</h2>
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
                    type="submit" Class="btn btn-primary" CausesValidation="False" />

                <br />
                <br />
                <!-- ERROR/MESSAGE LABEL-->
                <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                    <strong>
                        <asp:Label ID="lblMessage" runat="server" />
                    </strong>
                </div>
                <div id="details" runat="server" visible="false">
                    <asp:HyperLink href="TransactionDetails.aspx" runat="server" class="btn btn-link"> View transaction Details</asp:HyperLink>
                </div>
                <br />
            </fieldset>
        </div>

</asp:Content>
