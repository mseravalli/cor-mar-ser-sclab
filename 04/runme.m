tEnd=4/8;

maxValues = [];

index = 1;

display = false;

for k = 2 : 5

    Nx = (2.^k) - 1;
    Ny = (2.^k) - 1;

    X = linspace(0, 1, Nx);
    Y = linspace(0, 1, Ny);

    A=systemMatrix(Nx, Ny);
    T0=ones(Nx*Ny,1);
    
    for l = 6 : 12
        
        dt=2.^(-l);
        
        eEulerSol = EEuler(T0, dt, tEnd, A, Nx, Ny);
        
        if(abs(max(max(eEulerSol(:,:,4)))) > 1 || isnan(max(max(eEulerSol(:,:,4)))))        
            maxValues(k-1, l-5) = false;
        else
            maxValues(k-1, l-5) = true;
        end
        
    end

end

disp('stable solutions are the ones');
disp(maxValues);

if display
    subplot(1,4,1), surf(X,Y,eEulerSol(:,:,1));
    %axis([0 1 0 1 0 0.15]);
    title('at timestep 1/8');

    subplot(1,4,2), surf(X,Y,eEulerSol(:,:,2));
    %axis([0 1 0 1 0 0.15]);
    title('at timestep 2/8');

    subplot(1,4,3), surf(X,Y,eEulerSol(:,:,3));
    %axis([0 1 0 1 0 0.15]);
    title('at timestep 3/8');

    subplot(1,4,4), surf(X,Y,eEulerSol(:,:,4));
    %axis([0 1 0 1 0 0.15]);
    title('at timestep 4/8');
end
    
    
