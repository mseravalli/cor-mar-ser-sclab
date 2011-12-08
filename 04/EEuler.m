function sol = EEuler(T0, dt, tEnd, A, Nx, Ny)
% p = b1(y0, dt, tEnd, fPrime) calculates the approximation for the given function using the Euler method.
% Returns p, the vector of values for each dt.
        
    tmp = T0;
    index=1;

    for t = dt : dt : tEnd
            
        tmp = tmp + dt .* (A*tmp);
        if t==1/8 || t==2/8 || t==3/8 || t==4/8
            
            %mat = zeros(1,Nx + 2);
            mat = [];
            for j = 1 : Ny
                mat = [mat ; (tmp(1+(j-1).*Nx:j.*Nx))'];
            end
            %mat = [ mat ; zeros(1,Nx + 2)];

            sol(:,:,index) = mat;
            index = index+1;
        end
        
    end

    
end
