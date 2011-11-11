function approx = approxMethods(y0, dt, tEnd)

    approx = [];

%    fPrime = @(x)(7 .* (1 - x/10) .* x);
	fPrime = @(x)(7 .* (1 - x/10) .* x);
    
    approx = exactSolution(dt, tEnd); 
    approx = [approx; EEuler(y0, dt, tEnd, fPrime)]; 
    approx = [approx; EHeun(y0, dt, tEnd, fPrime)]; 
	
	approx = [approx; IEuler(y0, dt, tEnd)]; 

end
