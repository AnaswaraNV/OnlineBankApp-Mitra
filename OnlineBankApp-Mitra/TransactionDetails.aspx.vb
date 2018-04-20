Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class TransactionDetails
    Inherits System.Web.UI.Page

    Dim _username As String
    Dim _accntId As String
    Dim _transxnId As String
    Dim _transaction As New Transaction

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim login = DirectCast(Session("login"), Model.Login)
        If login IsNot Nothing Then
            _username = login.Username
        Else
            Response.Redirect("Default.aspx")
        End If

        LoadAccntId()
        LoadTransactionId()
        LoadData()
    End Sub

    ''' <summary>
    ''' Get transaction id from previous page
    ''' </summary>
    Private Sub LoadTransactionId()
        Dim tempString As String
        tempString = CStr(Cache("CacheTransactionKey"))
        If tempString IsNot Nothing Then
            _transxnId = tempString
        End If
    End Sub

    ''' <summary>
    ''' Load account id from previous page
    ''' </summary>
    Private Sub LoadAccntId()
        Dim tempString As String
        tempString = CStr(Cache("CacheAccntKey"))
        If tempString IsNot Nothing Then
            _accntId = tempString
        End If
    End Sub

    ''' <summary>
    ''' Get the transaction details from the account id and transaction id 
    ''' </summary>
    Private Sub LoadData()
        Dim dbHanlderObj As New DbHandler()
        Dim dataset As New DataSet()
        Dim type As String = Nothing
        dataset = dbHanlderObj.ReadTransactionDetails(_accntId, _transxnId)
        If dataset IsNot Nothing Then
            Dim Amount = Convert.ToString(dataset.Tables(0).Rows(0)("Amount"))
            Dim TransactionType = Convert.ToString(dataset.Tables(0).Rows(0)("TransactionType"))
            Dim TransactionDesc = Convert.ToString(dataset.Tables(0).Rows(0)("TransactionDesc"))
            Dim TransactionDate = Convert.ToString(dataset.Tables(0).Rows(0)("TransactionDate"))
            If TransactionType = "W" Then
                type = "Withdrawal"
            ElseIf TransactionType = "D" Then
                type = "Deposit"
            End If
            _transaction = New Transaction With {
                .AccountId = _accntId,
                .TransactionId = _transxnId,
                .TransactionDesc = TransactionDesc,
                .TransactionType = type,
                .Amount = Amount,
                .TransactionDate = TransactionDate
            }
            'load the text boxes
            LoadInput()
        End If
    End Sub

    ''' <summary>
    ''' Loading the transaction
    ''' </summary>
    Private Sub LoadInput()
        Me.InputUsername.Text = _username
        Me.AutoAccntID.Text = _accntId
        Me.TransactionAmount.Text = _transaction.Amount
        Me.TransactionType.Text = _transaction.TransactionType
        Me.TransactionDesc.Text = _transaction.TransactionDesc
        Me.TransactionId.Text = _transaction.TransactionId
        Me.TransactionDate.Text = _transaction.TransactionDate
    End Sub
End Class