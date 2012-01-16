function [mat, storage, iterations, time] = SOR(b, Nx, Ny)
% mat = gaussSeidel(b, Nx, Ny) solves system A*x = b using Gauss Seidel method and without storing system matrix

    Ts=zeros(Nx*Ny,1);
    hx = 1./(1+Nx);
    hy = 1./(1+Ny);

    omega = 2/(1+sin(pi*hx));
 
    external = 1/hx^2; 
    internal = 1/hy^2; 
    central = (-2/hx^2 - 2/hy^2);

   % b = omega .* b;

    iterations = 0;
  
    mat = zeros(1,Nx + 2) ;

    residual = 1;

    tic;

    while residual > 10^(-4)

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

            Ts(k) = (1-omega).*Ts(k) + omega./central.*(b(k)-term2-term1);

            
            if(k > 2)

                k = k-2;

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
                
                k = k+2;

            end

        end   
        

        for k = length(Ts) - 2 : length(Ts)

            insum = 0;

            if(k-Ny > 0)
                insum = insum + coefficient(external, k,k-Ny,Nx,Ny).*Ts(k-Ny);
            end
            if(k-1 > 0)
                insum = insum + coefficient(internal, k,k-1,Nx,Ny).*Ts(k-1);
            end
            insum = insum + coefficient(central, k,k,Nx,Ny).*Ts(k);
            if(k+1 <= Ny.*Nx)
                insum = insum + coefficient(internal, k,k+1,Nx,Ny).*Ts(k+1);
            end
            if(k+Ny <= Ny.*Nx)
                insum = insum + coefficient(external, k,k+Ny,Nx,Ny).*Ts(k+Ny);
            end
            
            outsum = outsum+(b(k) - insum).^2;
        end

        residual = sqrt(outsum./length(Ts));
         
    end

     for j = 1 : Ny
 
         mat = [mat ; [0, (Ts(1+(j-1).*Nx:j.*Nx))' , 0]];
 
     end
 
     mat = [ mat ; zeros(1,Nx + 2)];

%    mat = matrixTransform(mat, Nx, Ny);

    storage = numel(Ts)+numel(b)+numel(mat);

    time = toc;

end
