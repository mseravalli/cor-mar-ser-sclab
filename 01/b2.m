function p = b2(y0, dt, tEnd, fPrime)

    p = [y0];    
    tmp = y0;
    
    %fPrime = @(x)((1 - x/10).*x);
    
    fPrimeTilde = @(x)( feval(fPrime , x + dt*feval(fPrime, x)));
    
    for t = dt : dt : tEnd
                
        tmp = tmp + 0.5.*dt .* (feval(fPrime, tmp)  + fPrimeTilde(tmp));
        p = [p tmp];
        
    end
    
    plot([0:dt:tEnd], p, 'g');

end