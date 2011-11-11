
%plotting
y0 = 20;
tEnd = 5;

minPrec = 0;
maxPrec = 5;

pExact = exactSolution(0.1, tEnd);

%explicit Euler
eeFig = figure;
hold on;
title('Euler method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
ylim([9 21]);

%Explicit Heun
hFig = figure;
hold on;
title('Heun method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
ylim([9 21]);

%implicit Euler
ieFig = figure;
hold on;
title('Implicit Euler method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);


legendStr = ['Exact result'];
	
for j = minPrec : maxPrec

	dt = 1/(2^j);
	tmp = approxMethods(y0, dt, tEnd);

	legendStr = [legendStr ; ['dt = '  num2str(dt, '%1.4f') ' ']];

	set(0,'CurrentFigure', eeFig);
	plot([0:dt:tEnd], tmp(2,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);

	set(0,'CurrentFigure',hFig);
	plot([0:dt:tEnd], tmp(3,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);

	set(0,'CurrentFigure', ieFig);
	plot([0:dt:tEnd], tmp(4,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);

end

set(0,'CurrentFigure', eeFig);
legend(legendStr, 'Location','Best');

set(0,'CurrentFigure',hFig);
legend(legendStr, 'Location','Best');

set(0,'CurrentFigure', ieFig);
legend(legendStr, 'Location','Best');


clear i j dt tmp maxPrec;





