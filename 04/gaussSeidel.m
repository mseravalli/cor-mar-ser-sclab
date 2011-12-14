function Ts = gaussSeidel(T0, Nx, Ny, dt)
% mat = gaussSeidel(b, Nx, Ny) solves system A*x = b using Gauss Seidel method and without storing system matrix

    %Ts = zeros(Nx.*Ny, 1);
    Ts = T0;

    b = (-T0)./dt;
    hx = 1./(1+Nx);
    hy = 1./(1+Ny);
 
    external = 1/hx^2; 
    internal = 1/hy^2; 
    central = -2/hx^2 - 2/hy^2-1/dt;
  
    residual = 1;

    while residual > 10^(-4)

        for k =1 : length(Ts)
            
            term1 = 0;  
            term2 = 0;

            if(k-Ny > 0 )
                term1 = term1 + external.*Ts(k-Ny);
            end
            if(k-1 > 0 && mod(k-1, Nx)~=0)
                term1 = term1 + internal.*Ts(k-1);
            end
            if(k+1 <= Ny.*Nx && mod(k, Nx)~=0)
                term2 = term2 + internal.*Ts(k+1);
            end
            if(k+Ny <= Ny.*Nx )
                term2 = term2 + external.*Ts(k+Ny);
            end

            Ts(k)=1./central.*(b(k)-term2-term1);
            
        end   
        
        outsum = 0;

        for k = 1 : length(Ts)

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

            outsum = outsum+(b(k) - insum).^2;
        end

        residual = sqrt(outsum./length(Ts));
         
    end

    

end
