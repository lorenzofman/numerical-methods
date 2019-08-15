% Calculate e^x using MacLaurin
function retVal = eulerApproximation(x,n)
  format long
  eulerApproximation = 0;
  realValue = e**x
  lastIteration = 0;
  for i=0:n
      i
      t = eulerIteration(x, i)
      eulerApproximation += t
      absoluteError = realValue - eulerApproximation
      relativeError = absoluteError/eulerApproximation
      absoluteIterationError = eulerApproximation - lastIteration
      relativeIterationError = absoluteIterationError/eulerApproximation
      lastIteration = eulerApproximation;
  endfor
endfunction

function partial = eulerIteration(x, iteration)
  partial = (x**iteration)/factorial(iteration);
endfunction