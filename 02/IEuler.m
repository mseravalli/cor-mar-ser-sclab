function p = IEuler(y0, dt, tEnd, f, fPrime)
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the implicit Euler method.
% Returns p, the vector of values for each dt.

	p = [y0];
%	f      = @(x, x0)(x -  dt .* 7 .* (1 - (x/10)) .* x - x0);
%	fPrime = @(x)(1 - dt .* 7 .* (1 -x/5));

	disp('Implicit Euler');
    
    for t = dt : dt : tEnd
       
		y0 = newtonMethod(y0, f, fPrime); 
	    p = [p y0]; 
        
    end

end
