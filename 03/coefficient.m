function coef = coefficient(i,j, Nx, Ny)
    hx = 1/(Nx+1);
    hy = 1/(Ny+1);
    if i==j
        coef = -2/hx^2 - 2/hy^2;
    elseif j == i-1 && mod(i-1, Nx)~=0
        coef = 1/hy^2;
    elseif j == i+1 && mod(i, Nx)~=0
        coef = 1/hy^2;
    elseif abs(i-j) == Nx
        coef = 1/hx^2;
    else
        coef = 0;
    end
end
