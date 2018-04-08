Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class Registration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Setting the first value as selected
        AccountTypeSelection.SelectedIndex = 0

    End Sub

    Private Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click
        'if page is valid - this is to make sure for the users
        ' with javascript enabled 
        If Page.IsValid Then
            'Try
            'create dataaccess obj
            Dim dbHandlerObj As New DbHandler()

                'new customer with values
                Dim customer As New Customer With
                    {
                    .Username = InputUsername.Text,
                    .Firstname = InputFirstname.Text,
                    .Lastname = InputLastname.Text,
                    .Password = InputPassword.Text,
                    .Phone = InputTel.Text,
                    .SecurityQuestion = InputQuestion.Text,
                    .SecurityAnswer = InputAnswer.Text
                    }

                dbHandlerObj.Create_User(customer)
                dvMessage.Visible = True
                lblMessage.Text = DbHandler.MessageHandler
                'Catch ex As Exception
            'If (Not Response.IsRequestBeingRedirected) Then
            'Server.Transfer("~/ErrorPages/ErrorPage.aspx")
            'End If
            'End Try
        End If

    End Sub
End Class