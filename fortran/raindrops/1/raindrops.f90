module raindrops
  implicit none
contains

  function convert(i)
    integer :: i
    character(20) :: convert

    convert = trim(sound(i, 3, "Pling")) // trim(sound(i, 5, "Plang")) &
              // trim(sound(i, 7, "Plong"))

    if (trim(convert) == "") then
      write(convert, *) i 
      convert = trim(adjustl(convert))
    end if
    
  end function convert

  function sound(i, divisor, drop)
    integer :: i
    integer :: divisor
    character(5) :: drop
    character(5) :: sound

    if (mod(i, divisor) == 0) then
      sound = drop
    else
      sound = ""
    end if
  end function sound

end module raindrops
