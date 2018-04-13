<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AccountSummary.aspx.vb" Inherits="OnlineBankApp_Mitra.AccountSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="logout">
        <asp:LoginStatus ID="LoginStatus1" CssClass="logout" runat="server" />


        <asp:HyperLink ID="HyperLink1" CssClass="logout" href="Default.aspx"
            runat="server">logout</asp:HyperLink>
    </div>
    <h1>Account Summary</h1>
    <asp:GridView ID="AccountGridView" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="AccountId" ShowHeaderWhenEmpty="False" CellPadding="4" Height="161px" Width="500px" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="AccountId" HeaderText="AccountID" ReadOnly="True" />
            <asp:BoundField DataField="AccountDesc" HeaderText="AccountDesc" ReadOnly="True" />
            <asp:BoundField DataField="Balance" HeaderText="Balance" />
            <asp:CommandField ShowDeleteButton="false" ShowEditButton="True" DeleteText="" EditText="Withdraw/Deposit" />
        </Columns>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#E95420" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>

    <div class="card">
        <div class="card-body">
            <h3 class="card-title">New customer ? </h3>
            <h6 class="card-subtitle mb-2 text-muted">Find our exciting produt details</h6>
            <p class="card-text">We offer chequing and saving accounts</p>
            <a href="NewAccountRegistration" class="card-link">Add New Account with us</a>
        </div>
    </div>

</asp:Content>
