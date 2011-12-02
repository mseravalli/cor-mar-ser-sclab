function mat = gaussSeidel(b, Nx, Ny)
% mat = gaussSeidel(b, Nx, Ny) solves system A*x = b using Gauss Seidel method and without storing system matrix

    Ts=zeros(Nx*Ny,1);
    hx = 1./(1+Nx);
    hy = 1./(1+Ny);
  
    mat = zeros(1,Nx + 2) ;

    while residual(Ts, b, Nx, Ny)>10^(-4)

        for k =1 : length(Ts)
            
            term1 = 0;  
            term2 = 0;

            for l = k+1 : length(Ts)
                term1 = term1 + coefficient(k,l,Nx,Ny).*Ts(l);                
            end

            for l = 1 : k-1
                term2 = term2 + coefficient(k,l,Nx,Ny).*Ts(l);
            end
            Ts(k)=1./coefficient(k,k,Nx,Ny).*(b(k)-term1-term2);
        end    
    end

    for j = 1 : Ny

        mat = [mat ; [0, (Ts(1+(j-1).*Nx:j.*Nx))' , 0]];

    end

    mat = [ mat ; zeros(1,Nx + 2)];


end
