function r = newtonMethod(x, f, fPrime)
	
	x0 = x;

	while (abs( feval(f, x, x0 ) ) > 10.^(-4) )
	
		x = x - feval(f, x, x0 ) ./ feval(fPrime, x);

	end
	
	r = x;

end
