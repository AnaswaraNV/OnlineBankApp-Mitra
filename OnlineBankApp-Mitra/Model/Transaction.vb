Namespace Model
    Public Class Transaction
        Property Username As String
        Property AccountId As String
        Property TransactionId As String
        Property Amount As Double
        Property TransactionType As Char
        Property TransactionDesc As String
        Property TransactionDate As Date

        Public Sub New()

        End Sub
        Public Sub New(username As String, accountId As String,
                       transactionId As String, amount As Double, transactionType As Char,
                       transactionDesc As String, transactionDate As Date)
            Me.Username = username
            Me.AccountId = accountId
            Me.TransactionId = transactionId
            Me.Amount = amount
            Me.TransactionType = transactionType
            Me.TransactionDesc = transactionDesc
            Me.TransactionDate = transactionDate
        End Sub


    End Class
End Namespace
