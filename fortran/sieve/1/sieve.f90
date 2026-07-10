module sieve
  implicit none

contains

  function primes(limit) result(array)
    integer, intent(in) :: limit
    integer, allocatable :: array(:)
    integer :: i, n, nprimes
    logical, dimension(limit) :: unmarked

    unmarked = .true.
    nprimes = 0

    do n = 2, limit
      if (unmarked(n)) then
        nprimes = nprimes + 1
        i = n + n
        do while (i <= limit)
          unmarked(i) = .false.
          i = i + n
        end do
      end if
    end do

    allocate(array(nprimes))
    i = 1
    do n = 2, limit
      if (unmarked(n)) then
        array(i) = n
        i = i + 1
      end if
    end do
  end function primes

end module sieve
