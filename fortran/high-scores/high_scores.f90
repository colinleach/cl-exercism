
module high_scores
  implicit none
contains

function scores(score_list)
  integer, dimension(:) :: score_list
  integer, dimension(size(score_list)) :: scores

  scores = score_list

end function

integer function latest(score_list)
  integer, dimension(:) :: score_list

  latest = score_list(size(score_list))
end function

integer function personalBest(score_list)
  integer, dimension(:) :: score_list

  personalBest = maxval(score_list)
end function

function personalTopThree(score_list)
  integer, dimension(:) :: score_list
  integer, dimension(3) :: personalTopThree
  integer :: i
  logical, dimension(size(score_list)) :: mask

  mask = .true.
  personalTopThree = [0, 0, 0]
  do i=1, size(score_list)
    personalTopThree(i) = maxval(score_list, mask=mask)
    mask(maxloc(score_list, mask)) = .false.
  end do

end function

end module
