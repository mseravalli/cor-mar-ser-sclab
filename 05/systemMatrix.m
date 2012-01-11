function mat = systemMatrix(Nx, Ny)
%mat = systemMatrix(Nx, Ny) constructs system matrix

hx=1/(Nx+1);
hy=1/	(Ny+1);

mat= zeros(Nx .* Ny, Nx .* Ny);

i = 1;
j = 1;

for j = 1 : Ny
    
	for i = 1 : Nx
        
        if j>1
           mat((j-1)*Nx+i, (j-2)*Nx+i) = 1./(hx.^2);
        end

        if i-1>=1
           mat((j-1)*Nx+i, (j-1)*Nx+i-1) = 1./(hy.^2);
        end

        mat((j-1)*Nx+i, (j-1)*Nx+i) = -(2./(hx^2)+2./(hy^2));

        if i+1<=Nx
           mat((j-1)*Nx+i, (j-1)*Nx+i+1) = 1./(hy.^2);
        end

        if j<Ny
            mat((j-1)*Nx+i, j*Nx+i) = 1./(hx.^2);
        end

    end 

    %i = i + 1;
	
end

end
