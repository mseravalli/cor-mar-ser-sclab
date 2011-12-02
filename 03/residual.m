function res = residual(Ts, b, Nx, Ny)
% res = residual(Ts, b, Nx, Ny) calculates the residual norm

    hx = 1./(Nx+1);
    hy = 1./(Ny+1);
    outsum=0;

    for k = 1 : length(Ts)
        insum = 0;
        for m = 1:length(Ts)
            insum = insum + coefficient(k,m,Nx,Ny).*Ts(m);
        end
        outsum = outsum+(b(k) - insum).^2;
    end

    res = sqrt(outsum./length(Ts));

end
