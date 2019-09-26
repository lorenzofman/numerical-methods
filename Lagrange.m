function Lagrange (x, y)
  L = cell(size(x));
  [num, den] = NumeratorFunctions(x,i)
  for(i = 1 : size(x))
    [L(i),D(i)] = NumeratorFunctions(x, i);
  endfor
  lFinal = "";
  for(i = 1 : size(L))
    lFinal = strcat(lFinal, "+ (", y(i), " * ", L(i), ")", "/", D(i));
  endfor
endfunction

function [num, den] = NumeratorFunctions(x, i)
   num = cell();
   den = 1;
   for(j = 1 : size(x) - 1)
    if(j == i)
      j = j + 1;
    endif
    num(j) = strcat("x - ", x(i));
    den(j) *= x(i) - x(j);
   endfor
endfunction