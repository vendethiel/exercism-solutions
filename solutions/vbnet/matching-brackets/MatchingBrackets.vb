Imports System.Collections.Generic

Public Module MatchingBrackets
    Public Function IsPaired(ByVal input As String) As Boolean
        Dim opened As New Stack(Of Char)

        For Each c As Char In input
            Dim asEnd As Char? = GetEnd(c)

            If asEnd IsNot Nothing Then
                opened.Push(asEnd)
            ElseIf IsEnd(c) Then
                If opened.Count() = 0 Then
                    Return False
                Else If opened.Pop() <> c Then
                    Return False
                End If
            End If
        Next

        Return opened.Count() = 0
    End Function

    Private Function IsEnd(ByVal open As Char) As Boolean
        Select Case open
            Case "]", "}", ")"
                Return True
            Case Else
                Return False
        End Select
    End Function

    Private Function GetEnd(ByVal open As Char) As Char?
        Select Case open
            Case "["
                Return "]"
            Case "{"
                Return "}"
            Case "("
                Return ")"
            Case Else
                Return Nothing
        End Select
    End Function
End Module