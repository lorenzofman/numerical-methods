function LURefactoring(A, b)
  U = A;
  n = rows(U);
  L = eye(n);
  P = L;
  idx = 0;
  for(j = 1 : n - 1)
    subU = U(j+1:n,j+1:j+1)
    [minval, idx] = max(subU);
    subU
    idx = idx + j+1
    tmp = U(j, :);
    U(j, :) = U(idx, :);
    U(idx, :) = tmp;
    for(i = j + 1 : n)
      multiplier = U(i,j)/U(j,j);
      L(i,j) = multiplier;
      U(i,:) = U(i,:) - multiplier * U(j,:);
    endfor
  endfor
  
  # Matrices
  U
  L
  
  # Solutions
  y = inv(L)*b
  x = inv(U)*y

endfunction