module sum_of_multiples
  implicit none

contains

  function sum_multiples(factors, limit) result(res)
    integer, intent(in) :: factors(:), limit
    integer :: res, i, mult, n, fact
    integer, dimension(limit) :: multiples

    i = 1
    multiples = 0
    do n = 1, size(factors)
      fact = factors(n)
      if (fact < 1) cycle
      do mult = fact, limit - 1, fact
        if (all(multiples /= mult)) then
          multiples(i) = mult
          i = i + 1
        end if
      end do
    end do

    res = sum(multiples)
  end function sum_multiples

end module sum_of_multiples
