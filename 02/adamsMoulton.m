function p = adamsMoulton(y0, dt, tEnd, f, fPrime)
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the implicit Adams Moulton method.
% Returns p, the vector of values for each dt.

	p = [y0];
%	f      = @(x, x0)(x - 0.5 .* dt .* 7 .*(  (1 - (x0/10)) .* x0 + (1 - (x/10)) .* x ) - x0);
%	fPrime = @(x)(1 - dt .* 0.7 .* (5 -x));
    
	disp('AM');

    for t = dt : dt : tEnd
       	if(((-20+70*dt-14*dt^2+70*dt)/20)^2-4*(-7*dt/10)*((-7*dt^3)/20+(7*dt^2)/2) < 0)
	    y0 = inf;
disp('inf');
		disp(dt);
	else
	    y0 = newtonMethod(y0, f, fPrime); 
	end
	    p = [p y0]; 
        
    end

end
