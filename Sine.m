function retVal = Sine(x, error)
  retVal = 0
  iteration = 0
  realSin = sin(x)
  do
    retVal += SineIteration(x,iteration++)
    currentError = abs(realSin - retVal)
  until currentError < error
endfunction

function retVal = SineIteration(x, iteration)
  coefficient = (iteration + 1)* 2 - 1
  if rem (iteration, 2) == 0 
    retVal = x**coefficient/factorial(coefficient);
  else
    retVal = -x**coefficient/factorial(coefficient);
  endif
endfunction