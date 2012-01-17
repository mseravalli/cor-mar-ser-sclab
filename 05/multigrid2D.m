function [Ts, storage, iterations, time] = multigrid2D(Ts, b, Nx, Ny)

    storage = 0;
    iterations = 0;
    time = 0;

    res = [];
    bCoarse = [];

    Ts = gaussSeidelSmoother(Ts, b, Nx, Ny, 2);
    %forDeBug = matrixTransform(Ts, Nx, Ny);

    %think about a good condition
    if(Nx >= 3)

        NxCoarse = (Nx+1)/2 - 1;
        NyCoarse = (Ny+1)/2 - 1;

        res = residual(Ts, b, Nx, Ny);

        bCoarse = restriction(res, Nx, Ny);

        [TsCoarse, storage, i, t] = multigrid2D(zeros(NxCoarse*NyCoarse,1), bCoarse, NxCoarse, NyCoarse);

        Ts = Ts + interpolation(TsCoarse, Nx, Ny);
        
    end

    Ts = gaussSeidelSmoother(Ts, b, Nx, Ny, 2);

    storage = storage + numel(Ts) + numel(b) + numel(res) + numel(bCoarse);


end
