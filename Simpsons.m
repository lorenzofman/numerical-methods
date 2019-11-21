function Simpsons(f, a, b, err)
  m = M(f, a, b, err)
  h = (b - a)/m;
  
  integral = 0;
  
  for k = 1 : m / 2
    integral += (f(2 * k - 2) + 4 * f(2 * k - 1)  + f(2 * k));
  endfor
  
  integral *= h/3
endfunction

function m = M(f, a, b, err)
  p1 = (b-a)^5;
  p2 = p1 * M4(f, a, b, err);
  p3 = p2 / (180 * err);
  m = ceil(p3^0.25 /2) * 2;
endfunction

function retval = M4(f, a, b, err)
  div = (b - a) / err;
  retval = diff4(f, a, 1e-5);
  for i = 0 : div
    df = diff4(f, err * i);
    if(df > retval)
      retval = df; 
    endif
  endfor
endfunction

function r = diff4(f, x)
  d = 1e-2;
  r = (f(x + 4 * d) - 4 * f (x + 3 * d) + 6 * f (x + 2 * d) - 4 * f (x + d) + f (x)) / d^4;
endfunction
