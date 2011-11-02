%display results in a tabular form

appErr = approximationErrors;
relErr = relativeErrors(approximationErrors);
errApp = errorApproximation;
titel = ['Euler      '; 'Heun       '; 'Runge-Kutta'];

for i = 1 : 3

	disp(titel(i,:));
	result = [1 1/2 1/4 1/8];
	result = [result ; appErr(i,:) ];	
	result = [result ; [0/0 relErr(i,:)] ];	
	result = [result ; errApp(i,:) ];	

	disp(result);

end

%plotting
y0 = 1;
tEnd = 5;

maxPrec = 3;

pExact = a(0.1, tEnd);

eFig = figure;
hold on;
title('Euler method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');


hFig = figure;
hold on;
title('Heun method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');

rkFig = figure;
hold on;
title('Runge-Kutta method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');

legendStr = ['Exact result'];
	
for j = 0 : maxPrec

	dt = 1/(2^j);
	tmp = approxMethods(y0, dt, tEnd);

	legendStr = [legendStr ; ['dt = '  num2str(dt, '%1.2f') '   ']];

	set(0,'CurrentFigure',eFig);
	plot([0:dt:tEnd], tmp(2,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);

	set(0,'CurrentFigure',hFig);
	plot([0:dt:tEnd], tmp(3,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);

	set(0,'CurrentFigure',rkFig);
	plot([0:dt:tEnd], tmp(4,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);

end

set(0,'CurrentFigure',eFig);
legend(legendStr, 'Location','Best');

set(0,'CurrentFigure',hFig);
legend(legendStr, 'Location','Best');

set(0,'CurrentFigure',rkFig);
legend(legendStr, 'Location','Best');

figure;
plotApproxErr;


clear appErr relErr errApp result i j dt tmp maxPrec;























