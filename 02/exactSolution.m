function p = exactSolution(dt, tEnd)
% p = a(dt, tEnd)
% The function computes and plots the solutions for the equation p(t)= 200 ./ (20 - 10.*exp(-7*t)) in the range [0:dt:tEnd]
% Returns p, the vector of values for each dt.

    t = [0:dt:tEnd];
    p = 200 ./ (20 - 10.*exp(-7.*t));

end
