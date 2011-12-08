function sol = IEuler (T0, dt, tEnd, Nx, Ny)

    tmp = T0;
    index=1;

    for t = dt : dt : tEnd
            
        tmp = gaussSeidel(tmp, Nx, Ny, dt);
        
        
        
        if t==1/8 || t==2/8 || t==3/8 || t==4/8
            
            mat = [];
            for j = 1 : Ny
                mat = [mat ; (tmp(1+(j-1).*Nx:j.*Nx))'];
            end

            sol(:,:,index) = mat;
            index = index+1;
        end
        
    end

end
