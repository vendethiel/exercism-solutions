module sieve
  implicit none

contains

  function primes(limit) result(array)
    integer, intent(in) :: limit
    integer, allocatable :: array(:)
    integer, allocatable :: mark(:)
    integer :: i, j

    allocate(mark(limit), source=1)
    do i = 2, limit
      if (mark(i) == 1) then
        do j = i * i, limit, i
          mark(j) = 0
        end do
      end if
    end do

    j = 1
    allocate(array(count(mark==1)-1))
    do i = 2, limit
      if (mark(i) == 1) then
        array(j) = i
        j = j + 1
      end if
    end do
  end function primes

end module sieve
