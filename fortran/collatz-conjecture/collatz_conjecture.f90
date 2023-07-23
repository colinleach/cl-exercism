
module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer, intent(in) :: i
    integer :: n
    integer :: count

    if (i < 1) then
      steps = -1
    else
      count = 0
      n = i
      do while (n > 1)
        n = merge(n / 2, 3 * n + 1, mod(n, 2) == 0)
        count = count + 1
      end do

      steps = count
    end if

  end function

end module
