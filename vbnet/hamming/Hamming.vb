Public Module Hamming
    Public Function Distance(ByVal firstStrand As String, ByVal secondStrand As String) As Integer
        If firstStrand.Length <> secondStrand.Length Then
            Throw New System.ArgumentException()
        End If

        If firstStrand.Length = 0 Then
            Return 0
        End If

        Dim n As Integer = 0
        For i As Integer = 0 To firstStrand.Length - 1
            If firstStrand.Substring(i, 1) <> secondStrand.Substring(i, 1) Then
                n += 1
            End If
        Next i
        Return n
    End Function
End Module