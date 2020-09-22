VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Key"
   ClientHeight    =   2235
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4800
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2235
   ScaleWidth      =   4800
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   1920
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   1440
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   1920
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   840
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1920
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   240
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.Label Label3 
      Caption         =   "text1"
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   1440
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "text1"
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   840
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "text1"
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Visible         =   0   'False
      Width           =   1335
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Déclaration d'une API Windows.
' Cette instruction doit être placée dans le module.
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
' Définit les constantes (à partir de WIN32API.TXT).
Const conHwndTopmost = -1
Const conHwndNoTopmost = -2
Const conSwpNoActivate = &H10
Const conSwpShowWindow = &H40
Private Sub Form_Load()

SetWindowPos hwnd, conHwndTopmost, 0, 0, Me.Width / Screen.TwipsPerPixelX, Me.Height / Screen.TwipsPerPixelY, _
            conSwpNoActivate Or conSwpShowWindow
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub
