function approx = approxMethods(y0, dt, tEnd)
% returns a matrix with the values for all approximations

    approx = [];

	fPrime = @(x)(7 .* (1 - x/10) .* x);
    
    approx = exactSolution(dt, tEnd); 
    approx = [approx; EEuler(y0, dt, tEnd, fPrime)]; 
    approx = [approx; EHeun(y0, dt, tEnd, fPrime)]; 
	
	f      = @(x, x0)(x -  dt .* 7 .* (1 - (x/10)) .* x - x0);
	fPrime = @(x)(1 - dt .* 7 .* (1 -x/5));
	approx = [approx; IEuler(y0, dt, tEnd, f, fPrime)]; 
	
	f      = @(x, x0)(x - 0.5 .* dt .* 7 .*(  (1 - (x0/10)) .* x0 + (1 - (x/10)) .* x ) - x0);
	fPrime = @(x)(1 - dt .* 0.7 .* (5 -x));
	approx = [approx; adamsMoulton(y0, dt, tEnd, f, fPrime)];

	approx = [approx; adamsMoultonLinear1(y0, dt, tEnd)];
	approx = [approx; adamsMoultonLinear2(y0, dt, tEnd)];

end
