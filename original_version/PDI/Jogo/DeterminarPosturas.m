%% Determina o centróide correto e a Orientação dos nossos Robôs

% Centróides dos Robôs 1
Robos.Pos1 = [ ( 15.5*Robos.CorRobo1(:,3) + 7.5*Robos.CorRobo1(:,1) ) / 23 ...
               ( 15.5*Robos.CorRobo1(:,4) + 7.5*Robos.CorRobo1(:,2) ) / 23 ];

% Orientações do Robô 1 (-180°~180°)
Robos.Orient1 = atan2d( Robos.CorRobo1(:,2)-Robos.CorRobo1(:,4), ...
                        Robos.CorRobo1(:,1)-Robos.CorRobo1(:,3) ) + 45;
Robos.Orient1(Robos.Orient1>180) = Robos.Orient1(Robos.Orient1>180) - 360;

% Centróides dos Robôs 2
Robos.Pos2 = [ ( 15.5*Robos.CorRobo2(:,3) + 7.5*Robos.CorRobo2(:,1) ) / 23 ...
               ( 15.5*Robos.CorRobo2(:,4) + 7.5*Robos.CorRobo2(:,2) ) / 23 ];

% Orientações dos Robôs 2 (-180°~180°)
Robos.Orient2 = atan2d( Robos.CorRobo2(:,2)-Robos.CorRobo2(:,4), ...
                        Robos.CorRobo2(:,1)-Robos.CorRobo2(:,3) ) + 45;
Robos.Orient2(Robos.Orient2>180) = Robos.Orient2(Robos.Orient2>180) - 360;

% Centróides dos Robôs 3
Robos.Pos3 = [ ( 15.5*Robos.CorRobo3(:,3) + 7.5*Robos.CorRobo3(:,1) ) / 23 ...
               ( 15.5*Robos.CorRobo3(:,4) + 7.5*Robos.CorRobo3(:,2) ) / 23 ];

% Orientações dos Robôs 3 (-180°~180°)
Robos.Orient3 = atan2d( Robos.CorRobo3(:,2)-Robos.CorRobo3(:,4), ...
                        Robos.CorRobo3(:,1)-Robos.CorRobo3(:,3) ) + 45;
Robos.Orient3(Robos.Orient3>180) = Robos.Orient3(Robos.Orient3>180) - 360;