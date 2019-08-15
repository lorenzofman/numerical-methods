% Calculate e^x using MacLaurin
function retVal = EulerError(x, absoluteMaxError)
  format long
  eulerApproximation = 0;
  realValue = e**x
  lastIteration = 0;
  i = 0
  do
      t = eulerIteration(x, i++)
      eulerApproximation += t
      absoluteError = realValue - eulerApproximation
      lastIteration = eulerApproximation;
  until absoluteError < absoluteMaxError
endfunction

function partial = eulerIteration(x, iteration)
  partial = (x**iteration)/factorial(iteration);
endfunction