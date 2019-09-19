function GaussJacobi(A, b, x, e)
  c = BuildC(A);
  g = BuildG(A, b);
  it = 0;
  do
    previousX = x;
    x = c*previousX + g;
    it = it + 1;
  until (max(abs(x - previousX)) < e)
  fprintf("Using %i iterations, the result is: \n", it);
  fprintf("%f\n", x);
endfunction

function c = BuildC(A)
  for(i = 1:columns(A))
      A(i,:) = -A(i,:) / A(i,i);
  endfor
  for(i = 1:columns(A))
      A(i,i) = 0;
  endfor
  c = A;
endfunction
function g = BuildG(A, b)
  for(i = 1:columns(A))
      b(i,1) = b(i,1) / A(i,i);
  endfor
  g = b;
endfunction