function Integral_21(f, a, b, m)
  trapIntegral = Trapezium(f, a, b, m);
  simpIntegral = Simpson(f, a, b, m);
  printf("Integral approx with Trapezium method: %f\n", trapIntegral);
  printf("Integral approx with Simpsons method: %f\n", simpIntegral);
  
endfunction

function integral = Trapezium(f, a, b, m)
  integral = 0;
  h = (b - a)/m;
  for i = 0 : m - 1
    fa = f(a + h*i);
    fb = f(a + h*(i+1));
    integral += (fa + fb);
  endfor
  integral *= h/2;
endfunction

function integral = Simpson(f, a, b, m)
  if rem(m, 2) == 1
    error ("m must be even");
  endif
  integral = 0;
  h = (b - a)/m;
  for k = 1 : m / 2
    fa = f(a + h * (2 * k - 2));
    fb = f(a + h * (2 * k - 1));
    fc = f(a + h * (2 * k));
    integral += fa + 4 * fb + fc;
  endfor
  integral *= h/3;
endfunction
