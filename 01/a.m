function p = a(dt, tEnd)
% p = a(dt, tEnd)
% The function computes and plots the solutions for the equation (1-10/p).*p in the range [0:dt:tEnd]
% Returns p, the vector of values for each dt.

    t = [0:dt:tEnd];
    p=10 ./ (1 + 9.*exp(-t));
    plot(t, p);

end
