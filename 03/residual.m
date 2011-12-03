function res = residual(Ts, b, Nx, Ny)
% res = residual(Ts, b, Nx, Ny) calculates the residual norm

    hx = 1./(Nx+1);
    hy = 1./(Ny+1);
    outsum=0;

    for k = 1 : length(Ts)
        insum = 0;

        if(k-Ny > 0)
            insum = insum + coefficient(k,k-Ny,Nx,Ny).*Ts(k-Ny);
        end
        if(k-1 > 0)
            insum = insum + coefficient(k,k-1,Nx,Ny).*Ts(k-1);
        end
        insum = insum + coefficient(k,k,Nx,Ny).*Ts(k);
        if(k+1 <= Ny.*Nx)
            insum = insum + coefficient(k,k+1,Nx,Ny).*Ts(k+1);
        end
        if(k+Ny <= Ny.*Nx)
            insum = insum + coefficient(k,k+Ny,Nx,Ny).*Ts(k+Ny);
        end
        
%       for m = 1:length(Ts)
%           insum = insum + coefficient(k,m,Nx,Ny).*Ts(m);
%       end

        outsum = outsum+(b(k) - insum).^2;
    end

    res = sqrt(outsum./length(Ts));

end
