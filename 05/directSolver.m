function mat = directSolver(A, b, Nx, Ny)
% function mat = directSolver(A, b, Nx, Ny) solves A*x = b using Matlab's direct solver. A can be full or sparse matrix

    x = A\b;

    mat = zeros(1,Nx + 2);

    for j = 1 : Ny
        mat = [mat ; [0, (x(1+(j-1).*Nx:j.*Nx))' , 0]];
    end

    mat = [ mat ; zeros(1,Nx + 2)];

    if issparse(A)
        numElements = 3*nnz(A)+numel(x)+numel(b)+numel(mat)
    else
        numElements = numel(A)+numel(x)+numel(b)+numel(mat)
    end

end
