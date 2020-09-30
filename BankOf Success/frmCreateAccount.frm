VERSION 5.00
Begin VB.Form frmCreateAccount 
   BackColor       =   &H00FFC0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Create Account"
   ClientHeight    =   5205
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4620
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5205
   ScaleWidth      =   4620
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2460
      MaskColor       =   &H00000000&
      TabIndex        =   20
      Top             =   4620
      Width           =   1455
   End
   Begin VB.CommandButton cmdCreateAccount 
      Caption         =   "Create Account"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   780
      MaskColor       =   &H00000000&
      TabIndex        =   19
      Top             =   4620
      Width           =   1515
   End
   Begin VB.TextBox txtState 
      Height          =   345
      Left            =   2280
      TabIndex        =   17
      Top             =   3960
      Width           =   2175
   End
   Begin VB.TextBox txtCity 
      Height          =   345
      Left            =   2280
      TabIndex        =   15
      Top             =   3540
      Width           =   2175
   End
   Begin VB.TextBox txtStreet 
      Height          =   345
      Left            =   2280
      TabIndex        =   13
      Top             =   3120
      Width           =   2175
   End
   Begin VB.TextBox txtDoor 
      Height          =   345
      Left            =   2280
      TabIndex        =   11
      Top             =   2700
      Width           =   2175
   End
   Begin VB.ComboBox cmbPrivilegeType 
      Height          =   315
      Left            =   2280
      TabIndex        =   9
      Top             =   2280
      Width           =   2175
   End
   Begin VB.ComboBox cmbAccountType 
      Height          =   315
      Left            =   2280
      TabIndex        =   7
      Top             =   1860
      Width           =   2175
   End
   Begin VB.TextBox txtEmailId 
      Height          =   345
      Left            =   2280
      TabIndex        =   6
      Top             =   1440
      Width           =   2175
   End
   Begin VB.TextBox txtMobile 
      Height          =   285
      Left            =   2280
      TabIndex        =   4
      Top             =   1020
      Width           =   2175
   End
   Begin VB.TextBox txtCustomerName 
      Height          =   345
      Left            =   2280
      TabIndex        =   1
      Top             =   600
      Width           =   2175
   End
   Begin VB.Image ImgLogo 
      Height          =   375
      Left            =   480
      Picture         =   "frmCreateAccount.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblHeader 
      Alignment       =   2  'Center
      Caption         =   "BANK OF SUCCESS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1080
      TabIndex        =   18
      Top             =   120
      Width           =   2895
   End
   Begin VB.Label lblState 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter State"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   360
      TabIndex        =   16
      Top             =   4020
      Width           =   975
   End
   Begin VB.Label lblCity 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter City"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   360
      TabIndex        =   14
      Top             =   3600
      Width           =   840
   End
   Begin VB.Label lblStreet 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter Street"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   360
      TabIndex        =   12
      Top             =   3180
      Width           =   1035
   End
   Begin VB.Label lblDoorNo 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter Door No."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   300
      TabIndex        =   10
      Top             =   2760
      Width           =   1290
   End
   Begin VB.Label lblPrivilegeType 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Select  Privilege Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   300
      TabIndex        =   8
      Top             =   2340
      Width           =   1890
   End
   Begin VB.Label lblEmail 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter Email"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   300
      TabIndex        =   5
      Top             =   1500
      Width           =   975
   End
   Begin VB.Label lblMobile 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter Mobile Num"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   300
      TabIndex        =   3
      Top             =   1080
      Width           =   1515
   End
   Begin VB.Label lblAccountType 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Select  Account Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   300
      TabIndex        =   2
      Top             =   1920
      Width           =   1860
   End
   Begin VB.Label lblName 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter Customer Name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   300
      TabIndex        =   0
      Top             =   660
      Width           =   1845
   End
End
Attribute VB_Name = "frmCreateAccount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim privileges As New Collection
Dim AccountTypes As New Collection
Private Sub cmdCancel_Click()
    ClearAll
End Sub
Private Sub ClearAll()
    txtCustomerName.Text = Empty
    txtMobile.Text = Empty
    txtEmailId.Text = Empty
    cmbAccountType.Text = Empty
    cmbPrivilegeType.Text = Empty
    txtDoor.Text = Empty
    txtStreet.Text = Empty
    txtCity.Text = Empty
    txtState.Text = Empty
End Sub
Private Sub cmdCreateAccount_Click()
    On Error GoTo errHand
    Dim NewCustomer As New CustomerDetails
    Set NewCustomer = New CustomerDetails
    NewCustomer.CustomerName = CStr(txtCustomerName.Text)
    NewCustomer.Mobile = CStr(txtMobile.Text)
    NewCustomer.EmailId = CStr(txtEmailId.Text)
    NewCustomer.AccountType = CStr(cmbAccountType.Text)
    NewCustomer.PrivilegeType = CStr(cmbPrivilegeType.Text)
    NewCustomer.DoorNo = CStr(txtDoor.Text)
    NewCustomer.Street = CStr(txtStreet.Text)
    NewCustomer.City = CStr(txtCity.Text)
    NewCustomer.State = CStr(txtState.Text)
    Dim Pin As Integer
    Pin = 10000 * Rnd
    NewCustomer.Pin = Pin
    Dim IsSaved As Boolean
    IsSaved = AccountRepository.GetAccountDetails(NewCustomer)
    If IsSaved Then
    MsgBox "Account Creation Successful", vbOKOnly, "Account Creation"
    'MsgBox NewCustomer.CustomerNumber, vbOKOnly, "Account Details"
    PrintView NewCustomer.AccountId, NewCustomer.AddressId
    End If
    ClearAll
    Exit Sub
errHand:
    If Err.Number = 1001 Then
        MsgBox "Error While Creating Account", vbOKOnly, "Account Creation"
    Else
     MsgBox "Server Busy", vbOKOnly, "Account Creation"
    End If
End Sub

Private Sub Form_Load()
    Set AccountTypes = AccountRepository.GetAccountTypes
    Set privileges = AccountRepository.GetPrivileges
    Fill_Combo_AccountTypes
    Fill_Combo_Privileges
End Sub
Private Sub Fill_Combo_AccountTypes()
    Dim Index As Integer
    For Index = 1 To AccountTypes.Count
        cmbAccountType.AddItem AccountTypes(Index)
    Next
End Sub
Private Sub Fill_Combo_Privileges()
    Dim Index As Integer
    For Index = 1 To privileges.Count
        cmbPrivilegeType.AddItem privileges(Index)
    Next
End Sub
Private Sub PrintView(AccountId, AddressId)
    Dim crApp As New CRAXDDRT.Application
    Dim crRpt As New CRAXDDRT.Report
    Dim crPara1 As CRAXDDRT.ParameterFieldDefinition
    Dim crPara2 As CRAXDDRT.ParameterFieldDefinition
    Dim Path As String
    Path = App.Path + "\ViewProfile.rpt"
    'Setting rpt to the file
    Set crRpt = crApp.OpenReport(Path)
    Set crPara1 = crRpt.ParameterFields.GetItemByName("CustomerId")
    Set crPara2 = crRpt.ParameterFields.GetItemByName("AddressId")
    crRpt.ParameterFields.GetItemByName("CustomerId").ClearCurrentValueAndRange
    crRpt.ParameterFields.GetItemByName("AddressId").ClearCurrentValueAndRange
    crPara1.AddCurrentValue AccountId
    crPara2.AddCurrentValue AddressId
     'Passing rpt as Source
     frmPrint.CRViewer.ReportSource = crRpt
     frmPrint.CRViewer.ViewReport
     frmPrint.Show
End Sub

Private Sub Form_Terminate()
     MDIMain.closecheck
End Sub

Private Sub Form_Unload(Cancel As Integer)
    MDIMain.closecheck
End Sub
