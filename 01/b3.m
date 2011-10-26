function p = b3(y0, dt, tEnd, fPrime)
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the Runge-Kutta method.
% Returns p, the vector of values for each dt.

    p = [y0];    
    tmp = y0;
    
    
    fPrimeOne = fPrime;
    fPrimeTwo = @(x)( fPrimeOne(x + 0.5.*dt*fPrimeOne(x)) );
    fPrimeThree = @(x)(fPrimeOne(x + 0.5.*dt*fPrimeTwo(x)));
    fPrimeFour = @(x)(fPrimeOne(x + dt*fPrimeThree(x)));
    
    
    for t = dt : dt : tEnd
                
        tmp = tmp + 1/6.*dt .* (fPrimeOne(tmp)  + 2.*fPrimeTwo(tmp) + 2.*fPrimeThree(tmp) + fPrimeFour(tmp));
        p = [p tmp];
        
    end
    
    plot([0:dt:tEnd], p, 'black');

end
