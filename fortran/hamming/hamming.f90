module hamming
  implicit none
contains

  function compute(strand1, strand2, distance)
      character(*) :: strand1, strand2
      integer :: distance, i
      logical :: compute

      distance = 0
      if ( len(strand1) /= len(strand2)) then
        compute = .false.
      else
        do i = 1, len(strand1)
          if (strand1(i:i) /= strand2(i:i)) then
            distance = distance + 1
          end if
        end do
        compute = .true.
      end if

  end function compute

end module hamming
