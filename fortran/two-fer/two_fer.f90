module two_fer
  implicit none

contains

  function twoFer(name) result(phrase)
    character(*), intent(in), optional :: name
    character(:), allocatable :: phrase
    character(len=10) :: local_name

    if (present(name)) then
        local_name = name
    else
        local_name = "you"
    end if
    phrase = "One for " // trim(local_name) // ", one for me."
  end function twoFer

end module two_fer
