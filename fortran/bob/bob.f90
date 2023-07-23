module bob
  implicit none

  character(len=26), PARAMETER :: uca = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  character(len=26), PARAMETER :: lca = 'abcdefghijklmnopqrstuvwxyz'

contains

  logical function has_case(str, alphabet)
    character(len=*), intent(in) :: str
    character(len=*), intent(in) :: alphabet
    integer :: i

    has_case = .false.
    do i = 1, len(str)
      if (index(alphabet, str(i:i)) > 0) then
        has_case = .true.
        exit
      end if
    end do

  end function has_case

  logical function yell(str)
    character(len=*), intent(in) :: str
    
    yell = (has_case(str, uca) .and. .not. has_case(str, lca))
  end function yell

  logical function question(str)
    character(len=*), intent(in) :: str
    integer :: last
    
    last = len(trim(adjustl(str)))
    question = (index("?", str(last:last)) > 0)
  end function question

  character(100) function hey(statement)
    character(100) :: resp
    character(len=*), intent(in) :: statement

    if (len(trim(adjustl(statement))) == 0) then
      resp = "Fine. Be that way!"
    else if (yell(statement) .and. question(statement)) then
      resp = "Calm down, I know what I'm doing!"
    else if (yell(statement)) then
      resp = "Whoa, chill out!"
    else if (question(statement)) then
      resp = "Sure."
    else
      resp = "Whatever."
    end if
    hey = resp
  end function hey

end module bob
