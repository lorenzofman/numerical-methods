function ret = RootRefinerBissection(f, a, b, error)
  i = 0;
  do
    mid = (b+a)/2;
    if f(mid) * f(a) > 0
      a = mid;
    else
      b = mid;
    endif
  i += 1;
  until abs(b - a) < error
  printf("Root between [%f, %f], found in %i iterations\n", a , b, i)
endfunction