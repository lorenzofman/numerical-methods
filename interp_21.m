function interp_21(x, y)
  n = columns(x);
  sum = 0;
  min = min(x);
  max = max(x);
  step = 0.01;
  idx = 1;
  for f = min : step : max
    xs(idx) = f;
    ys(idx) = 0;
    for i = 1 : n
      product = 1;
      for j = 1 : n
        if j != i
          product *= (xs(idx) - x(j))/ (x(i) - x(j));  
        endif
      endfor
      ys(idx) += y(i) * product;
    endfor
    idx += 1;
  endfor
  plot(x, y, 'o', xs, ys, '-');
endfunction