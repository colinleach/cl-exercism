Imports System

Public Module CollatzConjecture
    Public Function Steps(ByVal number As Integer) As Integer
        If number < 1 Then
            Throw New System.ArgumentOutOfRangeException()
        End If

        Dim n As Integer = 0
        While number <> 1
            n += 1
            If number Mod 2 = 0 Then
                number /= 2
            Else
                number = 3 * number + 1
            End If
        End While
        Return n
    End Function
End Module