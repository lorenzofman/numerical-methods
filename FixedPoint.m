function FixedPoint(f, phi, x, e)
  i = 0;
  last = 0;
  format long
  do
    i += 1;
    last = x;
    x = phi(x);
  until (abs(f(x)) < e && abs(x - last) < e)
  printf("Using %i iterations, the result is %f\n", i, x)
endfunction