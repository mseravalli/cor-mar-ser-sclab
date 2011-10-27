function relErrors = relativeError(approximationErrors)
% relErrors = relativeError(approximationErrors) returns a matrix where each row contains the reduction factor for every approximation method
% possible usage relativeErrors(approximationErrors) 
	
	relErrors = [];

	for i = 1 : size(approximationErrors, 1)

		err = [];

		for j = 2 : size(approximationErrors, 2)
			
			err = [err approximationErrors(i, j-1) ./ approximationErrors(i, j)];

		end

		relErrors = [relErrors; sum(err)/(j-1)];

	end


end
