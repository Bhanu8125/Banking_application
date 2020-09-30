Attribute VB_Name = "ReportRepository"
 Private Sub GenerateReport()
    Dim crApp As New CRAXDDRT.Application
    Dim crRpt As New CRAXDDRT.Report
    Dim crPara1 As CRAXDDRT.ParameterFieldDefinition
    Dim crPara2 As CRAXDDRT.ParameterFieldDefinition
    Dim Path As String
    
    'Path = App.Path + "\TwoParams_city_CustName_24-4-2020.rpt"
    'Setting rpt to the file
    
    Set crRpt = crApp.OpenReport(Path)
    Set crPara1 = crRpt.ParameterFields.GetItemByName("City")
    Set crPara2 = crRpt.ParameterFields.GetItemByName("CustomerName")
    crRpt.ParameterFields.GetItemByName("City").ClearCurrentValueAndRange
    crRpt.ParameterFields.GetItemByName("CustomerName").ClearCurrentValueAndRange
    Dim Count As Integer
    
    For Count = 0 To lstCity.ListCount - 1
        'If lstCity.Selected(Count) Then crRpt.ParameterFields.GetItemByName("City").AddCurrentValue lstCity.List(Count)
        If lstCity.Selected(Count) Then crPara1.AddCurrentValue lstCity.List(Count)
    Next
     For Count = 0 To lstCustomer.ListCount - 1
        'If lstCustomer.Selected(Count) Then crRpt.ParameterFields.GetItemByName("CustomerName").AddCurrentValue lstCustomer.List(Count)
        If lstCustomer.Selected(Count) Then crPara2.AddCurrentValue lstCustomer.List(Count)
    Next
     'Passing rpt as Source
     frmReport.CRViewer.ReportSource = crRpt
     frmReport.CRViewer.ViewReport
     frmReport.Show
 End Sub
 
