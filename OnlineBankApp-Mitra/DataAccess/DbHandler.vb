
'This class defines all the db related calls related to user registration, login, 
'and also transaction updation
Imports System.Data.SqlClient
Imports OnlineBankApp_Mitra.Model

Namespace DataAccess
    Public Class DbHandler

        'Dim sqlConnection As SqlConnection = DirectCast(Application("SqlConnection"), SqlConnection)
        Property SqlConnection As SqlConnection = SqlConnectionClass.SqlConnectionInit()
        'a variable to pass message between pages 
        Public Shared MessageHandler As String
        Private pMaxInvalidPasswordAttempts As Integer = "2"
        Private pPasswordAttemptWindow As Integer = "10"
        Dim sqlDataAdapter As SqlDataAdapter
        Dim dataSet As DataSet

        Public Function ReadAccountDetails(ByVal username As String) As DataSet
            Dim SqlCommand = New SqlCommand("SELECT AccountId,
                                                    AccountDesc,
                                                    Balance 
                                                    From AccountDetails
                                                    Where username = @Username", SqlConnection)
            SqlCommand.Parameters.AddWithValue("@Username", username)
            sqlDataAdapter = New SqlDataAdapter(SqlCommand)
            dataSet = New DataSet()
            sqlDataAdapter.Fill(dataSet)
            Return dataSet
        End Function

        ''' <summary>
        ''' Validating if the user entered correct security answer
        ''' </summary>
        ''' <param name="question"></param>
        ''' <param name="answer"></param>
        ''' <returns></returns>
        Friend Function Validate_SecurityQuestion(ByVal username As String, ByVal question As String, ByVal answer As String) As Boolean
            Dim isCustomerValid As Boolean = False
            'Try

            Dim reader As SqlDataReader = Nothing

            'calling login stored procedure 
            Dim cmd As New SqlCommand("spSecurity", SqlConnection) With {
                .CommandType = CommandType.StoredProcedure
            }

            cmd.Parameters.AddWithValue("@SecurityQuestion", question)
            cmd.Parameters.AddWithValue("@SecurityAnswer", answer)
            cmd.Parameters.AddWithValue("@Username", username)

            cmd.Parameters.Add("@Message", SqlDbType.VarChar, 100)
            cmd.Parameters("@Message").Direction = ParameterDirection.Output

            cmd.Parameters.Add("@RowCount", SqlDbType.Int, 5)
            cmd.Parameters("@RowCount").Direction = ParameterDirection.Output

            reader = cmd.ExecuteReader
            Dim rowCount = CInt(cmd.Parameters("@RowCount").Value)
            'Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
            If rowCount > 0 Then
                isCustomerValid = True
            Else
                isCustomerValid = False
                If reader.IsClosed <> True Then
                    reader.Close()
                End If
                'increments updateCount
                UpdateFailureCount(username, "passwordAnswer")
            End If

            MessageHandler = CStr(cmd.Parameters("@Message").Value)
            If reader.IsClosed <> True Then
                reader.Close()
            End If

            'Catch ex As Exception
            'Server.Transfer("~/ErrorPages/ErrorPage.aspx")
            'MessageHandler = "Oops an error occured!!"
            'Debug.WriteLine(ex.StackTrace)
            'End Try
            Return isCustomerValid
        End Function

        Friend Function Create_Transaxn(transaction As Transaction, balance As Double) As Boolean

            Dim isSuccess As Boolean = False
            'Try
            'current time
            Dim createDate As DateTime = DateTime.Now
            Dim cmd As New SqlCommand("uspAccountTransaction", SqlConnection) With {
                .CommandType = CommandType.StoredProcedure
            }
            cmd.Parameters.AddWithValue("@Username", transaction.Username)
            cmd.Parameters.AddWithValue("@AccountId", transaction.AccountId)
            cmd.Parameters.AddWithValue("@TransactionId", transaction.TransactionId)
            cmd.Parameters.AddWithValue("@Amount", transaction.Amount)
            cmd.Parameters.AddWithValue("@TransactionType", transaction.TransactionType)
            cmd.Parameters.AddWithValue("@TransactionDate", createDate)
            cmd.Parameters.AddWithValue("@Balance", balance)
            'cmd.Parameters.Add("@Message", SqlDbType.VarChar, 100)
            'cmd.Parameters("@Message").Direction = ParameterDirection.Output
            Dim returnValue As Integer = cmd.ExecuteNonQuery()

            'If returnValue > 0 Then
            'isSuccess = True
            'setting the account list value
            'Session("AccountList") = accountListObj
            'End If
            'closing connection
            'SqlConnectionClass.CloseSqlConnection()
            'MessageHandler = CStr(cmd.Parameters("@Message").Value)
            'Catch e As Exception
            'Debug.WriteLine(e.StackTrace)
            'Throw New Exception("error occured")
            'have to call error page here
            'MessageHandler = "Oops an error occured!!"
            'End Try
            'Return isSuccess
        End Function

        Friend Sub ReadTransactionDetails(username As String)
            Throw New NotImplementedException()
        End Sub

        ''' <summary>
        ''' 'Creating account 
        ''' </summary>
        ''' <param name="accountObj"></param>
        Friend Function Create_Account(accountObj As Account) As Boolean

            Dim isSuccess As Boolean = False
            'Try
            'current time
            Dim createDate As DateTime = DateTime.Now
            Dim cmd As New SqlCommand("uspAccountDetail", SqlConnection) With {
                .CommandType = CommandType.StoredProcedure
            }
            cmd.Parameters.AddWithValue("@Username", accountObj.Username)
            cmd.Parameters.AddWithValue("@AccountId", accountObj.AccountId)
            cmd.Parameters.AddWithValue("@AccountDesc", accountObj.AccountDesc)
            cmd.Parameters.AddWithValue("@Balance", accountObj.Balance)
            cmd.Parameters.AddWithValue("@AccountStatus", 1) 'account is active
            cmd.Parameters.AddWithValue("@CreateDate", createDate)
            cmd.Parameters.Add("@Message", SqlDbType.VarChar, 100)
            cmd.Parameters("@Message").Direction = ParameterDirection.Output
            Dim recAdded As Integer = cmd.ExecuteNonQuery()

            If recAdded > 0 Then
                isSuccess = True
                'setting the account list value
                'Session("AccountList") = accountListObj
            End If
            'closing connection
            'SqlConnectionClass.CloseSqlConnection()
            MessageHandler = CStr(cmd.Parameters("@Message").Value)
            'Catch e As Exception
            'Debug.WriteLine(e.StackTrace)
            'Throw New Exception("error occured")
            'have to call error page here
            'MessageHandler = "Oops an error occured!!"
            'End Try
            Return isSuccess
        End Function

        ''' <summary>
        ''' Function to create user
        ''' </summary>
        ''' <param name="customer"></param>
        Public Sub Create_User(customer As Customer)
            'Try
            'current time
            Dim createDate As DateTime = DateTime.Now
                Dim cmd As New SqlCommand("spcustomerdetail", SqlConnection) With {
                .CommandType = CommandType.StoredProcedure
            }
                cmd.Parameters.AddWithValue("@Username", customer.Username)
                cmd.Parameters.AddWithValue("@Firstname", customer.Firstname)
                cmd.Parameters.AddWithValue("@Lastname", customer.Lastname)
                cmd.Parameters.AddWithValue("@Password", customer.Password)
                'cmd.Parameters.AddWithValue("@Phone", customer.Phone)
                cmd.Parameters.AddWithValue("@isLockedOut", 0)
                cmd.Parameters.AddWithValue("@SecurityQuestion", customer.SecurityQuestion)
                cmd.Parameters.AddWithValue("@SecurityAnswer", customer.SecurityAnswer)
                cmd.Parameters.AddWithValue("@FailedPasswordAttemptCount", 0)
                cmd.Parameters.AddWithValue("@FailedPasswordAttemptWindowStart", createDate)
                cmd.Parameters.AddWithValue("@FailedPasswordAnswerAttemptCount", 0)
                cmd.Parameters.AddWithValue("@FailedPasswordAnswerAttemptWindowStart", createDate)
                cmd.Parameters.Add("@ERROR", SqlDbType.VarChar, 100)
                cmd.Parameters("@ERROR").Direction = ParameterDirection.Output
                cmd.ExecuteNonQuery()

                'closing connection
                'SqlConnectionClass.CloseSqlConnection()
                MessageHandler = CStr(cmd.Parameters("@ERROR").Value)
                'Catch e As Exception
            ' Debug.WriteLine(e.StackTrace)
            'Throw New Exception("error occured")
            'have to call error page here
            ' MessageHandler = "Oops an error occured!!"
            'End Try

        End Sub

        Friend Function Validate_Credentials(username As String, password As String) As Object
            Dim isCustomerValid As Boolean = False
            'Try

            Dim reader As SqlDataReader = Nothing

                'calling login stored procedure 
                Dim cmd As New SqlCommand("spLogin", SqlConnection) With {
                .CommandType = CommandType.StoredProcedure
            }

                cmd.Parameters.AddWithValue("@Username", username)
                cmd.Parameters.AddWithValue("@Password", password)

                cmd.Parameters.Add("@ERROR", SqlDbType.VarChar, 100)
                cmd.Parameters("@ERROR").Direction = ParameterDirection.Output

                cmd.Parameters.Add("@ROWCOUNT", SqlDbType.Int, 5)
                cmd.Parameters("@ROWCOUNT").Direction = ParameterDirection.Output
                'Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
                'If rowsAffected > 0 Then
                'isCustomerValid = True
                'Else
                'Calculates failure count
                'UpdateFailureCount(username, "password")
                'End If
                reader = cmd.ExecuteReader
                Dim rowCount = CInt(cmd.Parameters("@ROWCOUNT").Value)
                'Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
                If rowCount > 0 Then
                    isCustomerValid = True
                Else
                isCustomerValid = False
                If reader.IsClosed <> True Then
                    reader.Close()
                End If
                'increments updateCount
                UpdateFailureCount(username, "password")
                End If

            MessageHandler = CStr(cmd.Parameters("@ERROR").Value)
            If reader.IsClosed <> True Then
                reader.Close()
            End If

            'Catch ex As Exception
            'Server.Transfer("~/ErrorPages/ErrorPage.aspx")
            'MessageHandler = "Oops an error occured!!"
            'Debug.WriteLine(ex.StackTrace)
            'End Try
            Return isCustomerValid
        End Function

        Public Sub UpdateFailureCount(username As String, failureType As String)
            Dim readerNew As SqlDataReader = Nothing


            Dim sqlQuery = "SELECT FailedPasswordAttemptCount,
                                   FailedPasswordAttemptWindowStart,
                                   FailedPasswordAnswerAttemptCount,
                                   FailedPasswordAnswerAttemptWindowStart 
                                   FROM CustomerDetails
                                   WHERE Username = @Username"

            Dim windowStart As DateTime = New DateTime()
            Dim failureCount As Integer = 0

            'cmd.ExecuteNonQuery()
            Dim cmd As New SqlCommand(sqlQuery, SqlConnection) With {
                .CommandType = CommandType.Text
            }
            cmd.Parameters.AddWithValue("@Username", username)
            readerNew = cmd.ExecuteReader
            While readerNew.Read()
                If failureType = "password" Then
                    'failureCount = reader.GetInt32("FailedPasswordAttemptCount")
                    failureCount = CInt(readerNew("FailedPasswordAttemptCount"))
                    windowStart = CDate(readerNew("FailedPasswordAttemptWindowStart"))
                    'failureCount = failPwdCount
                    ' windowStart = CDate(cmd.Parameters("FailedPasswordAttemptWindowStart").Value)
                End If

                If failureType = "passwordAnswer" Then
                    failureCount = CInt(readerNew("FailedPasswordAnswerAttemptCount"))
                    windowStart = CDate(readerNew("FailedPasswordAnswerAttemptWindowStart"))
                End If
            End While

            readerNew.Close()

            Dim windowEnd As DateTime = windowStart.AddMinutes(pPasswordAttemptWindow)

            If failureCount = 0 OrElse DateTime.Now > windowEnd Then
                ' First password failure or outside of PasswordAttemptWindow.  
                ' Start a New password failure count from 1 and a New window starting now. 

                If failureType = "password" Then _
                          cmd.CommandText = "UPDATE CustomerDetails  " &
                                            "  Set FailedPasswordAttemptCount = @Count, " &
                                             "   FailedPasswordAttemptWindowStart = @WindowStart " &
                                            "  WHERE Username = @Username"

                If failureType = "passwordAnswer" Then _
                          cmd.CommandText = "UPDATE CustomerDetails  " &
                                            "  Set FailedPasswordAnswerAttemptCount = @Count, " &
                                            "      FailedPasswordAnswerAttemptWindowStart = @WindowStart " &
                                            "  WHERE Username = @Username"

                cmd.Parameters.Clear()
                MessageHandler = "Attempts Left!" & failureCount
                cmd.Parameters.AddWithValue("@Count", 1)
                cmd.Parameters.AddWithValue("@WindowStart", DateTime.Now)
                cmd.Parameters.AddWithValue("@Username", username)


                If cmd.ExecuteNonQuery() < 0 Then
                    Throw New Exception("Unable to update failure count and window start.")
                End If
            Else
                failureCount += 1

                If failureCount >= pMaxInvalidPasswordAttempts Then
                    ' Password attempts have exceeded the failure threshold. Lock out 
                    ' the user.

                    cmd.CommandText = "UPDATE CustomerDetails " &
                                              "  Set IsLockedOut = @IsLockedOut" &
                                              "  WHERE Username = @Username"

                    cmd.Parameters.Clear()

                    '0 for true
                    cmd.Parameters.AddWithValue("@IsLockedOut", 1)
                    cmd.Parameters.AddWithValue("@Username", username)


                    If cmd.ExecuteNonQuery() < 0 Then _
                              Throw New Exception("Unable to lock out user.")
                Else
                    ' Password attempts have not exceeded the failure threshold. Update 
                    ' the failure counts. Leave the window the same. 
                    MessageHandler = failureCount & " Attempts Left! "
                    If failureType = "password" Then _
                              cmd.CommandText = "UPDATE CustomerDetails  " &
                                                "  SET FailedPasswordAttemptCount = @Count" &
                                                "  WHERE Username = @Username"

                    If failureType = "passwordAnswer" Then _
                              cmd.CommandText = "UPDATE CustomerDetails  " &
                                                "  SET FailedPasswordAnswerAttemptCount = @Count" &
                                                "  WHERE Username = @Username"

                    cmd.Parameters.Clear()

                    cmd.Parameters.AddWithValue("@Count", failureCount)
                    cmd.Parameters.AddWithValue("@Username", username)

                    If cmd.ExecuteNonQuery() < 0 Then _
                              Throw New Exception("Unable to update failure count.")
                End If
            End If

            If Not readerNew Is Nothing Then readerNew.Close()

        End Sub

        ''' <summary>
        ''' Generate a 9 digit account id 
        ''' </summary>
        ''' <returns></returns>
        Public Shared Function GenerateRandomId() As String
            Dim SB As New System.Text.StringBuilder
            Try
                Dim Numbers As New List(Of Integer)
                'add ASCII codes for numbers
                For i As Integer = 48 To 57
                    Numbers.Add(i)
                Next
                'select 9 random integers from number of items in Letters
                'then convert those random integers 
                Dim Rnd As New Random
                Dim Id As Integer

                For count As Integer = 1 To 9
                    Id = Rnd.Next(0, Numbers.Count)
                    SB.Append(Chr(Numbers(Id)))
                Next

            Catch e As Exception
            End Try
            Return SB.ToString
        End Function
    End Class
End Namespace
