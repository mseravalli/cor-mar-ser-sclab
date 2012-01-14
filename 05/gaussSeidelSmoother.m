function Ts = gaussSeidelSmoother(Ts, b, Nx, Ny, maxIter)

    hx = 1./(1+Nx);
    hy = 1./(1+Ny);
 
    external = 1/hx^2; 
    internal = 1/hy^2; 
    central = -2/hx^2 - 2/hy^2;

    iterations = 0;

    while iterations < maxIter

        iterations = iterations + 1;

        outsum = 0;

        for k =1 : length(Ts)

            insum = 0;

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
         
    end

end
