%% Determina e filtra as posturas encontradas no janelamento

% Determina o sentido de movimento dos Advers�rios e da Bola
Janela.OrientAdv1 = atan2d(Janela.Adv1(2)-Postura.Adv1(2),Janela.Adv1(1)-Postura.Adv1(1));
Janela.OrientAdv2 = atan2d(Janela.Adv2(2)-Postura.Adv2(2),Janela.Adv2(1)-Postura.Adv2(1));
Janela.OrientAdv3 = atan2d(Janela.Adv3(2)-Postura.Adv3(2),Janela.Adv3(1)-Postura.Adv3(1));
Janela.OrientBola = atan2d(Janela.Bola(2)-Postura.Bola(2),Janela.Bola(1)-Postura.Bola(1));

% Determina a posi��o e a postura observada dos Rob�s, dos Advers�rios e da Bola
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


% Distancia.Variacao1 = rssq(((Distancia.Anterior1 - Filtro.Robo1.Xpred(1:2))'));
% 
% Distancia.Variacao2 = rssq(((Distancia.Anterior2 - Filtro.Robo2.Xpred(1:2))'));
% 
% Distancia.Variacao3 = rssq(((Distancia.Anterior3 - Filtro.Robo3.Xpred(1:2))'));
% 
% % disp(Distancia.Variacao3)
% % pause
% 
% Distancia.Anterior1 = Filtro.Robo1.Xpred(1:2);
% Distancia.Anterior2 = Filtro.Robo2.Xpred(1:2);
% Distancia.Anterior3 = Filtro.Robo3.Xpred(1:2);