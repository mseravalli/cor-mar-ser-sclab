function appErr = errorApproximation()

    fPrime = @(x)((1-x/10)  .*x);

	y0 = 1;
	tEnd = 5;

	dtBest = 1/(2.^3);

	pEulerGood = b1(y0, dtBest, tEnd, fPrime);	
	pHeunGood = b2(y0, dtBest, tEnd, fPrime);	
	pRKGood = b3(y0, dtBest, tEnd, fPrime);	
	
	appErr = [];

	eulerErr = [];
	heunErr = [];
	rkErr = [];

	for i = 0 : 3

		dt = 1/(2.^i);

		pEulerBad = b1(y0, dt, tEnd, fPrime);	
		eulerErr = [eulerErr e(dt, dtBest, pEulerBad, pEulerGood)];
		
		pHeunBad = b2(y0, dt, tEnd, fPrime);	
		heunErr = [heunErr e(dt, dtBest, pHeunBad, pHeunGood)];
		
		pRKBad = b3(y0, dt, tEnd, fPrime);	
		rkErr = [rkErr e(dt, dtBest, pRKBad, pRKGood)];

	end


	appErr = [eulerErr; heunErr; rkErr];


end
