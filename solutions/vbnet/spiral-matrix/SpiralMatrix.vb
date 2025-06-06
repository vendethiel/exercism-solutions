Option Strict
Option Explicit
Imports System

Public Class SpiralMatrix
    Private Shared Function Go(ByVal x As Integer, ByVal y As Integer, ByVal w As Integer) As Integer
        If y = 1 Then
            Return x
        Else
            Return w \ 2 + Go(y - 1, w \ 2 - x + 1, w - 1)
        End If
    End Function

    Public Shared Function GetMatrix(ByVal size As Integer) As Integer(,)
        Dim result(size - 1, size - 1) As Integer
        For x As Integer = 1 To size
            For y As Integer = 1 To size
                result(x - 1, y - 1) = Go(y, x, size * 2)
            Next
        Next
        Return result
    End Function
End Class
