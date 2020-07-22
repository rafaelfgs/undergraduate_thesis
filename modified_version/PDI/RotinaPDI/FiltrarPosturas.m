%% Determina e filtra as posturas encontradas no janelamento

% Determina a postura anterior dos objetos
Filtro.Robo1.Xant = Filtro.Robo1.Xpred;
Filtro.Robo2.Xant = Filtro.Robo2.Xpred;
Filtro.Robo3.Xant = Filtro.Robo3.Xpred;
Filtro.Adv1.Xant  = Filtro.Adv1.Xpred;
Filtro.Adv2.Xant  = Filtro.Adv2.Xpred;
Filtro.Adv3.Xant  = Filtro.Adv3.Xpred;
Filtro.Bola.Xant  = Filtro.Bola.Xpred;

% Determina o sentido de movimento dos Adversários e da Bola
Janela.OrientAdv1 = atan2d(Janela.Adv1(2)-Filtro.Adv1.Xant(2),Janela.Adv1(1)-Filtro.Adv1.Xant(1));
Janela.OrientAdv2 = atan2d(Janela.Adv2(2)-Filtro.Adv2.Xant(2),Janela.Adv2(1)-Filtro.Adv2.Xant(1));
Janela.OrientAdv3 = atan2d(Janela.Adv3(2)-Filtro.Adv3.Xant(2),Janela.Adv3(1)-Filtro.Adv3.Xant(1));
Janela.OrientBola = atan2d(Janela.Bola(2)-Filtro.Bola.Xant(2),Janela.Bola(1)-Filtro.Bola.Xant(1));

% Determina a posição e a postura observada dos Robôs, dos Adversários e da Bola
Filtro.Robo1.Xobs = [ Janela.Pos1'; Janela.OrientRobo1 ];
Filtro.Robo2.Xobs = [ Janela.Pos2'; Janela.OrientRobo2 ];
Filtro.Robo3.Xobs = [ Janela.Pos3'; Janela.OrientRobo3 ];
Filtro.Adv1.Xobs  = [ Janela.Adv1'; Janela.OrientAdv1 ];
Filtro.Adv2.Xobs  = [ Janela.Adv2'; Janela.OrientAdv2 ];
Filtro.Adv3.Xobs  = [ Janela.Adv3'; Janela.OrientAdv3 ];
Filtro.Bola.Xobs  = [ Janela.Bola'; Janela.OrientBola ];

% Realiza a filtragem das posturas observadas
[Filtro.Robo1.Xpred,Filtro.Robo1.MSE] = FiltroKalman(Filtro.Robo1.Xobs,Filtro.Robo1.Xpred,Filtro.Robo1.MSE,Filtro.VARW,Filtro.VARN);
[Filtro.Robo2.Xpred,Filtro.Robo2.MSE] = FiltroKalman(Filtro.Robo2.Xobs,Filtro.Robo2.Xpred,Filtro.Robo2.MSE,Filtro.VARW,Filtro.VARN);
[Filtro.Robo3.Xpred,Filtro.Robo3.MSE] = FiltroKalman(Filtro.Robo3.Xobs,Filtro.Robo3.Xpred,Filtro.Robo3.MSE,Filtro.VARW,Filtro.VARN);
[Filtro.Adv1.Xpred, Filtro.Adv1.MSE]  = FiltroKalman(Filtro.Adv1.Xobs, Filtro.Adv1.Xpred, Filtro.Adv1.MSE, Filtro.VARW,Filtro.VARN);
[Filtro.Adv2.Xpred, Filtro.Adv2.MSE]  = FiltroKalman(Filtro.Adv2.Xobs, Filtro.Adv2.Xpred, Filtro.Adv2.MSE, Filtro.VARW,Filtro.VARN);
[Filtro.Adv3.Xpred, Filtro.Adv3.MSE]  = FiltroKalman(Filtro.Adv3.Xobs, Filtro.Adv3.Xpred, Filtro.Adv3.MSE, Filtro.VARW,Filtro.VARN);
[Filtro.Bola.Xpred, Filtro.Bola.MSE]  = FiltroKalman(Filtro.Bola.Xobs, Filtro.Bola.Xpred, Filtro.Bola.MSE, Filtro.VARW,Filtro.VARN);