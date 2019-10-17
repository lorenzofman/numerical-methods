function NewtonInterpolation (x, y)
  difDiv = ComputeDivDiff(x, y);
  n = columns(x);
  sum = 0;
  min = x(1);
  max = x(length(x));
  step = 0.0001;
  idx = 1;
  for f = min : step : max
    xs(idx) = f;
    ys(idx) = 0;
    for i = 1 : n
      partial = 1;
      partial *= difDiv(1, i);
      for j = 1 : i - 1
        partial *= (xs(idx) - x(j));
      endfor
      ys(idx) += partial;
    endfor
    idx += 1;
  endfor
  plot(xs', ys', '.');
  
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