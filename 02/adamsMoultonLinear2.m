function p = adamsMoultonLinear1(y0, dt, tEnd)
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the implicit Adams Moulton method linearisation.
% Returns p, the vector of values for each dt.

	p = [y0];
	f = @(x)((x + 0.5 .* dt .* 7 .*(1 - x/10) .* x)/(1 - 0.5 .* dt .* 7 .*(1 - x/10)));
    
    for t = dt : dt : tEnd
       
	y0 = feval(f, y0);
	p = [p y0]; 
        
    end

end
