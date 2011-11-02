function E = e(dt, dtBest, pApprox, pExact)

	pExact = pExact(1:round(dt./dtBest):length(pExact));
	
	E = sqrt( dt ./5 .* sum ( (pApprox - pExact).* (pApprox - pExact)) );

end
