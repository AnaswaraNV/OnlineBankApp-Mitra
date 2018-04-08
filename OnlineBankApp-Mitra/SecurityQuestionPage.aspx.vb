Imports OnlineBankApp_Mitra.DataAccess

Public Class SecurityQuestionPage
    Inherits System.Web.UI.Page
    Property username
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not IsPostBack Then
        Dim loginCheck As Boolean = (System.Web.HttpContext.Current.User IsNot Nothing AndAlso
                                     System.Web.HttpContext.Current.User.Identity.IsAuthenticated)

            Debug.WriteLine("Yes , user authenticated")

            Dim login = DirectCast(Session("login"), Model.Login)
            If login IsNot Nothing Then
                username = login.Username
            End If
        'End If

    End Sub

    Protected Sub ContinueButton_Click(sender As Object, e As EventArgs) Handles ContinueButton.Click
        'calling db handler object
        Dim dbObj As New DbHandler()

        'checking if the credentials are valid 
        Dim isCustomerValid = dbObj.Validate_SecurityQuestion(username, InputQuestion.Text, InputAnswer.Text)
        'message handling 
        dvMessage.Visible = True
        lblMessage.Text = DbHandler.MessageHandler

        If isCustomerValid Then
            'Dim login = New Login(InputUsername.Text, InputPassword.Text)
            'Session("login") = login
            Response.Redirect("AccountSummary.aspx")
        End If
    End Sub
End Class