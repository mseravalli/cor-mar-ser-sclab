function approxErrors = approximationErrors()
%approxErrors = approximationErrors() returns a matrix containing all the approximation errors for the three differen methods, using each time a smaller dt
%the first row will contain the error for the Euler approximation
%the second row will contain the error for the Heun approximation
%the third row will contain the error for the Runge-Kutta approximation
%each column is a different (in this case smaller) dt
	
	y0 = 1;
	tEnd = 10;

	approxErrors = [];

	for i = 0 : 3
		dt = 1/(2.^i);
	
		approx = approxMethods(y0, dt, tEnd); 
	
		tmp = [];
	
		tmp = [tmp c(dt, approx(2,:), approx(1,:))];
		tmp = [tmp c(dt, approx(3,:), approx(1,:))];
		tmp = [tmp c(dt, approx(4,:), approx(1,:))];
	
		approxErrors = [approxErrors ; tmp];

	end

	approxErrors = approxErrors';

end
