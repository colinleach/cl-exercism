Public Module Leap
    Public Function IsLeapYear(ByVal year As Integer) As Boolean
        Return ((year Mod 4 = 0) And (year Mod 100.0 <> 0)) Or (year Mod 400 = 0)
    End Function
End Module