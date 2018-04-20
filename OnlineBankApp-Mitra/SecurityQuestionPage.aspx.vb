Imports OnlineBankApp_Mitra.DataAccess

Public Class SecurityQuestionPage
    Inherits System.Web.UI.Page
    Dim _username As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim login = DirectCast(Session("login"), Model.Login)
        If login IsNot Nothing Then
            _username = login.Username
        Else
            Response.Redirect("Default.aspx")
        End If
    End Sub

    ''' <summary>
    ''' When Continue button is clicked security questions are validated and procced to account summary 
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ContinueButton_Click(sender As Object, e As EventArgs) Handles ContinueButton.Click
        'calling db handler object
        Dim dbObj As New DbHandler()

        'checking if the credentials are valid 
        Dim isCustomerValid = dbObj.Validate_SecurityQuestion(_username, InputQuestion.Text, InputAnswer.Text)
        'message handling 
        dvMessage.Visible = True
        lblMessage.Text = DbHandler.MessageHandler

        If isCustomerValid Then
            Response.Redirect("AccountSummary.aspx")
        End If
    End Sub
End Class