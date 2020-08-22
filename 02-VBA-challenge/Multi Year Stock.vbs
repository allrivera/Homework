Sub easy():

' Set dimensions
Dim total As Double
Dim i As Long
Dim change As Single
Dim j As Integer
Dim start As Long
Dim rowCount As Single
Dim percentChange As Single
Dim ws As Worksheet

For Each ws In Worksheets

    ' set values for each worksheet
    j = 0
    total = 0
    change = 0
    start = 2
    
    ' Set title row for new columns
ws.Range("I1").Value = "Ticker"
ws.Range("J1").Value = "Yearly Change"
ws.Range("K1").Value = "Percent Change"
ws.Range("L1").Value = "Total Stock Volume"

' Set initial values
j = 0
total = 0
change = 0
start = 2

' Get row number of last row with data
rowCount = Cells(Rows.Count, "A").End(xlUp).Row

For i = 2 To rowCount

    ' If ticker changes then print reults
    If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
    
        'Store results in variables
        total = total + ws.Cells(i, 7).Value
        
        'Handle zero total volume
        If total = 0 Then
            'print results
            ws.Range("I" & 2 + j).Value = ws.Cells(i, 1).Value
            ws.Range("J" & 2 + j).Value = 0
            ws.Range("K" & 2 + j).Value = "%" & 0
            ws.Range("L" & 2 + j).Value = 0
        Else
        
            ' Find first non-zero starting value
            If ws.Cells(start, 3) = 0 Then
                For find_value = start To i
                    If ws.Cells(find_value, 3).Value <> 0 Then
                        start = find_value
                        Exit For
                    End If
                Next find_value
            End If
            
            'Calculate change
            change = (ws.Cells(i, 6) - ws.Cells(start, 3))
            percentChange = Round((change / ws.Cells(start, 3) * 100), 2)
            
            'Start of next stock ticker
            start = i + 1
            
            'Print the results
            ws.Range("I" & 2 + j).Value = ws.Cells(i, 1).Value
            ws.Range("J" & 2 + j).Value = Round(change, 2)
            ws.Range("K" & 2 + j).Value = "%" & percentChange
            ws.Range("L" & 2 + j).Value = total
            
            'Colors positive, red negative
            Select Case change
                Case Is > 0
                    ws.Range("J" & 2 + j).Interior.ColorIndex = 4
                Case Is < 0
                    ws.Range("J" & 2 + j).Interior.ColorIndex = 3
                Case Else
                    Rws.ange("J" & 2 + j).Interior.ColorIndex = 0
            End Select
        End If
        
        'reset variables for new stock ticker
        total = 0
        change = 0
        j = j + 1
        
        'if ticker is still the same, add results
        Else
            total = total + ws.Cells(i, 7).Value
        End If
Next i
    
Next ws

End Sub

