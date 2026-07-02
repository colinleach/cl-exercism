
module perfect_numbers
  implicit none

contains

  character(len=9) function classify(num)
    integer, intent(in) :: num
    integer :: al_sum

    if (num < 1) then
      classify = "ERROR"
      return
    end if

    al_sum = aliquot_sum(num)
    if (num == al_sum) then
      classify = "perfect"
    else if (num < al_sum) then
      classify = "abundant"
    else
      classify = "deficient"
    end if

  end function

  integer function aliquot_sum(n)
    integer, intent(in) :: n
    integer :: f

    aliquot_sum = 0
    do f=1,n/2
      if (mod(n, f) == 0) then
        aliquot_sum = aliquot_sum + f
      end if
    end do
  end function

end module
