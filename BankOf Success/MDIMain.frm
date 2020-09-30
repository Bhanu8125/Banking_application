VERSION 5.00
Begin VB.MDIForm MDIMain 
   BackColor       =   &H8000000C&
   Caption         =   "Bank Of Success"
   ClientHeight    =   7485
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   5985
   LinkTopic       =   "MDIForm1"
   Picture         =   "MDIMain.frx":0000
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Menu mnuAccount 
      Caption         =   "&Account"
      Begin VB.Menu mnuCreateAccount 
         Caption         =   "Create Account"
      End
      Begin VB.Menu mnuClose 
         Caption         =   "&Close"
      End
      Begin VB.Menu mnuLogOut 
         Caption         =   "LogOut"
      End
   End
   Begin VB.Menu mnuReport 
      Caption         =   "&Report"
      Begin VB.Menu mnuGenerateReport 
         Caption         =   "Generate Report"
      End
   End
End
Attribute VB_Name = "MDIMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Sub mnuClose_Click()
    Dim frm As Form
    Set frm = Me.ActiveForm
    Unload frm
    closecheck
End Sub
Public Sub closecheck()
    If Me.ActiveForm Is Nothing Then
       mnuClose.Enabled = False
    End If
End Sub

Private Sub mnuCreateAccount_Click()
    frmCreateAccount.Show
    'mnuCreateAccount.Enabled = False
End Sub

Private Sub mnuGenerateReport_Click()
     mnuClose.Enabled = True
    frmGenerateReport.Show
End Sub

Private Sub PicBank_Click()

End Sub
Private Sub Picture1_Click()

End Sub
Private Sub mnuLogOut_Click()
    Unload Me
End Sub
'Public Sub CheckStatus()
'    mnuCreateAccount.Enabled = True
'End Sub

