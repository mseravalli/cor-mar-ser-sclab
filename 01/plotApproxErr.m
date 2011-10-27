%script for plotting the approximation errors 
%TODO label axes and curves
approxErrors = approximationErrors();
clf;
hold on;
plot([1/8, 1/4, 1/2, 1], fliplr(approxErrors(1,:)), 'r');
plot([1/8, 1/4, 1/2, 1], fliplr(approxErrors(2,:)), 'g');
plot([1/8, 1/4, 1/2, 1], fliplr(approxErrors(3,:)), 'black');
hold off;
clear approxErrors;
