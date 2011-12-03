rhs = @(x,y)(-2.*pi.*pi.*sin(pi.*x).*sin(pi.*y));
Nx = 31;
Ny = 31;

display = false;

times = [];

errors = [];

%system matrix
disp('b) System matrix')
A = systemMatrix(Nx, Ny);

%calculates right hand side (b)
b=[];
for l = 1 : Ny
    for k = 1 : Nx
        b = [b; feval(rhs, k./(Nx+1), l./(Ny+1))];
    end
end

%direct solver with stored system matrix
tic;
disp('d1) Direct solver - full matrix')
dirSolFull = directSolver(A, b, Nx, Ny);
times = [times toc];

%direct solver with system matrix stored as sparse matrix
tic;
disp('d2) Direct solver - sparse matrix')
dirSolSparse = directSolver(sparse(A), b, Nx,Ny);
times = [times toc];

%solved using GaussSeidel
tic;
disp('d3) Gauss - Seidel')
gaussSeidelOur = gaussSeidel(b, Nx, Ny);
times = [times toc];

disp('errors')
errors = [ errors gsError(dirSolFull, rhs)];
errors = [ errors gsError(dirSolSparse, rhs)];
errors = [ errors gsError(gaussSeidelOur, rhs)];

times

save('errors.txt', 'errors', '-ascii', '-append');
save('times.txt', 'times', '-ascii', '-append');

%****************************************************************
Nx = 63;
Ny = 63;

%direct solver with stored system matrix
tic;
disp('d1) Direct solver - full matrix')
dirSolFull = directSolver(A, b, Nx, Ny);
times = [times toc];

%direct solver with system matrix stored as sparse matrix
tic;
disp('d2) Direct solver - sparse matrix')
dirSolSparse = directSolver(sparse(A), b, Nx,Ny);
times = [times toc];

%solved using GaussSeidel
tic;
disp('d3) Gauss - Seidel')
gaussSeidelOur = gaussSeidel(b, Nx, Ny);
times = [times toc];

disp('errors')
errors = [ errors gsError(dirSolFull, rhs)];
errors = [ errors gsError(dirSolSparse, rhs)];
errors = [ errors gsError(gaussSeidelOur, rhs)];

times

save('errors.txt', 'errors', '-ascii', '-append');
save('times.txt', 'times', '-ascii', '-append');


%****************************************************************
Nx = 128;
Ny = 128;

%direct solver with stored system matrix
tic;
disp('d1) Direct solver - full matrix')
dirSolFull = directSolver(A, b, Nx, Ny);
times = [times toc];

%direct solver with system matrix stored as sparse matrix
tic;
disp('d2) Direct solver - sparse matrix')
dirSolSparse = directSolver(sparse(A), b, Nx,Ny);
times = [times toc];

%solved using GaussSeidel
tic;
disp('d3) Gauss - Seidel')
gaussSeidelOur = gaussSeidel(b, Nx, Ny);
times = [times toc];

disp('errors')
errors = [ errors gsError(dirSolFull, rhs)];
errors = [ errors gsError(dirSolSparse, rhs)];
errors = [ errors gsError(gaussSeidelOur, rhs)];

times

save('errors.txt', 'errors', '-ascii', '-append');
save('times.txt', 'times', '-ascii', '-append');


