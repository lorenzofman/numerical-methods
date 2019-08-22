function RootRange(f, a, b, n)
  step = (b - a)/n
  for x = (a+step):step:b
      if f(x) * f(x-step) < 0
          printf("[%f,%f]\n",x - step, x)
      endif
  endfor
endfunction

