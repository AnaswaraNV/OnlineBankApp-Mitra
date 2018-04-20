<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TransactionDetails.aspx.vb" Inherits="OnlineBankApp_Mitra.TransactionDetails" %>

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
    <br />
    <h2>Transaction Details</h2>
    <div class="row summary-container">
        <div class="col-6 summary-left">
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
                    <label for="TransxnId">Transaction Id</label>
                    <asp:TextBox ID="TransactionId" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="AccountTypeSelection">Transaction type</label>
                    <asp:TextBox ID="TransactionType" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Amount">Transaction Amount</label>
                    <asp:TextBox ID="TransactionAmount" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TransxnDesc">Transaction Description</label>
                    <asp:TextBox ID="TransactionDesc" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TransxnDesc">Transaction Date</label>
                    <asp:TextBox ID="TransactionDate" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                </div>
            </fieldset>
        </div>
        <div class="col-4">
            <h3 class="card-header">Bank Anywhere</h3>
            <div class="card-body">
                <h5 class="card-title">Summer deals and Rewards</h5>
                <h6 class="card-subtitle text-muted">Bundle your credit, debit accounts</h6>
            </div>
            <img style="height: 200px; width: 100%; display: block;" src="Resources/business.jpg" alt="Card image">
            <div class="card-body">
                <!--p class="card-text">Put your important, real time banking details right in your hand - wherever you are!</p-->
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">What you need to activate</li>
                <li class="list-group-item">Save time through online banking</li>
                <li class="list-group-item">Try online simulator</li>
            </ul>
            <div class="card-footer text-muted">
                2 days ago
            </div>
        </div>
    </div>
</asp:Content>
