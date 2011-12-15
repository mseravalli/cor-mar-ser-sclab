clear;

disp('IMPLICIT METHOD');

tEnd=4/8;

maxValues = [];

%loop for the dimensions of the grid
for k = 2 : 5

    Nx = (2.^k) - 1;
    Ny = (2.^k) - 1;

    X = linspace(0, 1, Nx);
    Y = linspace(0, 1, Ny);

    A=systemMatrix(Nx, Ny);
    T0=ones(Nx*Ny,1);
    
    dt=1/64;

    iEulerSol = IEuler(T0, dt, tEnd, Nx, Ny);
       
    %checks stability of the solution 
    if(abs(max(max(iEulerSol(:,:,4)))) > 1 || isnan(max(max(iEulerSol(:,:,4)))))       
        maxValues(k-1, 1) = false;
    else
        maxValues(k-1, 1) = true;
    end

    dimDescr = strcat('dimension = ', num2str(Nx), '^2');
        
    subplot(4,4,1 + 4*(k-2)), surf(X,Y,iEulerSol(:,:,1));
    title(strcat(dimDescr, ' - time 1/8'));

    subplot(4,4,2 + 4*(k-2)), surf(X,Y,iEulerSol(:,:,2));
    title(strcat(dimDescr, ' - time 2/8'));

    subplot(4,4,3 + 4*(k-2)), surf(X,Y,iEulerSol(:,:,3));
    title(strcat(dimDescr, ' - time 3/8'));

    subplot(4,4,4 + 4*(k-2)), surf(X,Y,iEulerSol(:,:,4));
    title(strcat(dimDescr, ' - time 4/8'));
end        
        
disp('Explanation: in the following table the stable solutionsi for the IMPLICIT method are represented as 1, and the non stables as 0');
disp('Rows represent Nx=Ny values ranging from 3 to 31');
disp('The column represents dt equals to 1/64');
disp(maxValues);

