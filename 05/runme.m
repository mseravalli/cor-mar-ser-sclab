% example of usage 

format long;

rhs = @(x,y)(-2.*pi.*pi.*sin(pi.*x).*sin(pi.*y));
exact = @(x,y)(sin(pi.*x).*sin(pi.*y));

resultTableGS = [];
resultTableSOR = [];

for n = 2 : 5

    Nx = (2^n) - 1;
    Ny = (2^n) - 1;

    %calculates right hand side (b)
    b=[];
    for l = 1 : Ny
        for k = 1 : Nx
            b = [b; feval(rhs, k./(Nx+1), l./(Ny+1))];
        end
    end

    %solved using Gauss - Seidel
    [matGS, storageGS, iterationsGS, timeGS] = gaussSeidel(b, Nx, Ny);

    %solved using SOR
    [matSOR, storageSOR, iterationsSOR, timeSOR] = SOR(b, Nx, Ny);

    factorGS = NaN;
    factorSOR = NaN;

    if(n > 2)
        factorGS = iterationsGS / resultTableGS(1,end);
        factorSOR = iterationsSOR / resultTableSOR(1,end);
    end

    resultTableGS = [resultTableGS  [iterationsGS; factorGS; timeGS; storageGS]];
    resultTableSOR = [resultTableSOR  [iterationsSOR; factorSOR; timeSOR; storageSOR]];

end

disp(resultTableGS)
disp(resultTableSOR)

display = false;

if display 

    X=[];
    for i = 1 : Nx+1
        X=[X i/(Nx+1)];
    end
    X = [0 X];
    Y = X;

    clf;

    subplot(1,2,1), surf(X,Y,mat)
    title('Gauss-Seidel');

    subplot(1,2,2), contour(X,Y,mat)

end

%ploting errors
Nx = 255;
Ny = 255;

X=[];
for i = 1 : Nx+1
    X=[X i/(Nx+1)];
end
X = [0 X];
Y = X;

b = [];
for l = 1 : Ny
    for k = 1 : Nx
        b = [b; feval(rhs, k./(Nx+1), l./(Ny+1))];
    end
end

[mat10, mat20, mat30] = gaussSeidelIter(b, Nx, Ny);

exactMatrix = zeros(Nx+2, Ny+2);
for i = 1 : Nx+2
    for j = 1 : Ny+2
        exactMatrix(i,j) = feval(exact, (i-1)./(Nx+1), (j-1)./(Ny+1)).^2;
    end
end

subplot(1,3,1), surf(X,Y, mat10-exactMatrix)
subplot(1,3,2), surf(X,Y, mat20-exactMatrix)
subplot(1,3,3), surf(X,Y, mat30-exactMatrix)
