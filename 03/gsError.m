function err = gsError(gs, exact)

    Nx = size(gs, 1);
    Ny = size(gs, 2);

    outSum = 0;

    for i = 1 : Nx
        
        inSum = 0;
        
        for j = 1 : Ny
            inSum = inSum + (gs(i, j) - feval(exact, i, j)).^2;
        end

        outSum = outSum + inSum;

    end

    err = sqrt(outSum./(Nx.*Ny));

end

