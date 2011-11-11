function E = c(dt, pApprox, pExact)
%E = c(dt, pApprox, pExact) calculates the approximation by comparing the results of the actual curve with the ones of the approximated one
	E = sqrt( dt ./5 .* sum ( (pApprox - pExact).* (pApprox - pExact)) );

end
