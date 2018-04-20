Namespace Model
    Public Class Login
        Property Username As String
        Property Password As String

        Public Sub New()

        End Sub
        Public Sub New(username As String, password As String)
            Me.Username = username
            Me.Password = password
        End Sub
    End Class
End Namespace