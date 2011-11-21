function approxErrors = approximationErrors(minPrec, maxPrec)
%approxErrors = approximationErrors() returns a matrix containing all the approximation errors for the three differen methods, using each time a smaller dt
%the first row will contain the error for the explicit Euler approximation
%the second row will contain the error for the explicit Heun approximation
%the third row will contain the error for the implicit approximation
%the fourth row will contain the error for the implicit Adams Moulton approximation
%the fifth row will contain the error for the Adamms Moulton Linearization 1 approximation
%the sixth row will contain the error for the Adamms Moulton Linearization 2 approximation
%each column is a different (in this case smaller) dt
	
	y0 = 20;
	tEnd = 5;

	approxErrors = [];

	for i = minPrec : maxPrec
		dt = 1/(2.^i);
	
		approx = approxMethods(y0, dt, tEnd); 
	
		tmp = [];
	
		tmp = [tmp c(dt, approx(2,:), approx(1,:))];
		tmp = [tmp c(dt, approx(3,:), approx(1,:))];
		tmp = [tmp c(dt, approx(4,:), approx(1,:))];
		tmp = [tmp c(dt, approx(5,:), approx(1,:))];
		tmp = [tmp c(dt, approx(6,:), approx(1,:))];
		tmp = [tmp c(dt, approx(7,:), approx(1,:))];
	
		approxErrors = [approxErrors ; tmp];

	end

	approxErrors = approxErrors';

end
