VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmGenerateReport 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Generate Report"
   ClientHeight    =   1890
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4440
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1890
   ScaleWidth      =   4440
   Begin MSComCtl2.DTPicker DTPickerFrom 
      Height          =   315
      Left            =   1800
      TabIndex        =   4
      Top             =   180
      Width           =   2235
      _ExtentX        =   3942
      _ExtentY        =   556
      _Version        =   393216
      Format          =   132448257
      CurrentDate     =   43945
   End
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
      Left            =   2280
      TabIndex        =   3
      Top             =   1260
      Width           =   1575
   End
   Begin VB.CommandButton cmdGenerateReport 
      Caption         =   "Generate Report"
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
      Left            =   300
      TabIndex        =   2
      Top             =   1260
      Width           =   1575
   End
   Begin MSComCtl2.DTPicker DTPickerTo 
      Height          =   315
      Left            =   1800
      TabIndex        =   5
      Top             =   600
      Width           =   2235
      _ExtentX        =   3942
      _ExtentY        =   556
      _Version        =   393216
      Format          =   132448257
      CurrentDate     =   43945
   End
   Begin VB.Label lblEndDate 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter To Date"
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
      TabIndex        =   1
      Top             =   660
      Width           =   1215
   End
   Begin VB.Label lblStartDate 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter From Date"
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
      Top             =   240
      Width           =   1395
   End
End
Attribute VB_Name = "frmGenerateReport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdGenerateReport_Click()
    Dim crApp As New CRAXDDRT.Application
    Dim crRpt As New CRAXDDRT.Report
    Dim crPara1 As CRAXDDRT.ParameterFieldDefinition
    Dim crPara2 As CRAXDDRT.ParameterFieldDefinition
    Dim Path As String
    Path = App.Path + "\AccountsReport.rpt"
    'Setting rpt to the file
    Set crRpt = crApp.OpenReport(Path)
    Set crPara1 = crRpt.ParameterFields.GetItemByName("FromDate")
    Set crPara2 = crRpt.ParameterFields.GetItemByName("ToDate")
    crRpt.ParameterFields.GetItemByName("FromDate").ClearCurrentValueAndRange
    crRpt.ParameterFields.GetItemByName("ToDate").ClearCurrentValueAndRange
    crPara1.AddCurrentValue DTPickerFrom.Value
    crPara2.AddCurrentValue DTPickerTo.Value
     'Passing rpt as Source
     frmPrint.CRViewer.ReportSource = crRpt
     frmPrint.CRViewer.ViewReport
     frmPrint.Show
End Sub

Private Sub Form_Unload(Cancel As Integer)
    MDIMain.closecheck
End Sub

