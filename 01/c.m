function E = c(dt, pApprox, pExact)

	E = sqrt( dt ./5 .* sum ( (pApprox - pExact).* (pApprox - pExact)) );

end
