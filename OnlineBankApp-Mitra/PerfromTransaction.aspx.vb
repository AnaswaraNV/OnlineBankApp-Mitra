Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class PerfromTransaction
    Inherits System.Web.UI.Page
    Dim _username As String
    Dim _accountId As String
    Dim _balance As String

    ''' <summary>
    ''' During page load, find the control and get the row values
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not IsPostBack Then
        Dim login = DirectCast(Session("login"), Model.Login)
        If login IsNot Nothing Then
            _username = login.Username
            Debug.WriteLine("username" & _username)
        Else
            Response.Redirect("Default.aspx")
            End If

            'Dim AccountGridView As New GridView
            'AccountGridView = DirectCast(Session("AccountGridView"), GridView)

            'If (Not (PreviousPage) Is Nothing) Then
            'Dim ContentPlaceHolder1 As Control = PreviousPage.Master.FindControl("MainContent")
            'Dim AccountGridView As GridView = CType(PreviousPage.FindControl("AccountGridView"), GridView)
            'Dim AccountGridView As GridView = DirectCast(Me.Page.PreviousPage.Master.FindControl("AccountGridView"), GridView)
            Dim selectedRow As GridViewRow = DirectCast(Session("SelectedRow"), GridViewRow)
            'Response.Write("accntid: " + selectedRow.Cells(0).Text & "<br />")
            'Response.Write("desc: " + selectedRow.Cells(1).Text & "<br />")
            'Response.Write("balance: " + selectedRow.Cells(2).Text)
            _accountId = selectedRow.Cells(0).Text
            _balance = selectedRow.Cells(2).Text
        'End If
        ' End If
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        Me.InputUsername.Text = _username

        'create dataaccess obj
        Dim dbHandlerObj As New DbHandler()
        Dim index = TransactionTypeSelection.SelectedIndex


        If Not (index = 0 OrElse index = 1) Then
            dvMessage.Visible = True
            lblMessage.Text = "Please enter all fields"
        Else
            Dim desc = TransactionTypeSelection.Items(index).Value
            Dim TransaxnDate As Date = DateAndTime.Now
            Dim amount As Double
            Double.TryParse(Me.InputAmount.Text, amount)
            'new transaction values
            Dim transaction As New Transaction(_username, _accountId, DbHandler.GenerateRandomId(),
                                               amount, desc,
                                               Me.TransxnDescBox.Text, TransaxnDate)
            Dim isSuccess = dbHandlerObj.Create_Transaxn(transaction, _balance)
            'setting message
            dvMessage.Visible = True
            lblMessage.Text = DbHandler.MessageHandler

        End If
    End Sub
End Class