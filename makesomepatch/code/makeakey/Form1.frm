VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "make a key !!"
   ClientHeight    =   3390
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3390
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "make the key !!!!"
      Height          =   495
      Left            =   120
      TabIndex        =   7
      Top             =   2760
      Width           =   4455
   End
   Begin VB.TextBox Text7 
      Height          =   375
      Left            =   120
      MaxLength       =   50
      TabIndex        =   6
      Top             =   240
      Width           =   4455
   End
   Begin VB.TextBox Text6 
      Height          =   495
      Left            =   120
      MaxLength       =   10
      TabIndex        =   5
      Top             =   2040
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1920
      MaxLength       =   30
      TabIndex        =   4
      Top             =   840
      Width           =   2655
   End
   Begin VB.TextBox Text5 
      Height          =   495
      Left            =   120
      MaxLength       =   10
      TabIndex        =   3
      Top             =   1440
      Width           =   1575
   End
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   120
      MaxLength       =   10
      TabIndex        =   2
      Top             =   840
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   1920
      MaxLength       =   30
      TabIndex        =   1
      Top             =   1440
      Width           =   2655
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   1920
      MaxLength       =   30
      TabIndex        =   0
      Top             =   2040
      Width           =   2655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim lab As String * 10
Dim key As String * 30
Dim description As String * 50
If (Text7.Text = "") Then
        MsgBox "pas de descripteur !!!"
        Exit Sub
Else
        description = Text7.Text
End If

lepatch = App.Path + "\patch\" + Trim(description) + ".key"
 Open lepatch For Output As #3
 Print #3, description
 
 lab = Text4.Text
 Print #3, lab
 key = Text1.Text
 Print #3, key
 
 lab = Text5.Text
 Print #3, lab
 key = Text2.Text
 Print #3, key
 
 lab = Text6.Text
 Print #3, lab
 key = Text3.Text
 Print #3, key
 
 Close #3
End Sub

