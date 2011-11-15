function r = newtonMethod(x, f, fPrime)
	
	i = 0;

	x0 = x;

	while (i < 20 && abs( feval(f, x, x0 ) ) > 10.^(-4) )
	
		i = i + 1;

		x = x - feval(f, x, x0 ) ./ feval(fPrime, x);

	end

	if(i >= 19)
		disp('maybe solution was not reached');
		disp(feval(f, x, x0 ));
	end
	
	r = x;

end
