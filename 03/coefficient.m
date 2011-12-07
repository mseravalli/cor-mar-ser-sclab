function coef = coefficient(c, i,j, Nx, Ny)
% coef = coefficient(i,j, Nx, Ny) calculates the coefficient at the position (i,j) in system matrix

    hx = 1/(Nx+1);
    hy = 1/(Ny+1);

%    external = 1/hx^2; 
%    internal = 1/hy^2; 
%    central = -2/hx^2 - 2/hy^2;

    if i==j
        coef = c;
    elseif j == i-1 && mod(i-1, Nx)~=0
        coef = c;
    elseif j == i+1 && mod(i, Nx)~=0
        coef = c;
    elseif abs(i-j) == Nx
        coef = c;
    else
        coef = 0;
    end

end
