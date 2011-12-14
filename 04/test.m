testEnd=4/8;

maxValues = [];

index = 1;

display = false;

    Nx = 3;
    Ny = 3;

    X = linspace(0, 1, Nx);
    Y = linspace(0, 1, Ny);

    A=systemMatrix(Nx, Ny);
    T0=ones(Nx*Ny,1);
    
        dt=1/64;

        eEulerSol = IEuler(T0, dt, tEnd, Nx, Ny);
        
        if(abs(max(max(eEulerSol(:,:,4)))) > 1 || isnan(max(max(eEulerSol(:,:,4)))))        
            %maxValues(k-1, l-5) = false;
        else
            %maxValues(k-1, l-5) = true;
        end
        
        
        
        
    subplot(1,4,1), surf(X,Y,eEulerSol(:,:,1));
    %axis([0 1 0 1 0 0.20]);
    title('at timestep 1/8');

    subplot(1,4,2), surf(X,Y,eEulerSol(:,:,2));
    %axis([0 1 0 1 0 0.20]);
    title('at timestep 2/8');

    subplot(1,4,3), surf(X,Y,eEulerSol(:,:,3));
    %axis([0 1 0 1 0 0.20]);
    title('at timestep 3/8');

    subplot(1,4,4), surf(X,Y,eEulerSol(:,:,4));
    %axis([0 1 0 1 0 0.20]);
    title('at timestep 4/8');
