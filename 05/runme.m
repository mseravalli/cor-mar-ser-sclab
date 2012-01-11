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

display = false;

resultTable = [];

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

    %solved using GaussSeidel
    [mat, storage, iterations, time] = gaussSeidel(b, Nx, Ny);

    factor = NaN;

    if(n > 2)
        factor = iterations / resultTable(1,end);
    end

    resultTable = [resultTable  [iterations; factor; time; storage]];

    %disp('errors')
    %disp(gsError(gaussSeidelOur, exact))

end

disp(resultTable);

if display 

    clf;

    subplot(1,2,1), surf(X,Y,gaussSeidelOur)
    title('Gauss-Seidel');

    subplot(1,2,2), contour(X,Y,gaussSeidelOur)

end
