% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5a (COMSOL 3.5.0.608, $Date: 2009/05/11 07:38:49 $)

flclear fem

% COMSOL version
clear vrsn
vrsn.name = 'COMSOL 3.5';
vrsn.ext = 'a';
vrsn.major = 0;
vrsn.build = 608;
vrsn.rcs = '$Name: v35ap $';
vrsn.date = '$Date: 2009/05/11 07:38:49 $';
fem.version = vrsn;

% Geometry
g1=rect2('0.09','0.03','base','corner','pos',{'0','0'},'rot','0');
g2=rect2('0.09','0.03','base','corner','pos',{'0','0.03'},'rot','0');
g3=rect2('0.03','0.09','base','corner','pos',{'0.03','0'},'rot','0');
g4=geomcomp({g2,g3},'ns',{'R1','R2'},'sf','R1+R2','edge','all');
[g5]=geomcopy({g4});
[g7]=geomcopy({g4});
[g8]=geomcopy({g7});
g8=move(g8,[0,0]);
g4=rotate(g4,0.7853981633974483,[0.045,0.045]);
g9=geomcomp({g4,g8},'ns',{'g4','g8'},'sf','g4*g8','edge','all');
g10=circ2('0.015','base','center','pos',{'0.045','0.045'},'rot','0');

% Analyzed geometry
clear s
s.objs={g9,g10};
s.name={'CO3','C1'};
s.tags={'g9','g10'};

fem.draw=struct('s',s);
fem.geom=geomcsg(fem);

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'HeatTransfer';
appl.sshape = 2;
appl.assignsuffix = '_ht';
clear prop
prop.analysis='static';
appl.prop = prop;
clear bnd
bnd.type = {'T','cont'};
bnd.T0 = {273,273.15};
bnd.ind = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2];
appl.bnd = bnd;
clear equ
equ.C = {'mat2_C','mat1_C'};
equ.k = {'mat2_k','mat1_k'};
equ.Q = {0,1e9};
equ.rho = {'mat2_rho','mat1_rho'};
equ.ind = [1,2];
appl.equ = equ;
fem.appl{1} = appl;
fem.frame = {'ref'};
fem.border = 1;
fem.outform = 'general';
clear units;
units.basesystem = 'SI';
fem.units = units;

% Library materials
clear lib
lib.mat{1}.name='Copper';
lib.mat{1}.varname='mat1';
lib.mat{1}.variables.nu='0.35';
lib.mat{1}.variables.alphares='0.0039[1/K]';
lib.mat{1}.variables.E='110e9[Pa]';
lib.mat{1}.variables.mur='1';
lib.mat{1}.variables.sigma='5.998e7[S/m]';
lib.mat{1}.variables.epsilonr='1';
lib.mat{1}.variables.alpha='17e-6[1/K]';
lib.mat{1}.variables.C='385[J/(kg*K)]';
lib.mat{1}.variables.res0='1.72e-8[ohm*m]';
lib.mat{1}.variables.rho='8700[kg/m^3]';
lib.mat{1}.variables.k='400[W/(m*K)]';
lib.mat{1}.variables.T0='298[K]';
lib.mat{2}.name='Aluminum';
lib.mat{2}.varname='mat2';
lib.mat{2}.variables.nu='0.33';
lib.mat{2}.variables.E='70e9[Pa]';
lib.mat{2}.variables.mur='1';
lib.mat{2}.variables.C='900[J/(kg*K)]';
lib.mat{2}.variables.nMurn='-3.5e11[Pa]';
lib.mat{2}.variables.mMurn='-3.3e11[Pa]';
lib.mat{2}.variables.muLame='2.6e10[Pa]';
lib.mat{2}.variables.k='160[W/(m*K)]';
lib.mat{2}.variables.lMurn='-2.5e11[Pa]';
lib.mat{2}.variables.sigma='3.774e7[S/m]';
lib.mat{2}.variables.alpha='23e-6[1/K]';
lib.mat{2}.variables.epsilonr='1';
lib.mat{2}.variables.lambLame='5.1e10[Pa]';
lib.mat{2}.variables.rho='2700[kg/m^3]';
lib.matgroups{1}.name='Resistivity';
lib.matgroups{1}.variables={'alphares','T0','res0'};
lib.matgroups{1}.descr={'Temperature coefficient','Reference temperature','Resistivity at reference temperature'};


fem.lib = lib;

% ODE Settings
clear ode
clear units;
units.basesystem = 'SI';
ode.units = units;
fem.ode=ode;

% Multiphysics
fem=multiphysics(fem);

% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5a (COMSOL 3.5.0.608, $Date: 2009/05/11 07:38:49 $)

% Geometry
g1=fillet(g9,'radii',5.0E-4,'point',[3,5,6,8,9,11,12,14]);

% Analyzed geometry
clear s
s.objs={g10,g1};
s.name={'C1','CO1'};
s.tags={'g10','g1'};

fem.draw=struct('s',s);
fem.geom=geomcsg(fem);

% Initialize mesh
fem.mesh=meshinit(fem, ...
                  'hauto',5);

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'HeatTransfer';
appl.assignsuffix = '_ht';
clear prop
prop.analysis='static';
appl.prop = prop;
clear bnd
bnd.type = {'T','cont'};
bnd.T0 = {273,273.15};
bnd.ind = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,2,2,1,1,1];
appl.bnd = bnd;
clear equ
equ.C = {'mat2_C','mat1_C'};
equ.k = {'mat2_k','mat1_k'};
equ.Q = {0,1e9};
equ.rho = {'mat2_rho','mat1_rho'};
equ.ind = [1,2];
appl.equ = equ;
fem.appl{1} = appl;
fem.frame = {'ref'};
fem.border = 1;
fem.outform = 'general';
clear units;
units.basesystem = 'SI';
fem.units = units;

% Library materials
clear lib
lib.mat{1}.name='Copper';
lib.mat{1}.varname='mat1';
lib.mat{1}.variables.nu='0.35';
lib.mat{1}.variables.alphares='0.0039[1/K]';
lib.mat{1}.variables.E='110e9[Pa]';
lib.mat{1}.variables.mur='1';
lib.mat{1}.variables.sigma='5.998e7[S/m]';
lib.mat{1}.variables.epsilonr='1';
lib.mat{1}.variables.alpha='17e-6[1/K]';
lib.mat{1}.variables.C='385[J/(kg*K)]';
lib.mat{1}.variables.res0='1.72e-8[ohm*m]';
lib.mat{1}.variables.rho='8700[kg/m^3]';
lib.mat{1}.variables.k='400[W/(m*K)]';
lib.mat{1}.variables.T0='298[K]';
lib.mat{2}.name='Aluminum';
lib.mat{2}.varname='mat2';
lib.mat{2}.variables.nu='0.33';
lib.mat{2}.variables.E='70e9[Pa]';
lib.mat{2}.variables.mur='1';
lib.mat{2}.variables.C='900[J/(kg*K)]';
lib.mat{2}.variables.nMurn='-3.5e11[Pa]';
lib.mat{2}.variables.mMurn='-3.3e11[Pa]';
lib.mat{2}.variables.muLame='2.6e10[Pa]';
lib.mat{2}.variables.k='160[W/(m*K)]';
lib.mat{2}.variables.lMurn='-2.5e11[Pa]';
lib.mat{2}.variables.sigma='3.774e7[S/m]';
lib.mat{2}.variables.alpha='23e-6[1/K]';
lib.mat{2}.variables.epsilonr='1';
lib.mat{2}.variables.lambLame='5.1e10[Pa]';
lib.mat{2}.variables.rho='2700[kg/m^3]';
lib.matgroups{1}.name='Resistivity';
lib.matgroups{1}.variables={'alphares','T0','res0'};
lib.matgroups{1}.descr={'Temperature coefficient','Reference temperature','Resistivity at reference temperature'};


fem.lib = lib;

% ODE Settings
clear ode
clear units;
units.basesystem = 'SI';
ode.units = units;
fem.ode=ode;

% Multiphysics
fem=multiphysics(fem);

% Generate GMG mesh cases
fem=meshcaseadd(fem,'mgauto','shape');

% Extend mesh
fem.xmesh=meshextend(fem);

% Solve problem
fem=adaption(fem, ...
             'solcomp',{'T'}, ...
             'outcomp',{'T'}, ...
             'blocksize','auto', ...
             'solver','stationary', ...
             'eigselect',1, ...
             'maxt',10000000, ...
             'ngen',2, ...
             'rmethod','longest', ...
             'resorder','auto', ...
             'eefun','l2', ...
             'l2scale',1, ...
             'l2staborder',2, ...
             'tppar',1.7, ...
             'linsolver','gmg', ...
             'geomnum',1, ...
             'mcase',[0 1]);

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'T','cont','internal','unit','K'}, ...
         'trimap','Rainbow', ...
         'title','Surface: Temperature [K]', ...
         'axis',[-0.012623062902696866,0.10262306461633042,0.005165476165711877,0.08483452554792166]);

% Remove generated GMG mesh cases
fem=meshcasedel(fem,[1]);

% Integrate
I1=postint(fem,'nflux_ht', ...
           'unit','W/m', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,22,23,26,27,28], ...
           'edim',1);

% Integrate
I2=postint(fem,'nflux_ht', ...
           'unit','W/m', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,22,23,26,27,28], ...
           'edim',1);

% Initialize mesh
fem.mesh=meshinit(fem, ...
                  'hauto',5);

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'HeatTransfer';
appl.assignsuffix = '_ht';
clear prop
prop.analysis='static';
appl.prop = prop;
clear bnd
bnd.type = {'T','cont'};
bnd.T0 = {273,273.15};
bnd.ind = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,2,2,1,1,1];
appl.bnd = bnd;
clear equ
equ.C = {'mat2_C','mat1_C'};
equ.k = {'mat2_k','mat1_k'};
equ.Q = {0,1e9};
equ.rho = {'mat2_rho','mat1_rho'};
equ.ind = [1,2];
appl.equ = equ;
fem.appl{1} = appl;
fem.frame = {'ref'};
fem.border = 1;
fem.outform = 'general';
clear units;
units.basesystem = 'SI';
fem.units = units;

% Library materials
clear lib
lib.mat{1}.name='Copper';
lib.mat{1}.varname='mat1';
lib.mat{1}.variables.nu='0.35';
lib.mat{1}.variables.alphares='0.0039[1/K]';
lib.mat{1}.variables.E='110e9[Pa]';
lib.mat{1}.variables.mur='1';
lib.mat{1}.variables.sigma='5.998e7[S/m]';
lib.mat{1}.variables.epsilonr='1';
lib.mat{1}.variables.alpha='17e-6[1/K]';
lib.mat{1}.variables.C='385[J/(kg*K)]';
lib.mat{1}.variables.res0='1.72e-8[ohm*m]';
lib.mat{1}.variables.rho='8700[kg/m^3]';
lib.mat{1}.variables.k='400[W/(m*K)]';
lib.mat{1}.variables.T0='298[K]';
lib.mat{2}.name='Aluminum';
lib.mat{2}.varname='mat2';
lib.mat{2}.variables.nu='0.33';
lib.mat{2}.variables.E='70e9[Pa]';
lib.mat{2}.variables.mur='1';
lib.mat{2}.variables.C='900[J/(kg*K)]';
lib.mat{2}.variables.nMurn='-3.5e11[Pa]';
lib.mat{2}.variables.mMurn='-3.3e11[Pa]';
lib.mat{2}.variables.muLame='2.6e10[Pa]';
lib.mat{2}.variables.k='160[W/(m*K)]';
lib.mat{2}.variables.lMurn='-2.5e11[Pa]';
lib.mat{2}.variables.sigma='3.774e7[S/m]';
lib.mat{2}.variables.alpha='23e-6[1/K]';
lib.mat{2}.variables.epsilonr='1';
lib.mat{2}.variables.lambLame='5.1e10[Pa]';
lib.mat{2}.variables.rho='2700[kg/m^3]';
lib.matgroups{1}.name='Resistivity';
lib.matgroups{1}.variables={'alphares','T0','res0'};
lib.matgroups{1}.descr={'Temperature coefficient','Reference temperature','Resistivity at reference temperature'};


fem.lib = lib;

% ODE Settings
clear ode
clear units;
units.basesystem = 'SI';
ode.units = units;
fem.ode=ode;

% Multiphysics
fem=multiphysics(fem);

% Generate GMG mesh cases
fem=meshcaseadd(fem,'mgauto','shape');

% Extend mesh
fem.xmesh=meshextend(fem);

% Solve problem
fem=adaption(fem, ...
             'solcomp',{'T'}, ...
             'outcomp',{'T'}, ...
             'blocksize','auto', ...
             'solver','stationary', ...
             'eigselect',1, ...
             'maxt',10000000, ...
             'ngen',3, ...
             'rmethod','longest', ...
             'resorder','auto', ...
             'eefun','l2', ...
             'l2scale',1, ...
             'l2staborder',2, ...
             'tppar',1.7, ...
             'linsolver','gmg', ...
             'geomnum',1, ...
             'mcase',[0 1]);

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'T','cont','internal','unit','K'}, ...
         'trimap','Rainbow', ...
         'title','Surface: Temperature [K]', ...
         'axis',[-0.012623062902696866,0.1026230646163304,0.0051654761657118796,0.08483452554792166]);

% Remove generated GMG mesh cases
fem=meshcasedel(fem,[1]);

% Integrate
I3=postint(fem,'nflux_ht', ...
           'unit','W/m', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,22,23,26,27,28], ...
           'edim',1);

% Integrate
I4=postint(fem,'nflux_ht', ...
           'unit','W/m', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,22,23,26,27,28], ...
           'edim',1);

% Initialize mesh
fem.mesh=meshinit(fem, ...
                  'hauto',5);

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'HeatTransfer';
appl.assignsuffix = '_ht';
clear prop
prop.analysis='static';
appl.prop = prop;
clear bnd
bnd.type = {'T','cont'};
bnd.T0 = {273,273.15};
bnd.ind = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,2,2,1,1,1];
appl.bnd = bnd;
clear equ
equ.C = {'mat2_C','mat1_C'};
equ.k = {'mat2_k','mat1_k'};
equ.Q = {0,1e9};
equ.rho = {'mat2_rho','mat1_rho'};
equ.ind = [1,2];
appl.equ = equ;
fem.appl{1} = appl;
fem.frame = {'ref'};
fem.border = 1;
fem.outform = 'general';
clear units;
units.basesystem = 'SI';
fem.units = units;

% Library materials
clear lib
lib.mat{1}.name='Copper';
lib.mat{1}.varname='mat1';
lib.mat{1}.variables.nu='0.35';
lib.mat{1}.variables.alphares='0.0039[1/K]';
lib.mat{1}.variables.E='110e9[Pa]';
lib.mat{1}.variables.mur='1';
lib.mat{1}.variables.sigma='5.998e7[S/m]';
lib.mat{1}.variables.epsilonr='1';
lib.mat{1}.variables.alpha='17e-6[1/K]';
lib.mat{1}.variables.C='385[J/(kg*K)]';
lib.mat{1}.variables.res0='1.72e-8[ohm*m]';
lib.mat{1}.variables.rho='8700[kg/m^3]';
lib.mat{1}.variables.k='400[W/(m*K)]';
lib.mat{1}.variables.T0='298[K]';
lib.mat{2}.name='Aluminum';
lib.mat{2}.varname='mat2';
lib.mat{2}.variables.nu='0.33';
lib.mat{2}.variables.E='70e9[Pa]';
lib.mat{2}.variables.mur='1';
lib.mat{2}.variables.C='900[J/(kg*K)]';
lib.mat{2}.variables.nMurn='-3.5e11[Pa]';
lib.mat{2}.variables.mMurn='-3.3e11[Pa]';
lib.mat{2}.variables.muLame='2.6e10[Pa]';
lib.mat{2}.variables.k='160[W/(m*K)]';
lib.mat{2}.variables.lMurn='-2.5e11[Pa]';
lib.mat{2}.variables.sigma='3.774e7[S/m]';
lib.mat{2}.variables.alpha='23e-6[1/K]';
lib.mat{2}.variables.epsilonr='1';
lib.mat{2}.variables.lambLame='5.1e10[Pa]';
lib.mat{2}.variables.rho='2700[kg/m^3]';
lib.matgroups{1}.name='Resistivity';
lib.matgroups{1}.variables={'alphares','T0','res0'};
lib.matgroups{1}.descr={'Temperature coefficient','Reference temperature','Resistivity at reference temperature'};


fem.lib = lib;

% ODE Settings
clear ode
clear units;
units.basesystem = 'SI';
ode.units = units;
fem.ode=ode;

% Multiphysics
fem=multiphysics(fem);

% Generate GMG mesh cases
fem=meshcaseadd(fem,'mgauto','shape');

% Extend mesh
fem.xmesh=meshextend(fem);

% Solve problem
fem=adaption(fem, ...
             'solcomp',{'T'}, ...
             'outcomp',{'T'}, ...
             'blocksize','auto', ...
             'solver','stationary', ...
             'eigselect',1, ...
             'maxt',10000000, ...
             'ngen',4, ...
             'rmethod','longest', ...
             'resorder','auto', ...
             'eefun','l2', ...
             'l2scale',1, ...
             'l2staborder',2, ...
             'tppar',1.7, ...
             'linsolver','gmg', ...
             'geomnum',1, ...
             'mcase',[0 1]);

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'T','cont','internal','unit','K'}, ...
         'trimap','Rainbow', ...
         'title','Surface: Temperature [K]', ...
         'axis',[-0.012623062902696866,0.1026230646163304,0.0051654761657118796,0.08483452554792166]);

% Remove generated GMG mesh cases
fem=meshcasedel(fem,[1]);

% Integrate
I5=postint(fem,'nflux_ht', ...
           'unit','W/m', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,22,23,26,27,28], ...
           'edim',1);

% Initialize mesh
fem.mesh=meshinit(fem, ...
                  'hauto',5);

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'HeatTransfer';
appl.assignsuffix = '_ht';
clear prop
prop.analysis='static';
appl.prop = prop;
clear bnd
bnd.type = {'T','cont'};
bnd.T0 = {273,273.15};
bnd.ind = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,2,2,1,1,1];
appl.bnd = bnd;
clear equ
equ.C = {'mat2_C','mat1_C'};
equ.k = {'mat2_k','mat1_k'};
equ.Q = {0,1e9};
equ.rho = {'mat2_rho','mat1_rho'};
equ.ind = [1,2];
appl.equ = equ;
fem.appl{1} = appl;
fem.frame = {'ref'};
fem.border = 1;
fem.outform = 'general';
clear units;
units.basesystem = 'SI';
fem.units = units;

% Library materials
clear lib
lib.mat{1}.name='Copper';
lib.mat{1}.varname='mat1';
lib.mat{1}.variables.nu='0.35';
lib.mat{1}.variables.alphares='0.0039[1/K]';
lib.mat{1}.variables.E='110e9[Pa]';
lib.mat{1}.variables.mur='1';
lib.mat{1}.variables.sigma='5.998e7[S/m]';
lib.mat{1}.variables.epsilonr='1';
lib.mat{1}.variables.alpha='17e-6[1/K]';
lib.mat{1}.variables.C='385[J/(kg*K)]';
lib.mat{1}.variables.res0='1.72e-8[ohm*m]';
lib.mat{1}.variables.rho='8700[kg/m^3]';
lib.mat{1}.variables.k='400[W/(m*K)]';
lib.mat{1}.variables.T0='298[K]';
lib.mat{2}.name='Aluminum';
lib.mat{2}.varname='mat2';
lib.mat{2}.variables.nu='0.33';
lib.mat{2}.variables.E='70e9[Pa]';
lib.mat{2}.variables.mur='1';
lib.mat{2}.variables.C='900[J/(kg*K)]';
lib.mat{2}.variables.nMurn='-3.5e11[Pa]';
lib.mat{2}.variables.mMurn='-3.3e11[Pa]';
lib.mat{2}.variables.muLame='2.6e10[Pa]';
lib.mat{2}.variables.k='160[W/(m*K)]';
lib.mat{2}.variables.lMurn='-2.5e11[Pa]';
lib.mat{2}.variables.sigma='3.774e7[S/m]';
lib.mat{2}.variables.alpha='23e-6[1/K]';
lib.mat{2}.variables.epsilonr='1';
lib.mat{2}.variables.lambLame='5.1e10[Pa]';
lib.mat{2}.variables.rho='2700[kg/m^3]';
lib.matgroups{1}.name='Resistivity';
lib.matgroups{1}.variables={'alphares','T0','res0'};
lib.matgroups{1}.descr={'Temperature coefficient','Reference temperature','Resistivity at reference temperature'};


fem.lib = lib;

% ODE Settings
clear ode
clear units;
units.basesystem = 'SI';
ode.units = units;
fem.ode=ode;

% Multiphysics
fem=multiphysics(fem);

% Generate GMG mesh cases
fem=meshcaseadd(fem,'mgauto','shape');

% Extend mesh
fem.xmesh=meshextend(fem);

% Solve problem
fem=adaption(fem, ...
             'solcomp',{'T'}, ...
             'outcomp',{'T'}, ...
             'blocksize','auto', ...
             'solver','stationary', ...
             'eigselect',1, ...
             'maxt',10000000, ...
             'ngen',5, ...
             'rmethod','longest', ...
             'resorder','auto', ...
             'eefun','l2', ...
             'l2scale',1, ...
             'l2staborder',2, ...
             'tppar',1.7, ...
             'linsolver','gmg', ...
             'geomnum',1, ...
             'mcase',[0 1]);

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'T','cont','internal','unit','K'}, ...
         'trimap','Rainbow', ...
         'title','Surface: Temperature [K]', ...
         'axis',[-0.012623062902696866,0.1026230646163304,0.0051654761657118796,0.08483452554792166]);

% Remove generated GMG mesh cases
fem=meshcasedel(fem,[1]);

% Integrate
I6=postint(fem,'nflux_ht', ...
           'unit','W/m', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,22,23,26,27,28], ...
           'edim',1);

% Initialize mesh
fem.mesh=meshinit(fem, ...
                  'hauto',5);

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'HeatTransfer';
appl.assignsuffix = '_ht';
clear prop
prop.analysis='static';
appl.prop = prop;
clear bnd
bnd.type = {'T','cont'};
bnd.T0 = {273,273.15};
bnd.ind = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,2,2,1,1,1];
appl.bnd = bnd;
clear equ
equ.C = {'mat2_C','mat1_C'};
equ.k = {'mat2_k','mat1_k'};
equ.Q = {0,1e9};
equ.rho = {'mat2_rho','mat1_rho'};
equ.ind = [1,2];
appl.equ = equ;
fem.appl{1} = appl;
fem.frame = {'ref'};
fem.border = 1;
fem.outform = 'general';
clear units;
units.basesystem = 'SI';
fem.units = units;

% Library materials
clear lib
lib.mat{1}.name='Copper';
lib.mat{1}.varname='mat1';
lib.mat{1}.variables.nu='0.35';
lib.mat{1}.variables.alphares='0.0039[1/K]';
lib.mat{1}.variables.E='110e9[Pa]';
lib.mat{1}.variables.mur='1';
lib.mat{1}.variables.sigma='5.998e7[S/m]';
lib.mat{1}.variables.epsilonr='1';
lib.mat{1}.variables.alpha='17e-6[1/K]';
lib.mat{1}.variables.C='385[J/(kg*K)]';
lib.mat{1}.variables.res0='1.72e-8[ohm*m]';
lib.mat{1}.variables.rho='8700[kg/m^3]';
lib.mat{1}.variables.k='400[W/(m*K)]';
lib.mat{1}.variables.T0='298[K]';
lib.mat{2}.name='Aluminum';
lib.mat{2}.varname='mat2';
lib.mat{2}.variables.nu='0.33';
lib.mat{2}.variables.E='70e9[Pa]';
lib.mat{2}.variables.mur='1';
lib.mat{2}.variables.C='900[J/(kg*K)]';
lib.mat{2}.variables.nMurn='-3.5e11[Pa]';
lib.mat{2}.variables.mMurn='-3.3e11[Pa]';
lib.mat{2}.variables.muLame='2.6e10[Pa]';
lib.mat{2}.variables.k='160[W/(m*K)]';
lib.mat{2}.variables.lMurn='-2.5e11[Pa]';
lib.mat{2}.variables.sigma='3.774e7[S/m]';
lib.mat{2}.variables.alpha='23e-6[1/K]';
lib.mat{2}.variables.epsilonr='1';
lib.mat{2}.variables.lambLame='5.1e10[Pa]';
lib.mat{2}.variables.rho='2700[kg/m^3]';
lib.matgroups{1}.name='Resistivity';
lib.matgroups{1}.variables={'alphares','T0','res0'};
lib.matgroups{1}.descr={'Temperature coefficient','Reference temperature','Resistivity at reference temperature'};


fem.lib = lib;

% ODE Settings
clear ode
clear units;
units.basesystem = 'SI';
ode.units = units;
fem.ode=ode;

% Multiphysics
fem=multiphysics(fem);

% Generate GMG mesh cases
fem=meshcaseadd(fem,'mgauto','shape');

% Extend mesh
fem.xmesh=meshextend(fem);

% Solve problem
fem=adaption(fem, ...
             'solcomp',{'T'}, ...
             'outcomp',{'T'}, ...
             'blocksize','auto', ...
             'solver','stationary', ...
             'eigselect',1, ...
             'maxt',10000000, ...
             'ngen',6, ...
             'rmethod','longest', ...
             'resorder','auto', ...
             'eefun','l2', ...
             'l2scale',1, ...
             'l2staborder',2, ...
             'tppar',1.7, ...
             'linsolver','gmg', ...
             'geomnum',1, ...
             'mcase',[0 1]);

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'T','cont','internal','unit','K'}, ...
         'trimap','Rainbow', ...
         'title','Surface: Temperature [K]', ...
         'axis',[-0.012623062902696866,0.1026230646163304,0.0051654761657118796,0.08483452554792166]);

% Remove generated GMG mesh cases
fem=meshcasedel(fem,[1]);

% Integrate
I7=postint(fem,'nflux_ht', ...
           'unit','W/m', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,22,23,26,27,28], ...
           'edim',1);

return; %%%%%%%%%%% END OF HISTORY %%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
% M-file below is used when resetting the model.         %
%                                                        %
%%%%%%%%%%%%%% START OF RESET HISTORY %%%%%%%%%%%%%%%%%%%%


% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5a (COMSOL 3.5.0.608, $Date: 2009/05/11 07:38:49 $)

flclear fem

% COMSOL version
clear vrsn
vrsn.name = 'COMSOL 3.5';
vrsn.ext = 'a';
vrsn.major = 0;
vrsn.build = 608;
vrsn.rcs = '$Name: v35ap $';
vrsn.date = '$Date: 2009/05/11 07:38:49 $';
fem.version = vrsn;

% Geometry
g1=rect2('0.09','0.03','base','corner','pos',{'0','0'},'rot','0');
g2=rect2('0.09','0.03','base','corner','pos',{'0','0.03'},'rot','0');
g3=rect2('0.03','0.09','base','corner','pos',{'0.03','0'},'rot','0');
g4=geomcomp({g2,g3},'ns',{'R1','R2'},'sf','R1+R2','edge','all');
[g5]=geomcopy({g4});
[g7]=geomcopy({g4});
[g8]=geomcopy({g7});
g8=move(g8,[0,0]);
g4=rotate(g4,0.7853981633974483,[0.045,0.045]);
g9=geomcomp({g4,g8},'ns',{'g4','g8'},'sf','g4*g8','edge','all');
g10=circ2('0.015','base','center','pos',{'0.045','0.045'},'rot','0');

% Analyzed geometry
clear s
s.objs={g9,g10};
s.name={'CO3','C1'};
s.tags={'g9','g10'};

fem.draw=struct('s',s);
fem.geom=geomcsg(fem);
% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5a (COMSOL 3.5.0.608, $Date: 2009/05/11 07:38:49 $)

% Geometry
g1=fillet(g9,'radii',5.0E-4,'point',[3,5,6,8,9,11,12,14]);

% Analyzed geometry
clear s
s.objs={g10,g1};
s.name={'C1','CO1'};
s.tags={'g10','g1'};

fem.draw=struct('s',s);
fem.geom=geomcsg(fem);