function b =  restriction(res, Nx, Ny)

    NxCoarse = (Nx+1)/2 - 1;
    NyCoarse = (Ny+1)/2 - 1;

    b = zeros(NxCoarse * NyCoarse, 1);

    for i = 1 : NxCoarse 

        offset = ((2*i)-1) * Ny;

        for j = 1 : NyCoarse

            b((i-1)*NyCoarse + j) = res(offset + 2*j);

        end

    end
forDeBug = matrixTransform(b, NxCoarse, NyCoarse);
end
