Attribute VB_Name = "AccountRepository"
Dim privileges As New Collection
Dim AccountTypes As New Collection
Public Function GetAccountDetails(ByRef NewCustomer As CustomerDetails) As Boolean
    Dim IsSaved As Boolean
    IsSaved = True
    AddAccount NewCustomer
    IsSaved = True
    GetAccountDetails = IsSaved
End Function
Private Sub AddAccount(ByRef NewCustomer As CustomerDetails)
     On Error GoTo errHand
    Dim con As New ADODB.Connection
    Dim cmd As New ADODB.Command
    
    Dim sqlst As String
    Dim ConString As String
    
    ConString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=db_bankapp;Data Source=."
         
    con.Open ConString
    
    Set cmd.ActiveConnection = con
         
        cmd.Parameters.Append cmd.CreateParameter("@custname", adVarChar, adParamInput, 30, NewCustomer.CustomerName)
         cmd.Parameters.Append cmd.CreateParameter("@mobile ", adVarChar, adParamInput, 10, NewCustomer.Mobile)
         cmd.Parameters.Append cmd.CreateParameter("@Emailid", adVarChar, adParamInput, 30, NewCustomer.EmailId)
         cmd.Parameters.Append cmd.CreateParameter("@Pin", adInteger, adParamInput, , NewCustomer.Pin)
         cmd.Parameters.Append cmd.CreateParameter("@accounttype", adVarChar, adParamInput, 15, NewCustomer.AccountType)
         cmd.Parameters.Append cmd.CreateParameter("@privilege", adVarChar, adParamInput, 10, NewCustomer.PrivilegeType)
        cmd.Parameters.Append cmd.CreateParameter("@doorno", adVarChar, adParamInput, 10, NewCustomer.DoorNo)
        cmd.Parameters.Append cmd.CreateParameter("@street", adVarChar, adParamInput, 25, NewCustomer.Street)
        cmd.Parameters.Append cmd.CreateParameter("@city", adVarChar, adParamInput, 25, NewCustomer.City)
        cmd.Parameters.Append cmd.CreateParameter("@state", adVarChar, adParamInput, 25, NewCustomer.State)
         cmd.Parameters.Append cmd.CreateParameter("@custnum", adInteger, adParamOutput)
        cmd.Parameters.Append cmd.CreateParameter("@CustomerId", adInteger, adParamOutput)
        cmd.Parameters.Append cmd.CreateParameter("@addressId", adInteger, adParamOutput)
        sqlst = "sp_CreateAccount"
        cmd.CommandText = sqlst
        cmd.CommandType = adCmdStoredProc
        cmd.Execute
        NewCustomer.CustomerNumber = cmd("@custnum")
        NewCustomer.AccountId = Val(cmd("@CustomerId"))
        NewCustomer.AddressId = Val(cmd("@addressId"))
    con.Close
    Exit Sub
errHand:
    WriteLogFile Err.Description
    Err.Raise 1001, , "Error in Database,Check Log File For More Details"
End Sub

Public Function GetPrivileges() As Collection
    privilegesFromDB
    Set GetPrivileges = privileges
End Function
Private Sub privilegesFromDB()
     On Error GoTo errHand
    Dim con As New ADODB.Connection
    Dim rs As New ADODB.Recordset
    Dim sqlst As String
    Dim ConString As String
    
    ConString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=db_bankapp;Data Source=."
    con.Open ConString
    sqlst = "Select Privilegename from privilege"
    rs.Open sqlst, con, adOpenKeyset, adLockOptimistic
    Set privileges = New Collection
    While Not rs.EOF
        privileges.Add CStr(rs(0))
       rs.MoveNext
    Wend
    rs.Close
    con.Close
    Exit Sub
errHand:
    WriteLogFile Err.Description
    Err.Raise 1001, , "Error in Database,Check Log File For More Details"
End Sub
Public Function GetAccountTypes() As Collection
    AccountTypesFromDB
    Set GetAccountTypes = AccountTypes
End Function
Private Sub AccountTypesFromDB()
     On Error GoTo errHand
    Dim con As New ADODB.Connection
    Dim rs As New ADODB.Recordset
    Dim sqlst As String
    Dim ConString As String
    
    ConString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=db_bankapp;Data Source=."
    con.Open ConString
    sqlst = "Select AccountTypeName from AccountType"
    rs.Open sqlst, con, adOpenKeyset, adLockOptimistic
    Set AccountTypes = New Collection
    While Not rs.EOF
        AccountTypes.Add CStr(rs(0))
       rs.MoveNext
    Wend
    rs.Close
    con.Close
    Exit Sub
errHand:
    WriteLogFile Err.Description
    Err.Raise 1001, , "Error in Database,Check Log File For More Details"
End Sub
Private Sub WriteLogFile(ByVal ErrDescription As String)
   Dim FilePath As String
   Dim Intfile As Integer
   FilePath = App.Path + "\ErrorLogFile_Account.txt"
   Intfile = FreeFile
   Open FilePath For Append As #Intfile
    Print #Intfile, ErrDescription & "   " & Format(Now, "hh : mm ") & "  " & Format(Now, "dd/mm/yyyy")
  Close #Intfile
End Sub

