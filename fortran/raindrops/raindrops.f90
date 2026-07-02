module raindrops
  implicit none
contains

  pure function convert(i)
    integer, intent(in) :: i
    character(20) :: convert

    convert = trim(sound(i, 3, "Pling")) // trim(sound(i, 5, "Plang")) &
              // trim(sound(i, 7, "Plong"))

    if (trim(convert) == "") then
      write(convert, *) i 
      convert = trim(adjustl(convert))
    end if
    
  end function convert

  pure function sound(i, divisor, drop)
    integer, intent(in) :: i
    integer, intent(in) :: divisor
    character(5), intent(in) :: drop
    character(5) :: sound

    if (mod(i, divisor) == 0) then
      sound = drop
    else
      sound = ""
    end if
  end function sound

end module raindrops
