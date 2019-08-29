function Secant(f, x, x0, e)
  i = 0;
  h = e;
  format long
  do
    i += 1;
    diffSecant = (x0 * f(x) - x * f(x0))/(f(x) - f(x0))
    x0 = x
    x = diffSecant;
  until (abs(f(x)) < e && abs(x - x0) < e)
  printf("Using %i iterations, the result is %f\n", i, x)
endfunction