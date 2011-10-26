function p = b3(y0, dt, tEnd, fPrime)

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