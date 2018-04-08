Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            loadData()
        End If
    End Sub


    Public Sub loadData()
        Dim dbObj As New DbHandler()
        'Dim source As DataSet = dbObj.ReadDatabase("SELECT * FROM CustomerDetails")
    End Sub


    Private Sub SignInButton_Click(sender As Object, e As EventArgs) Handles SignInButton.Click
        'calling db handler object
        Dim dbObj As New DbHandler()

        'checking if the credentials are valid 
        Dim isCustomerValid = dbObj.Validate_Credentials(InputUsername.Text, InputPassword.Text)
        'message handling 
        dvMessage.Visible = True
        lblMessage.Text = DbHandler.MessageHandler

        If isCustomerValid Then
            Dim login = New Login(InputUsername.Text, InputPassword.Text)
            Session("login") = login
            Response.Redirect("SecurityQuestionPage.aspx")
        End If
    End Sub
End Class