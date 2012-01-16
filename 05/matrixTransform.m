function transformedMat = matrixTransform(Ts, Nx, Ny)
%transformedMat = matrixTransform(mat, Ts, Nx, Ny) transforms vector Ts to matrix Nx*sNy
    
    mat = zeros(Ny + 2, 1);

    for i = 1 : Nx

        mat = [mat, [0; (Ts(1+(i-1).*Nx:i.*Nx)); 0]];

    end

    transformedMat = [ mat , zeros(Nx + 2, 1)];
    
end
