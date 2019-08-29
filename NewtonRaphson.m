function NewtonRaphson(f, x, e)
  i = 0;
  last = 0;
  h = e;
  format long
  do
    i += 1;
    last = x;
    diff = (f(x+h) - f(x))/h;
    x = x - f(x)/diff;
  until (abs(f(x)) < e && abs(x - last) < e)
  printf("Using %i iterations, the result is %f\n", i, x)
endfunction