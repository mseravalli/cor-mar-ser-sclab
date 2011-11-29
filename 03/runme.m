rhs = @(x,y)(-2.*pi.*pi.*sin(pi.*x).*sin(pi.*y));
Nx = 3;
Ny = 3;
b=[];
for l = 1 : Ny
    for k = 1 : Nx
        b = [b; feval(rhs, k./(Nx+1), l./(Ny+1))];
    end
end
mat = gaussSeidel(b, Nx, Ny);
%surf(mat);
%plot()
