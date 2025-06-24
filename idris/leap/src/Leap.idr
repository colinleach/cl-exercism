module Leap

export
isLeap : Int -> Bool
isLeap year = ((mod year 4 == 0) && (mod year 100 != 0)) || (mod year 400 == 0)
