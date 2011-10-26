function p = b2(y0, dt, tEnd, fPrime)
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the Heun method.
% Returns p, the vector of values for each dt.

    p = [y0];    
    tmp = y0;
    
    fPrimeTilde = @(x)( feval(fPrime , x + dt*feval(fPrime, x)));
    
    for t = dt : dt : tEnd
                
        tmp = tmp + 0.5.*dt .* (feval(fPrime, tmp)  + fPrimeTilde(tmp));
        p = [p tmp];
        
    end
    
    plot([0:dt:tEnd], p, 'g');

end
