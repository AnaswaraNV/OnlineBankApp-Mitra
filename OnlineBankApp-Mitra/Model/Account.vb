
Namespace Model
    Public Class Account
        Property AccountId As String
        Property Username As String
        Property AccountDesc As String
        Property Balance As Double
        Property AccountStatus As Boolean

        Public Sub New()

        End Sub
        Public Sub New(username As String, accountId As String, accountDesc As String, balance As Double, accountStatus As Boolean)
            Me.Username = username
            Me.AccountDesc = accountDesc
            Me.AccountId = accountId
            Me.Balance = balance
            Me.AccountStatus = accountStatus
        End Sub
    End Class
End Namespace