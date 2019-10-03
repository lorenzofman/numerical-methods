function NewtonInterpolation (x, y, xTil)
  difDiv = ComputeDivDiff(x, y);
  n = columns(x)
  sum = 0;
  for i = 1 : n
    partial = 1;
    partial *= difDiv(1, i);
    for j = 1 : i - 1
      partial *= (xTil - x(j))
    endfor
    sum += partial;
  endfor
  sum
endfunction

function retval = ComputeDivDiff(x, y)
  retval(:, 1) = y';
  
  n = columns(x);
  for col = 2 : n
    for row = 1 : n - (col - 1)
      div = x(row + (col - 1)) - x(row);
      x_0 = retval(row + 0, col - 1);
      x_1 = retval(row + 1, col - 1);
      retval(row, col) = (x_1 - x_0) / div;
    endfor
  endfor
endfunction