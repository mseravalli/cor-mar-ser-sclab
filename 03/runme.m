% example of usage 
% Nx=15; Ny=15; display = true; runme

rhs = @(x,y)(-2.*pi.*pi.*sin(pi.*x).*sin(pi.*y));
exact = @(x,y)(sin(pi.*x).*sin(pi.*y));

% Nx = 7;
% Ny = 7;

X=[];
for i = 1 : Nx+1
    X=[X i/(Nx+1)];
end
X = [0 X];
Y = X;

%display = false;

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
errors = [ errors gsError(dirSolFull, exact)];
errors = [ errors gsError(dirSolSparse, exact)];
errors = [ errors gsError(gaussSeidelOur, exact)];

errors

times

save('errors.txt', 'errors', '-ascii', '-append');
save('times.txt', 'times', '-ascii', '-append');

if display 

    clf;

    subplot(2,3,1), surf(X,Y,dirSolFull)
    title('Direct Solver');

    subplot(2,3,2), surf(X,Y,dirSolSparse)
    title('Direct Solver Sparse');

    subplot(2,3,3), surf(X,Y,gaussSeidelOur)
    title('Gauss-Seidel');

    subplot(2,3,4), contour(X,Y,dirSolFull)
    subplot(2,3,5), contour(X,Y,dirSolSparse)
    subplot(2,3,6), contour(X,Y,gaussSeidelOur)

end
