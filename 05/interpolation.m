function TsInt = interpolation(TsCoarse, Nx, Ny)

    TsInt = zeros(Nx*Ny, 1);

    NxCoarse = (Nx+1)/2 - 1;
    NyCoarse = (Ny+1)/2 - 1;

    for i = 1 : NxCoarse

        offset = ((2*i)-1) * Ny;

        for j = 1 : NyCoarse

            TsInt(offset + 2*j) = TsCoarse( (i-1)*NyCoarse + j );    

            %point on the left
            if(i > 1)
                TsInt(offset - Ny + 2*j)=(TsInt(offset + 2*j) + TsInt(offset - 2*Ny + 2*j))/2;
            end
            %last point on the right
            if(i == NxCoarse)
                TsInt(offset + Ny + 2*j)= TsInt(offset + 2*j)/2;
            end
            if(i == 1)
                TsInt(offset - Ny + 2*j)= TsInt(offset + 2*j) /2;
            end

            %point above
            if(j > 1)
                TsInt(offset + 2*j - 1) = (TsInt(offset + 2*j) + TsInt(offset + 2*j - 2)) / 2;
            end
            %point on the bottom
            if(j == NyCoarse)
                TsInt(offset + 2*j + 1) = TsInt(offset + 2*j) / 2;
            end
            if(j == 1)
                TsInt(offset + 2*j - 1) = TsInt(offset + 2*j) / 2;
            end
            
        end

    end
    
    for i = 1 : NxCoarse

       offset = ((2*i)-1) * Ny;

       for j = 1 : NyCoarse
           
           %point on the left
            if(i > 1)
                TsInt(offset - Ny + 2*j - 1)=(TsInt(offset + 2*j - 1) + TsInt(offset - 2*Ny + 2*j - 1))/2;
            end
            %last point on the right
            if(i == NxCoarse)
                TsInt(offset + Ny + 2*j - 1)= TsInt(offset + 2*j - 1)/2;
            end
            %point in the first column
            if(i == 1)
                TsInt(offset - Ny + 2*j - 1)= TsInt(offset + 2*j - 1) /2;
            end
            %point on the bottom
            if(j == NyCoarse)
                TsInt(offset + 2*j + Ny + 1) = TsInt(offset + Ny + 2*j) / 2;
            end
            %point in lower-left corner
            if(j == NyCoarse && i == 1)
                TsInt(offset + 2*j - Ny + 1) = TsInt(offset - Ny + 2*j) / 2;
            end
           
        end
       
    end

end
