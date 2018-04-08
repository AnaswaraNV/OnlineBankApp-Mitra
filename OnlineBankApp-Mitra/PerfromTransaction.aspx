<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" 
    CodeBehind="PerfromTransaction.aspx.vb" Inherits="OnlineBankApp_Mitra.PerfromTransaction"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1>Perform Transaction on your account</h1>
    <fieldset>
        <div class="form-group">
            <label for="Username">Username</label>
            <asp:TextBox ID="InputUsername" runat="server" type="text" class="form-control" readonly="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="AccountId">Account Id</label>
            <asp:TextBox ID="AutoAccntID" runat="server" type="text" class="form-control" readonly="true"></asp:TextBox>
        </div>
       <div class="form-group">
      <label for="AccountTypeSelection">Transaction type</label>
      <asp:ListBox runat="server" ID="TransactionTypeSelection"  CssClass="form-control" Width="277px" Height="56px" ValidateRequestMode="Enabled">
                <asp:ListItem Text="Withdraw"></asp:ListItem>
                <asp:ListItem Text="Deposit"></asp:ListItem>
            </asp:ListBox>
    </div>
        <div>
            Amount $<asp:TextBox ID="InputAmount" runat="server" 
                type="number" min="10" step="0.01" Cssclass="form-control" required="true"></asp:TextBox>
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
            type="submit" Class="btn btn-primary" />
    
        <br />
        <br />
             
        <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
            <strong> 
            <asp:Label ID="lblMessage" runat="server" />
            </strong>
        </div>
        <br />      
    </fieldset>
</asp:Content>
