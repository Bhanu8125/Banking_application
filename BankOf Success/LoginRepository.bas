Attribute VB_Name = "LoginRepository"

Public Function CheckCredentials(ByRef NewUser As Login) As Integer
    GotoDatabase NewUser
    CheckCredentials = GetRole
End Function
Private Sub GotoDatabase(ByRef NewUser As Login)
    On Error GoTo errHand
    Dim con As New ADODB.Connection
    Dim cmd As New ADODB.Command
    Dim rs As New ADODB.Recordset
    
    'Helper
    Dim sqlst As String
    Dim ConString As String
    
    ConString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=db_bankapp;Data Source=."
    'to open connection
    con.Open ConString
    cmd.ActiveConnection = con
        sqlst = "select LoginRole  from Login where LoginId = '" & NewUser.Username & "' and LoginPassword = '" & NewUser.EncryptedPassWord & "';"
        cmd.CommandText = sqlst
        cmd.CommandType = adCmdText
        'execute command
        Set rs = cmd.Execute
  If rs.EOF Then
        rs.Close
        con.Close
        Exit Sub
  End If
        NewUser.Role = Val(rs("LoginRole").Value)
        rs.Close
        con.Close
    Exit Sub
errHand:
    Err.Raise 1001, , "Error While Logging,please check logfile for more details"
End Sub
Public Function InsertCredentials(ByVal UserId As String, ByVal PassWord As String) As Boolean
    Dim IsInserted As Boolean
    IsInserted = False
    CreateUserAccount UserId, PassWord
    IsInserted = True
    InsertCredentials = IsInserted
End Function
Private Sub CreateUserAccount(ByVal UserId As String, ByVal PassWord As String)
    On Error GoTo errHand
    Dim con As New ADODB.Connection
    Dim cmd As New ADODB.Command
    Dim rs As New ADODB.Recordset
    
    'Helper
    Dim sqlst As String
    Dim ConString As String
    
    ConString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=db_Shopon;Data Source=."
    'to open connection
    con.Open ConString
    cmd.ActiveConnection = con
        sqlst = "Insert into Login values('" & UserId & "','" & PassWord & "', " & 2 & ");"
        cmd.CommandText = sqlst
        cmd.CommandType = adCmdText
        'execute command
       cmd.Execute
    con.Close
    Exit Sub
errHand:
    WriteLogFile
    Err.Raise 1001, , "Error While Logging,please check logfile for more details"
End Sub
Private Sub WriteLogFile(ByVal ErrDescription As String)
   Dim FilePath As String
   Dim Intfile As Integer
   FilePath = "E:\Eurofins\files\LogFiles_Practice\ErrorLogFile_Login.txt"
   Intfile = FreeFile
   Open FilePath For Append As #Intfile
    Print #Intfile, ErrDescription & "   " & Format(Now, "hh : mm ") & "  " & Format(Now, "dd/mm/yyyy")
  Close #Intfile
End Sub

