program fib

  !$OMP PARALLEL DO
  do i = 44, 46
    print*, fibonacci(i)
  end do
  !$OMP END PARALLEL DO

contains

  recursive pure function fibonacci(n) result(res)
    integer, intent(in), value :: n
    integer :: res
    if (n < 3) then
      res = 1
    else
      res = fibonacci(n-2) + fibonacci(n-1)
    end if
  end function fibonacci

end program fib
