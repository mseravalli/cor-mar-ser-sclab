function p = b1(y0, dt, tEnd, fPrime )
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the Euler method.
% Returns p, the vector of values for each dt.

    p = [y0];    
    tmp = y0;

    for t = dt : dt : tEnd
            
        tmp = tmp + dt .* (feval(fPrime, tmp));
        p = [p tmp];
        
    end

end
