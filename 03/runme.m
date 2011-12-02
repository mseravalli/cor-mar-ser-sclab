rhs = @(x,y)(-2.*pi.*pi.*sin(pi.*x).*sin(pi.*y));
Nx = 3;
Ny = 4;

%system matrix
disp('b) System matrix')
A = systemMatrix(Nx, Ny)

%calculates right hand side (b)
b=[];
for l = 1 : Ny
    for k = 1 : Nx
        b = [b; feval(rhs, k./(Nx+1), l./(Ny+1))];
    end
end

%direct solver with stored system matrix
disp('d1) Direct solver - full matrix')
dirSolFull = directSolver(A, b, Nx, Ny)

%direct solver with system matrix stored as sparse matrix
disp('d2) Direct solver - sparse matrix')
dirSolSparse = directSolver(sparse(A), b, Nx,Ny)

%solved using GaussSeidel
disp('d3) Gauss - Seidel')
gaussSeidelOur = gaussSeidel(b, Nx, Ny)
