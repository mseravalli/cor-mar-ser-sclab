function res = residual(Ts, b, Nx, Ny)
% res = residual(Ts, b, Nx, Ny) 

    res=zeros(Nx*Ny,1);
    hx = 1./(1+Nx);
    hy = 1./(1+Ny);

    external = 1/hx^2; 
    internal = 1/hy^2; 
    central = -2/hx^2 - 2/hy^2;

    for k = 1 : Nx*Ny
        insum = 0;
        
        if(k-Ny > 0)
           insum = insum + external.*Ts(k-Ny);
        end
        if(k-1 > 0 && mod(k-1, Nx)~=0)
           insum = insum + internal.*Ts(k-1);
        end
        insum = insum + central.*Ts(k);
        if(k+1 <= Ny.*Nx && mod(k, Nx)~=0)
           insum = insum + internal.*Ts(k+1);
        end
        if(k+Ny <= Ny.*Nx)
           insum = insum + external.*Ts(k+Ny);
        end

        res(k) = (b(k) - insum);

    end
 
end
