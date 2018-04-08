
Imports OnlineBankApp_Mitra.DataAccess
Imports OnlineBankApp_Mitra.Model

Public Class AccountSummary
    Inherits System.Web.UI.Page
    Property _username As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim login = DirectCast(Session("login"), Model.Login)
        If login IsNot Nothing Then
            _username = login.Username
            Debug.WriteLine("username" & _username)
        Else
            Debug.WriteLine("username is null")
            Response.Redirect("Default.aspx")
        End If

        loadData()
    End Sub

    ''' <summary>
    ''' Loading the account details based on username
    ''' </summary>
    Private Sub loadData()
        Dim dbHanlderObj As New DbHandler()
        Dim dataset As New DataSet()
        AccountGridView.DataSource = dbHanlderObj.ReadAccountDetails(_username)
        AccountGridView.DataBind()
    End Sub

    Private Sub AccountGridView_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles AccountGridView.RowEditing
        'If AccountGridView.SelectedRow IsNot Nothing Then
        Dim selectedRow As GridViewRow = AccountGridView.Rows(e.NewEditIndex)
        Session("SelectedRow") = selectedRow
        Response.Redirect("TransactionWindow.aspx")
        'Else
        'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select a row.')", True)
        'End If
    End Sub
End Class