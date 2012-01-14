function [Ts, storage, iterations, time] = multigrid2D(Ts, b, Nx, Ny)

    storage = 0;
    iterations = 0;
    time = 0;

    Ts = gaussSeidelSmoother(Ts, b, Nx, Ny, 2);
    %forDeBug = matrixTransform(Ts, Nx, Ny);

    %think about a good condition
    if(Nx >= 3)

        NxCoarse = (Nx+1)/2 - 1;
        NyCoarse = (Ny+1)/2 - 1;

        res = residual(Ts, b, Nx, Ny);

        bCoarse = restriction(res, Nx, Ny);

        [TsCoarse, s, i, t] = multigrid2D(ones(NxCoarse*NyCoarse,1), bCoarse, NxCoarse, NyCoarse);

        Ts = Ts + interpolation(TsCoarse, Nx, Ny);
        
        matrixTsAfterInterpolation = matrixTransform(Ts, Nx, Ny);
        
    end

    Ts = gaussSeidelSmoother(Ts, b, Nx, Ny, 2);
    smoothed = matrixTransform(Ts, Nx, Ny);
end
