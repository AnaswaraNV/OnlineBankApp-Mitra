Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class Registration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click
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
    End Sub
End Class