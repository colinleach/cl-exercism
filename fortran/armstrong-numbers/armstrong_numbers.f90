
module armstrong_numbers
  implicit none
contains

  integer function numDigits(i)
    integer, intent(in) :: i

    if (i == 0) then
      numDigits = 0
    else
      numDigits = floor(log10(real(i))+1)
    end if

  end function

  logical function isArmstrongNumber(i)
    integer, intent(in) :: i
    integer :: n  ! number of digits
    integer :: accum
    integer :: rest
    integer :: d ! loop counter

    accum = 0
    rest = i
    n = numDigits(i)
    do d = 1, n
      accum = accum + mod(rest, 10)**n
      rest = rest / 10
    end do
    isArmstrongNumber = (accum == i)

  end function

end module
