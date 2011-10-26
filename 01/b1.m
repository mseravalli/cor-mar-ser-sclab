function p = b1(y0, dt, tEnd, fPrime )

    p = [y0];    
    tmp = y0;

    for t = dt : dt : tEnd
            
        tmp = tmp + dt .* (feval(fPrime, tmp));
        p = [p tmp];
        
    end
    
    plot([0:dt:tEnd], p, 'r');

end