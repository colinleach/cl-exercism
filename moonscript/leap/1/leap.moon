leap_year = (year) ->
 (year % 4 == 0 and year % 100 != 0) or year % 400 == 0

return leap_year
