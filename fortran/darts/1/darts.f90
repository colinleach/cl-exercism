module darts
  implicit none

contains

  function score(x, y) result(points)
    real, intent(in):: x, y
    integer :: points
    real :: r

    r = sqrt(x**2 + y**2)
    if (r <= 1) then
      points = 10
    else if (r <= 5) then
      points = 5
    else if (r <= 10) then
      points = 1
    else
      points = 0
    end if
  end function score

end module darts

! function radius(x, y)
!     sqrt(x*x + y*y)
! end

! function score(x, y)
!     r = radius(x, y)
!     if     r > 10; 0 // missed
!     elseif r > 5;  1 // outer
!     elseif r > 1;  5 // middle
!     else          10 // inner
!     end
! end