function mat = directSolver(A, b, Nx, Ny)
%function mat = directSolver(A, b, Nx, Ny) solves A*x = b using Matlab's direct solver. A can be full or sparse matrix

    x = A\b;

    mat = zeros(1,Nx + 2);

    for j = 1 : Ny
        mat = [mat ; [0, (x(1+(j-1).*Nx:j.*Nx))' , 0]];
    end

    mat = [ mat ; zeros(1,Nx + 2)];
end
