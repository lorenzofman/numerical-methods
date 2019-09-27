function gaussjacobi_21(A, b, x, e)
  IsDiagonallyDominant(A, b);
  c = BuildC(A);
  g = BuildG(A, b);
  it = 0;
  do
    previousX = x;
    x = c*previousX + g;
    it = it + 1;
  until (max(abs(x - previousX)) < e)
  fprintf("Using %i iterations, the solution is: \n", it);
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

function IsDiagonallyDominant(A)
  for(i = 1:rows(A))
    otherElementsSum = VectorAbsSum(A(i,:)) - abs(A(i,i));
    if(otherElementsSum >= abs(A(i,i)))
      error("Gauss-Jacobi method diverges in the given matrix");
    endif
  endfor
endfunction

function sum = VectorAbsSum(vec)
  sum = 0;
  for(i = 1: length(vec))
    sum += abs(vec(i));
  endfor
endfunction
