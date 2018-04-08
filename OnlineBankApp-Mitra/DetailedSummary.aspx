<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DetailedSummary.aspx.vb" Inherits="OnlineBankApp_Mitra.DetailedSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br /> <br />
    <h1>Detailed Account Summary</h1>
     <asp:GridView ID="AccountGridView" runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="AccountId" ShowHeaderWhenEmpty="True" CellPadding="4" 
            Height="161px" Width="500px" ForeColor="#333333" GridLines="None">
         <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" ReadOnly="True" />
            <asp:BoundField DataField="TransactionDesc" HeaderText="TransactionDesc" ReadOnly="True"/>
            <asp:BoundField DataField="Withdrawals" HeaderText="Withdrawals" />
            <asp:BoundField DataField="Deposits" HeaderText="Deposits" />
            <asp:BoundField DataField="Balance" HeaderText="Balance" />
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
</asp:Content>
