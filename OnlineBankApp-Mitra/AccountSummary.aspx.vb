
Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class AccountSummary
    Inherits System.Web.UI.Page
    Property _username As String

    ''' <summary>
    ''' Getting the login username session
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim login = DirectCast(Session("login"), Model.Login)
        If login IsNot Nothing Then
            _username = login.Username
        Else
            Response.Redirect("Default.aspx")
        End If

        LoadData()
    End Sub

    ''' <summary>
    ''' Loading the account details based on username
    ''' </summary>
    Private Sub LoadData()
        Dim dbHanlderObj As New DbHandler()
        Dim dataset As New DataSet()
        AccountGridView.DataSource = dbHanlderObj.ReadAccountDetails(_username)
        AccountGridView.DataBind()
    End Sub

    ''' <summary>
    ''' Grid view row edit - user selects the account to update
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub AccountGridView_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles AccountGridView.RowEditing
        Dim selectedRow As GridViewRow = AccountGridView.Rows(e.NewEditIndex)
        Session("SelectedRow") = selectedRow
        Response.Redirect("TransactionWindow.aspx")
    End Sub
End Class