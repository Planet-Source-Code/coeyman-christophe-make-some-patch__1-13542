Attribute VB_Name = "Module1"
' the program must be compiled with P-code option so the file lenght will be 6656 bytes
'if the exe size is different from 6656 replace the string by the size that you have
'the name of the exe is Crack.exe (don't ask me why...)
'but if you whant an another name you must change it in the other project

Private Sub Main()
Dim difference As Long
    

    difference = CLng(FileLen(App.Path + "\" + App.EXEName + ".exe") - CLng(6656))
    If (difference <> 0) Then

            Call C(CLng(6656))

    Else
        End
    End If
    
End Sub

Private Sub C(ByVal pointeur As Long)
Dim count As Integer
Dim buf As String * 50
Dim along As Long
Dim abit As Byte
Dim abit2 As Byte
Dim pospatch As Long
Dim nomduficexe As String * 50

Open App.Path + "\" + App.EXEName + ".exe" For Binary Access Read As #2
Get #2, pointeur, nomduficexe
MsgBox "patcher :" + Trim$(nomduficexe)
Open App.Path + "\" + nomduficexe For Binary Access Read Write As #1



            Get #2, , buf
            Get #2, , along
            Get #2, , abit
    Do While Not EOF(2)
            
            
            Get #1, along, abit2
            abit2 = abit Xor abit2
            Put #1, along, abit2
            Get #2, , along
            Get #2, , abit
    Loop
Close #1
Close #2
End
End Sub

