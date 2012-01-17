function [mat, storage, iterations, time] = multigrid2DSolver (b, Nx, Ny)
%multigrid2DSolver solves a system using multigrid  

    mat = ones(Nx * Ny, 1);

    res = 1;
    
    storage = 0;
    iterations = 0;

    tic;
    
    while res > 10^(-4)
        
        [mat, storage, iterations, time, res] = multigrid2D(mat, b, Nx, Ny);
        iterations = iterations + 1;
    end
    
    time = toc;
    
    mat = matrixTransform(mat, Nx, Ny);
    
end
