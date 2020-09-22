VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.1#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "PaTcH This (Crazy hacker2000)"
   ClientHeight    =   5595
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   7965
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5595
   ScaleWidth      =   7965
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog Cdg 
      Left            =   2760
      Top             =   4440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327681
   End
   Begin VB.ListBox Liste 
      Height          =   5130
      ItemData        =   "apply.frx":0000
      Left            =   120
      List            =   "apply.frx":0002
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   7815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type listedepatch
    nomdufich As String
    type As String * 1
    descrfich As String * 60
    Text1 As String * 10
    Text2 As String * 10
    Text3 As String * 10
    key1 As String * 30
    key2 As String * 30
    key3 As String * 30
End Type
Dim bigtab() As listedepatch

Private Sub Command1_Click()
Dim count As Integer
Dim buf As String * 50
Dim along As Long
Dim abit As Byte
Dim abit2 As Byte
Dim pospatch As Long

Cdg.ShowOpen
If (Cdg.filename <> "") Then
Call FileCopy(Cdg.filename, Cdg.filename + ".old")
count = 1
Do While (Liste.Text <> bigtab(count).descrfich)
    count = count + 1
Loop
Open Cdg.filename For Binary Access Read Write As #1

Open App.Path + "\patch\" + bigtab(count).nomdufich For Binary Access Read Lock Read As #2

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
End If

End Sub
Private Sub Command2_Click()
Dim count As Integer
Dim buf As String * 50
Dim along As Long
Dim abit As Byte
Dim abit2 As Byte
Dim pospatch As Long



count = 1
Do While (Liste.Text <> bigtab(count).descrfich)
    count = count + 1
Loop
Open App.Path + "\patch\" + bigtab(count).nomdufich For Input As #2
        Input #2, buf
        Input #2, bigtab(count).Text1
        Input #2, bigtab(count).key1
        Input #2, bigtab(count).Text2
        Input #2, bigtab(count).key2
        Input #2, bigtab(count).Text3
        Input #2, bigtab(count).key3
        

        Close #2
        Form2.Caption = buf
        Form2.Text1 = RTrim$(bigtab(count).key1)
        Form2.Label1 = bigtab(count).Text1
        
        Form2.Text2 = RTrim$(bigtab(count).key2)
        Form2.Label2 = bigtab(count).Text2
        
        Form2.Text3 = RTrim(bigtab(count).key3)
        Form2.Label3 = bigtab(count).Text3
        Form2.Show
        
        If (Trim$(bigtab(count).Text1) <> "") Then
            
            Form2.Label1.Visible = True
            Form2.Text1.Visible = True
        End If
        
        If (Trim$(bigtab(count).Text2) <> "") Then
            Form2.Label2.Visible = True
            Form2.Text2.Visible = True
         End If
        
        If (Trim$(bigtab(count).Text3) <> "") Then
            Form2.Label3.Visible = True
            Form2.Text3.Visible = True
        End If
        
        
        Unload Me

End Sub
Private Sub Form_Load()
Dim myname
Dim convi As Integer
Dim count As Integer
Dim desc As String * 50
myname = Dir(App.Path + "\patch\" + "*.crk")
count = 0
Do While myname <> ""
    count = count + 1
    Open App.Path + "\patch\" + myname For Binary Access Read Lock Read As #2
        ReDim Preserve bigtab(count)
        Get #2, 1, desc
        bigtab(count).nomdufich = myname
        bigtab(count).type = "C"
        bigtab(count).descrfich = desc
    Close #2
 
myname = Dir    ' Extrait l'entrée suivante.
Loop
myname = Dir(App.Path + "\patch\" + "*.reg")

Do While myname <> ""
    count = count + 1
    Open App.Path + "\patch\" + myname For Binary Access Read Lock Read As #2
        ReDim Preserve bigtab(count)
        Get #2, 1, desc
        bigtab(count).nomdufich = myname
        bigtab(count).type = "R"
        bigtab(count).descrfich = Mid(myname, 1, Len(myname) - 4)
    Close #2
 
myname = Dir    ' Extrait l'entrée suivante.
Loop

myname = Dir(App.Path + "\patch\" + "*.key")

Do While myname <> ""
    count = count + 1
    Open App.Path + "\patch\" + myname For Binary Access Read Lock Read As #2
        ReDim Preserve bigtab(count)
        Get #2, 1, desc
        bigtab(count).nomdufich = myname
        bigtab(count).type = "K"
        bigtab(count).descrfich = desc
    Close #2
 
myname = Dir    ' Extrait l'entrée suivante.
Loop

For convi = 1 To count
    Liste.AddItem (bigtab(convi).descrfich)
Next convi
End Sub




Private Sub Liste_DblClick()
Dim count As Integer
count = 1
Do While (Liste.Text <> bigtab(count).descrfich)
    count = count + 1
Loop
If (bigtab(count).type = "C") Then
    Call Command1_Click
Else
    If (bigtab(count).type = "K") Then
    Call Command2_Click
    Else
    Call Shell("regedit " + App.Path + "\patch\" + bigtab(count).nomdufich)
    End
    End If
End If
End Sub
