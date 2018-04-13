Public Class testgrid
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Dim ran As New Random()
        Dim i = ran.Next(1, 5)
        Image1.ImageUrl = "~/Resources/" & i.ToString & ".jpg"
    End Sub
End Class