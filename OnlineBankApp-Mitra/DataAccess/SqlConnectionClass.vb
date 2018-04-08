Imports System.Data.SqlClient

Namespace DataAccess
    Public Class SqlConnectionClass
        Public Shared Property SqlConnection As SqlConnection

        Public Shared Function SqlConnectionInit() As SqlConnection
            'calling the connection string 
            SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("MITRADBConnectionString").ConnectionString)
            SqlConnection.Open()
            Return SqlConnection
        End Function

        Public Shared Sub CloseSqlConnection()
            SqlConnection.Close()
        End Sub
    End Class
End Namespace