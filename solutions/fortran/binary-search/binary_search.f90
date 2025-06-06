module binary_search
  implicit none
contains

  function find(array, val) result(idx)
    integer, dimension(:), intent(in) :: array
    integer, intent(in) :: val
    integer :: idx, i

    idx = -1
    do i = 1, size(array)
      if (array(i) == val) then
        idx = i
        return
      end if
    end do
  end function

end module
