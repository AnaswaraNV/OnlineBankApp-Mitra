Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class Registration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        args.IsValid = True ' set default

        'make sure that check box is checked
        If Not chkBox.Checked Then
            args.IsValid = False
        End If
    End Sub

    ''' <summary>
    ''' user registration
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click
        If chkBox.Checked Then
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
            'getting the message
            dvMessage.Visible = True
            lblMessage.Text = DbHandler.MessageHandler

        Else
            dvMessage.Visible = True
            lblMessage.Text = "Please select all fields"
        End If


    End Sub

End Class