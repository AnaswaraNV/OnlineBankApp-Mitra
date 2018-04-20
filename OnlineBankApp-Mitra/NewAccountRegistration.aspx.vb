Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class NewAccountRegistration
    Inherits System.Web.UI.Page

    Property Username As String
    Property AccountObj As New Account()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim login = DirectCast(Session("login"), Model.Login)
        If login IsNot Nothing Then
            Username = login.Username
            Debug.WriteLine("username" & Username)
        Else
            Response.Redirect("Default.aspx")
        End If
        InitialSetup()
    End Sub

    ''' <summary>
    ''' Function to set up account type, account id as username
    ''' </summary>
    Private Sub InitialSetup()
        'load username field with current username
        Me.InputUsername.Text = Username
    End Sub

    ''' <summary>
    ''' Register button click - a new user is registered 
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click
        'create dataaccess obj
        Dim dbHandlerObj As New DbHandler()
        Dim index = AccountTypeSelection.SelectedIndex

        'if the account type is not selected, throw error message
        If Not (index = 0 OrElse index = 1) Then
            dvMessage.Visible = True
            lblMessage.Text = "Please enter all fields"
        Else
            Dim desc = AccountTypeSelection.Items(index).Value
            'new account values
            Dim AccountObj As New Account(Username, DbHandler.GenerateRandomId(), desc, InputBalance.Text, True)

            'calling db handler class passing account object
            Dim isSuccess = dbHandlerObj.Create_Account(AccountObj)
            'setting message
            dvMessage.Visible = True
            lblMessage.Text = DbHandler.MessageHandler

            'if account is registered goes to account summary page
            If isSuccess Then
                'AccountList.AccountListObj.Add(AccountObj)
                Response.Redirect("AccountSummary.aspx")
            End If

        End If

    End Sub
End Class