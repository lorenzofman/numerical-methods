function Secante_21(f, x, x0, erro)
  i = 0;
  h = erro;
  do
    i += 1;
    diffSecant = (x0 * f(x) - x * f(x0))/(f(x) - f(x0));
    x0 = x;
    x = diffSecant;
  until (abs(f(x)) < erro && abs(x - x0) < erro)
  printf("Using %i iterations, the result is %.15f\n", i, x)
endfunction