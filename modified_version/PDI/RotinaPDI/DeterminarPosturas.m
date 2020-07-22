%% Determina o centr�ide correto e a Orienta��o dos nossos Rob�s

% Centr�ides dos Rob�s 1
Possiveis.Pos1 = [ ( 15.5*Possiveis.CorRobo1(:,3) + 7.5*Possiveis.CorRobo1(:,1) ) / 23 ...
                   ( 15.5*Possiveis.CorRobo1(:,4) + 7.5*Possiveis.CorRobo1(:,2) ) / 23 ];

% Orienta��es do Rob� 1 (-180�~180�)
Possiveis.Orient1 = atan2d( Possiveis.CorRobo1(:,2)-Possiveis.CorRobo1(:,4), ...
                            Possiveis.CorRobo1(:,1)-Possiveis.CorRobo1(:,3) ) + 45;
Possiveis.Orient1(Possiveis.Orient1>180) = Possiveis.Orient1(Possiveis.Orient1>180) - 360;

% Centr�ides dos Rob�s 2
Possiveis.Pos2 = [ ( 15.5*Possiveis.CorRobo2(:,3) + 7.5*Possiveis.CorRobo2(:,1) ) / 23 ...
                   ( 15.5*Possiveis.CorRobo2(:,4) + 7.5*Possiveis.CorRobo2(:,2) ) / 23 ];

% Orienta��es dos Rob�s 2 (-180�~180�)
Possiveis.Orient2 = atan2d( Possiveis.CorRobo2(:,2)-Possiveis.CorRobo2(:,4), ...
                            Possiveis.CorRobo2(:,1)-Possiveis.CorRobo2(:,3) ) + 45;
Possiveis.Orient2(Possiveis.Orient2>180) = Possiveis.Orient2(Possiveis.Orient2>180) - 360;

% Centr�ides dos Rob�s 3
Possiveis.Pos3 = [ ( 15.5*Possiveis.CorRobo3(:,3) + 7.5*Possiveis.CorRobo3(:,1) ) / 23 ...
                   ( 15.5*Possiveis.CorRobo3(:,4) + 7.5*Possiveis.CorRobo3(:,2) ) / 23 ];

% Orienta��es dos Rob�s 3 (-180�~180�)
Possiveis.Orient3 = atan2d( Possiveis.CorRobo3(:,2)-Possiveis.CorRobo3(:,4), ...
                            Possiveis.CorRobo3(:,1)-Possiveis.CorRobo3(:,3) ) + 45;
Possiveis.Orient3(Possiveis.Orient3>180) = Possiveis.Orient3(Possiveis.Orient3>180) - 360;