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
      mult = fact
      do while (mult < limit)
        if (all(multiples /= mult)) then
          multiples(i) = mult
          i = i + 1
        end if
        mult = mult + fact
      end do
    end do

    res = sum(multiples)
  end function sum_multiples

end module sum_of_multiples


! function sum_of_multiples(limit, factors)
!     multiples = BitSet()
!     for f in factors
!         f == 0 && continue
!         multiple = f
!         while multiple < limit
!             push!(multiples, multiple)
!             multiple += f
!         end
!     end
!     sum(multiples)
! end

! def sum_of_multiples(limit, multiples):
!     uniques = set()
!     for num in [m for m in multiples if m > 0]:
!         mult = num
!         while mult < limit:
!             uniques.add(mult)
!             mult += num
!     return sum(uniques)