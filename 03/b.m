function mat = b(Nx, Ny)

hx=1/(Nx+1);
hy=1/	(Ny+1);

mat= zeros(Nx .* Ny, Nx .* Ny);

i = 1;
j = 1;

for i = 1 : Nx
    
	for j = 1 : Ny
        
        if j>1
        mat((i-1)*Ny+j, (i-1)*Ny+j-1) = 1./(hy.^2);
        end

        mat((i-1)*Ny+j, (i-1)*Ny+j) = -(2./(hx^2)+2./(hy^2));

        if j<Ny
        mat((i-1)*Ny+j, (i-1)*Ny+j+1) = 1./(hy.^2);
        end

    end 

    j = j + 1;
	
end

end
