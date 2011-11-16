%display results in a tabular form

appErr = approximationErrors(1,5);
relErr = relativeErrors(appErr);
titel = [	'Explicit Euler  '; 
			'Explicit Heun   '; 
			'Implicit Euler  ';
			'Adams-Moutlon   ';
			'Adams-Moutlon L1';
			'Adams-Moutlon L2'];

for i = 1 :6 

	disp(titel(i,:));
	result = [1/2 1/4 1/8 1/16 1/32];
	result = [result ; appErr(i,:) ];	
	result = [result ; [0/0 relErr(i,:)] ];	

	disp(result);

end


%plotting
y0 = 20;
tEnd = 5;

minPrec = 1;
maxPrec = 12;

pExact = exactSolution(0.1, tEnd);

%explicit Euler
eeFig = figure;
hold on;
title('Euler method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
ylim([0 20]);

%Explicit Heun
hFig = figure;
hold on;
title('Heun method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
ylim([0 20]);

%implicit Euler
ieFig = figure;
hold on;
title('Implicit Euler method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
ylim([0 20]);

%implicit Adams-Moulton
iamFig = figure;
hold on;
title('Implicit Adams-Moulton method');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
ylim([0 20]);

%implicit Adams-Moulton linearisation 1
iaml1Fig = figure;
hold on;
title('Implicit Adams-Moulton method linearised 1');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
ylim([0 20]);

%implicit Adams-Moulton linearisation 2
iaml2Fig = figure;
hold on;
title('Implicit Adams-Moulton method linearised 2');
xlabel('t'); 
ylabel('p(t)');
plot([0:0.1:tEnd], pExact, 'r');
xlim([0 5]);
%ylim([0 20]);

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

	set(0,'CurrentFigure', iamFig);
	plot([0:dt:tEnd], tmp(5,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);
	
	set(0,'CurrentFigure', iaml1Fig);
	plot([0:dt:tEnd], tmp(6	,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);

	set(0,'CurrentFigure', iaml2Fig);
	plot([0:dt:tEnd], tmp(7	,:), 'Color', [0 1-(j/(maxPrec + 1)) j/(maxPrec + 1)]);
end

set(0,'CurrentFigure', eeFig);
legend(legendStr, 'Location', 'SouthEast');

set(0,'CurrentFigure',hFig);
legend(legendStr, 'Location', 'SouthEast');

set(0,'CurrentFigure', ieFig);
legend(legendStr, 'Location', 'SouthEast');

set(0,'CurrentFigure', iamFig);
legend(legendStr, 'Location', 'SouthEast');

set(0,'CurrentFigure', iaml1Fig);
legend(legendStr, 'Location', 'SouthEast');

set(0,'CurrentFigure', iaml2Fig);
legend(legendStr, 'Location', 'SouthEast');

clear i j dt tmp maxPrec;





