VERSION 5.00
Begin VB.Form frmLogin 
   BackColor       =   &H00FFFFC0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Login Bank Of Success"
   ClientHeight    =   2565
   ClientLeft      =   8595
   ClientTop       =   3915
   ClientWidth     =   4110
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2565
   ScaleWidth      =   4110
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2820
      TabIndex        =   6
      Top             =   1920
      Width           =   975
   End
   Begin VB.CommandButton cmdLogin 
      Caption         =   "Login"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1680
      TabIndex        =   5
      Top             =   1920
      Width           =   975
   End
   Begin VB.CommandButton cmdSignUp 
      Caption         =   "Sign up"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   540
      TabIndex        =   4
      Top             =   1920
      Width           =   975
   End
   Begin VB.TextBox txtPassword 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1680
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   1320
      Width           =   2235
   End
   Begin VB.TextBox txtUserId 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1680
      TabIndex        =   2
      Top             =   840
      Width           =   2235
   End
   Begin VB.Label lblLogin 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Login"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   1440
      TabIndex        =   7
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblPassword 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Password"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   300
      TabIndex        =   1
      Top             =   1260
      Width           =   1170
   End
   Begin VB.Label lblUserId 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "User ID"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   300
      TabIndex        =   0
      Top             =   840
      Width           =   1185
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Function GeneratePassword(ByVal PassWord) As String
    Dim Generator As String
    Generator = ""
    For Index = 1 To Len(PassWord)
        Generator = Generator & Chr(Asc(Mid(PassWord, Index, 1)) + 3)
    Next
    GeneratePassword = Generator
End Function

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdLogin_Click()
    On Error GoTo errHand
    Dim Role As Integer
    Dim NewUser As Login
    Set NewUser = New Login
    Dim EncryptedPassWord As String
    NewUser.Username = CStr(txtUserId.Text)
    NewUser.PassWord = CStr(txtPassword.Text)
    NewUser.EncryptedPassWord = GeneratePassword(NewUser.PassWord)
    Role = LoginRepository.CheckCredentials(NewUser)
    If NewUser.Role = 1 Then
        MsgBox "Logging As Manager", vbOKOnly, "Login"
    ElseIf NewUser.Role = 2 Then
        MsgBox "Logging As User", vbOKOnly, "Login"
    Else
        MsgBox "Invalid Credentials", vbOKOnly, "Login"
        Exit Sub
    End If
    txtUserId.Text = Empty
    txtPassword.Text = Empty
    Unload Me
    MDIMain.Show
    Exit Sub
errHand:
    If Err.Number = 1001 Then
        MsgBox "Cannot Login Now", vbOKOnly, "Login"
    Else
        MsgBox "Error While Login", vbOKOnly, "Login"
    End If
    txtUserId.Text = Empty
    txtPassword.Text = Empty
End Sub

Private Sub cmdSignUp_Click()
    On Error GoTo errHand
    Dim UserId As String
    Dim PassWord As String
    Dim EncryptedPassWord As String
    UserId = CStr(txtUserId.Text)
    PassWord = CStr(txtPassword.Text)
    EncryptedPassWord = GeneratePassword(PassWord)
    IsInserted = LoginRepository.InsertCredentials(UserId, EncryptedPassWord)
    If IsInserted Then
        MsgBox "User Account Created", vbOKOnly, "Login"
    Else
        MsgBox "User Account Not Created", vbOKOnly, "Login"
    End If
     txtUserId.Text = Empty
    txtPassword.Text = Empty
    Exit Sub
errHand:
    If Err.Number = 1001 Then
        MsgBox "Cannot Create User Account Now & vbnewline & Try After Sometime", vbOKOnly, "Create User Account"
    Else
        MsgBox "Error While Creating Account", vbOKOnly, "Create User Account"
    End If
     txtUserId.Text = Empty
    txtPassword.Text = Empty
End Sub

Public Sub LogOut()
    Unload Me
End Sub

