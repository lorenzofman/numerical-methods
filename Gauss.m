function Gauss(A, b)
  Ab = [A b];
  Ab = Triangle(Ab);
  for(i=rows(Ab):-1:1)
    coef = i
    for(j=i+1:rows(Ab))
      Ab(i,j) *= Ab(i+1, i+1);
      Ab(i, columns(Ab)) -= Ab(i,j);
      Ab(i,j) = 0;
    endfor
    coefficient = Ab(coef,coef);
    Ab(coef,:) = Ab(coef,:)/ coefficient;
  endfor
  Ab
endfunction

function retval = Triangle(Ab)
  for(j = 1 : columns(Ab) - 1)
    for(i = j + 1 : rows(Ab))
      multiplier = Ab(i,j)/ Ab(j,j);
      Ab(i,:) = Ab(i,:) - multiplier * Ab(j,:);
    endfor
  endfor
  retval = Ab;
endfunction