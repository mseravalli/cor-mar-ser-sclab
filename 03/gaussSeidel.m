function mat = gaussSeidel(b, Nx, Ny)
    
    %bk=-2.*pi.*pi.*sin(pi.*x).*sin(pi.*y);
    Ts=zeros(Nx*Ny,1);
    hx = 1./(1+Nx);
    hy = 1./(1+Ny);
  
    mat = zeros(1,Ny + 2) ;

    while residual(Ts, b, Nx, Ny)>10^(-4)
residu = residual(Ts,b, Nx, Ny);

        for k =1 : length(Ts)
            
            term1 = 0;  
            term2 = 0;

            for l = k+1 : length(Ts)
                term1 = term1 + coefficient(k,l,Nx,Ny).*Ts(l);                
            end

            for l = 1 : k-1
                term2 = term2 + coefficient(k,l,Nx,Ny).*Ts(l);
            end        
            %Ts(k)=1./coefficient(k,k,Nx,Ny).*(feval(b,k.*hx,k.*hy)-term1-term2);
            Ts(k)=1./coefficient(k,k,Nx,Ny).*(b(k)-term1-term2);
        end    
    end
    
    for i = 1 : Nx
         %Ts(1+(i-1).*Ny:i.*Ny)
        mat = [mat ; [0, (Ts(1+(i-1).*Ny:i.*Ny))' , 0]];

    end

    mat = [ mat ; zeros(1,Ny + 2)];


end
