function p = a(dt, tEnd)

    t = [0:dt:tEnd];
    p=10 ./ (1 + 9.*exp(-t));
    plot(t, p);

end