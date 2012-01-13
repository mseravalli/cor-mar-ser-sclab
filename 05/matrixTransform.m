function transformedMat = matrixTransform(mat, Ts, Nx, Ny)
%transformedMat = matrixTransform(mat, Ts, Nx, Ny) transforms vector Ts to matrix Nx*sNy
    for j = 1 : Ny

        mat = [mat ; [0, (Ts(1+(j-1).*Nx:j.*Nx))' , 0]];

    end

    transformedMat = [ mat ; zeros(1,Nx + 2)];
    
end
