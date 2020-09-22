VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "MaKe A pAtCh !!!! (Crazy Hacker2000)"
   ClientHeight    =   1545
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9255
   LinkTopic       =   "Form1"
   ScaleHeight     =   1545
   ScaleWidth      =   9255
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1800
      MaxLength       =   50
      TabIndex        =   3
      Top             =   120
      Width           =   4695
   End
   Begin MSComDlg.CommonDialog Cdg 
      Left            =   0
      Top             =   2280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton patch 
      Caption         =   "make the patch"
      Height          =   615
      Left            =   6120
      TabIndex        =   2
      Top             =   840
      Width           =   2295
   End
   Begin VB.CommandButton crack 
      Caption         =   "crack"
      Height          =   615
      Left            =   3360
      TabIndex        =   1
      Top             =   840
      Width           =   1695
   End
   Begin VB.CommandButton Original 
      Caption         =   "Original"
      Height          =   615
      Left            =   360
      TabIndex        =   0
      Top             =   840
      Width           =   1815
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   6840
      TabIndex        =   5
      Top             =   120
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "Description fichier"
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public originalname As String
Public crackname As String
Public lepatch As String
Private nameofthecrack As String * 50



Private Sub crack_Click()
Cdg.ShowOpen
crackname = Cdg.filename
End Sub



Private Sub Original_Click()
Cdg.ShowOpen
originalname = Cdg.filename
nameofthecrack = Cdg.FileTitle
End Sub

Private Sub patch_Click()
Dim abit As Byte
Dim abit2 As Byte
Dim count As Long
Dim description As String * 50
Dim taille As Long
Dim patchexe As String
Label2.Caption = ""

If (FileLen(originalname) <> FileLen(crackname)) Then
    MsgBox "le fichier original et le crack non pas la même taille"
    Exit Sub
End If
taille = FileLen(originalname)
If (Text1.Text = "") Then
        MsgBox "pas de descripteur !!!"
        Exit Sub
Else
        description = Text1.Text
End If

lepatch = App.Path + "\patch\" + Trim(description) + ".crk"
patchexe = App.Path + "\autoexe\" + Trim(description) + ".exe"
Call FileCopy(App.Path + "\" + "crack.exe", patchexe)
Open originalname For Binary Access Read Lock Read As #1
Open crackname For Binary Access Read Lock Read As #2
Open lepatch For Binary Access Write As #3
Open patchexe For Binary Access Write As #4
    Put #4, FileLen(App.Path + "\crack.exe"), nameofthecrack
    Put #3, , description
    Put #4, , description
    count = 0
    Get #1, , abit
    Get #2, , abit2
    Label2 = CStr(CInt(count / taille * 100)) + "%"
    DoEvents
    Do While Not EOF(1)
        count = count + 1
        abit = abit Xor abit2
        If (abit = 0) Then
        Else
            Put #3, , count
            Put #4, , count
            Put #3, , abit
            Put #4, , abit
            Label2 = CStr(CInt(count / taille * 100)) + "%"
            DoEvents
        End If
        Get #1, , abit
        Get #2, , abit2
    Loop
Close #1
Close #2
Close #3
Close #4
MsgBox "patch terminé !!!"
Label2.Caption = ""
End Sub
