Namespace Model
    Public Class AccountList
        Public Shared AccountListObj As New List(Of Account)
        Dim account As Account

        Public Property AccountListObj1 As List(Of Account)
            Get
                If AccountListObj Is Nothing Then
                    AccountListObj = New List(Of Account)

                End If
                Return AccountListObj
            End Get
            Set(value As List(Of Account))
                AccountListObj = value
            End Set
        End Property

        Public Function Add(account As Account) As List(Of Account)
            Me.AccountListObj1.Add(account)
            Return Me.AccountListObj1
        End Function
    End Class
End Namespace