function Trapeziu(f, a, b, err)
  m = M(f, a, b, err)
  
  h = (b - a)/m;
  
  integral = 0;  
  
  for i = 0 : m - 1
    integral += h/2 * (f(h*i) + f(h*(i+1)));
  endfor
  
  integral
endfunction

function m = M(f, a, b, err)
  p1 = (b-a)^3;
  p2 = p1 * M2(f, a, b, err);
  p3 = p2 / (12 * err);
  m = ceil(sqrt(p3));
endfunction

function retval = M2(f, a, b, err)
  div = (b - a) / err;
  retval = diff2(f, a);
  for i = 0 : div
    df = diff2(f, err * i);
    if(df > retval)
      retval = df; 
    endif
  endfor
endfunction

function r = diff2(f, x)
  d = 1e-5;
  r = (f(x + 2*d) - 2 * f(x+d) + f(x))/ d^2;
endfunction
