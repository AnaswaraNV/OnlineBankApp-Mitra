Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class TransactionWindow
    Inherits System.Web.UI.Page
    Dim _username As String
    Dim _accountId As String
    Dim _balance As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim login = DirectCast(Session("login"), Model.Login)
        If login IsNot Nothing Then
            _username = login.Username
        Else
            Response.Redirect("Default.aspx")
        End If
        Dim selectedRow As GridViewRow = DirectCast(Session("SelectedRow"), GridViewRow)
        _accountId = selectedRow.Cells(0).Text
        _balance = selectedRow.Cells(2).Text
    End Sub

    Private Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        CreateTransaction()
    End Sub

    ''' <summary>
    ''' A new transaction is created
    ''' </summary>
    Private Sub CreateTransaction()
        Me.InputUsername.Text = _username
        'create dataaccess obj
        Dim dbHandlerObj As New DbHandler()
        Dim index = TransactionTypeSelection.SelectedIndex


        If Not (index = 0 OrElse index = 1) Then
            dvMessage.Visible = True
            lblMessage.Text = "Please enter all fields"
        Else
            'transaction type is set based on user input
            Dim type As Char
            If index = 0 Then
                type = "W"
            ElseIf index = 1 Then
                type = "D"
            End If
            Dim TransaxnDate As Date = DateAndTime.Now
            Dim amount As Double
            Double.TryParse(Me.InputAmount.Text, amount)
            _balance = ReadBalance()
            'new transaction values
            Dim transaction As New Transaction(_username, _accountId, DbHandler.GenerateRandomId(),
                                               amount, type,
                                               Me.TransxnDescBox.Text, TransaxnDate)
            Dim isSuccess = dbHandlerObj.Create_Transaxn(transaction, _balance)
            'setting message
            dvMessage.Visible = True
            lblMessage.Text = DbHandler.MessageHandler

            If isSuccess Then
                'setting 
                Cache("CacheAccntKey") = _accountId
                Cache("CacheTransactionKey") = transaction.TransactionId
                Me.details.Visible = True
            End If
        End If
    End Sub

    ''' <summary>
    ''' Current balance is fetched from db
    ''' </summary>
    ''' <returns></returns>
    Private Function ReadBalance() As Double
        Dim dbHanlderObj As New DbHandler()
        Dim dataset As New DataSet()
        _balance = dbHanlderObj.ReadAccountBalance(_username)
        Return _balance
    End Function
End Class