function p = IEuler(y0, dt, tEnd, f, fPrime)
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the implicit Euler method.
% Returns p, the vector of values for each dt.

	p = [y0];

    for t = dt : dt : tEnd

		if((1-7*dt)^2 + 4*7*dt*y0/10 < 0)
	    	y0=inf;
		else
		     y0 = newtonMethod(y0, f, fPrime); 
		end

	p = [p y0]; 
        
    end

end
