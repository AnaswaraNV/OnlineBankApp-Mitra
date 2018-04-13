Imports System.Web.Optimization
Imports OnlineBankApp_Mitra.DataAccess

Public Class Global_asax
    Inherits HttpApplication


    Sub Application_Start(sender As Object, e As EventArgs)
        ' Fires when the application is started
        RouteConfig.RegisterRoutes(RouteTable.Routes)
        BundleConfig.RegisterBundles(BundleTable.Bundles)

        'Setting an application variable
        Application("SqlConnection") = SqlConnectionClass.SqlConnectionInit()

    End Sub

    Sub Application_End(sender As Object, e As EventArgs)
        'closing sql connection
        SqlConnectionClass.CloseSqlConnection()
    End Sub

    Sub Application_Error()
        Response.Redirect("ErrorPage.aspx")
    End Sub

End Class