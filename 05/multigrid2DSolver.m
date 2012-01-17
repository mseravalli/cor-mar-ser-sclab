function [mat, storage, iterations, time] = multigrid2DSolver (b, Nx, Ny)

    mat = ones(Nx * Ny, 1);

    res = 1;
    
    storage = 0;
    iterations = 0;

    tic;
    
    while res > 10^(-4)
        
        [mat, storage, iterations, time] = multigrid2D(mat, b, Nx, Ny);
        res = sqrt(sum(residual(mat, b, Nx, Ny).^2));
        iterations = iterations + 1;
    end
    
    time = toc;
    
    mat = matrixTransform(mat, Nx, Ny);
    
end
