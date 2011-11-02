%script for plotting the approximation errors 
approxErrors = approximationErrors();
clf;
hold on;
title('Approximation errors');
xlabel('dt');
ylabel('Approximation error');
semilogy([1/8, 1/4, 1/2, 1], fliplr(approxErrors(1,:)), 'r');
semilogy([1/8, 1/4, 1/2, 1], fliplr(approxErrors(2,:)), 'g');
semilogy([1/8, 1/4, 1/2, 1], fliplr(approxErrors(3,:)), 'black');
legend('Euler', 'Heun', 'Runge-Kutta', 'Location', 'Best');
hold off;
clear approxErrors;
