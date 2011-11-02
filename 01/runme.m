%display results in a tabular form

appErr = approximationErrors;
relErr = relativeErrors(approximationErrors);
errApp = errorApproximation;
titel = ['Euler      '; 'Heun       '; 'Runge-Kutta'];

for i = 1 : 3

	disp(titel(i,:))
	result = [1 1/2 1/4 1/8];
	result = [result ; appErr(i,:) ];	
	result = [result ; [0/0 relErr(i,:)] ];	
	result = [result ; errApp(i,:) ];	

	disp(result)

end

clear appErr relErr errApp result i;



