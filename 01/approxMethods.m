function approx = approxMethods(y0, dt, tEnd)

    approx = [];

    fPrime = @(x)((1-x/10)  .*x);
    
    %clf; 
    %hold on;
	%title('Approximation methods');
	%xlabel('t'); 
	%ylabel('p(t)');
    approx = a(dt, tEnd); 
    approx = [approx; b1(y0, dt, tEnd, fPrime)]; 
    approx = [approx; b2(y0, dt, tEnd, fPrime)]; 
    approx = [approx; b3(y0, dt, tEnd, fPrime)];
	%legend('exact', 'Euler', 'Heun', 'Runge-Kutta'); 
	%hold off;

end
