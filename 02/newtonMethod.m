function r = newtonMethod(x, f, fPrime)
%root finding using newton's method
%i required for ensuring termination even if the function is not well behaved
	
    x0 = x;

    i = 0; 

    maxIter = 50;

	while (i < maxIter && abs( feval(f, x, x0 ) ) > 10.^(-4) )
	
		x = x - feval(f, x, x0 ) ./ feval(fPrime, x);

        i = i + 1;

	end

    if (i < 50)
	    r = x;
    else
        r = Inf;
    end
	
end
