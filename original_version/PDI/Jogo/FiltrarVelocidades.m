%% Estima e filtra as velocidades dos objetos de acordo com o tempo gasto na iteração

% Finaliza a Contagem de Tempo
Tempo.ToVeloc = toc(Tempo.TiVeloc);

% Inicia a Contagem de Tempo
Tempo.TiVeloc = tic;

% Determina as velocidades lineares observadas dos Robôs, dos Adversários e da Bola
Filtro.Robo1.dXobs(1:2) = ( Filtro.Robo1.Xpred(1:2) - Postura.Robo1(1:2) ) / Tempo.ToVeloc;
Filtro.Robo2.dXobs(1:2) = ( Filtro.Robo2.Xpred(1:2) - Postura.Robo2(1:2) ) / Tempo.ToVeloc;
Filtro.Robo3.dXobs(1:2) = ( Filtro.Robo3.Xpred(1:2) - Postura.Robo3(1:2) ) / Tempo.ToVeloc;
Filtro.Adv1.dXobs(1:2)  = ( Filtro.Adv1.Xpred(1:2)  - Postura.Adv1(1:2)  ) / Tempo.ToVeloc;
Filtro.Adv2.dXobs(1:2)  = ( Filtro.Adv2.Xpred(1:2)  - Postura.Adv2(1:2)  ) / Tempo.ToVeloc;
Filtro.Adv3.dXobs(1:2)  = ( Filtro.Adv3.Xpred(1:2)  - Postura.Adv3(1:2)  ) / Tempo.ToVeloc;
Filtro.Bola.dXobs(1:2)  = ( Filtro.Bola.Xpred(1:2)  - Postura.Bola(1:2)  ) / Tempo.ToVeloc;

% Determina as velocidades angulares observadas dos Robôs, dos Adversários e da Bola
Filtro.Robo1.dXobs(3) = ( Janela.OrientRobo1-Postura.Robo1(3) + (abs(Janela.OrientRobo1-Postura.Robo1(3))>180)*...
                          sign(Postura.Robo1(3))*((Postura.Robo1(3)*Janela.OrientRobo1)<0)*360 ) / Tempo.ToVeloc;
Filtro.Robo2.dXobs(3) = ( Janela.OrientRobo2-Postura.Robo2(3) + (abs(Janela.OrientRobo2-Postura.Robo2(3))>180)*...
                          sign(Postura.Robo2(3))*((Postura.Robo2(3)*Janela.OrientRobo2)<0)*360 ) / Tempo.ToVeloc;
Filtro.Robo3.dXobs(3) = ( Janela.OrientRobo3-Postura.Robo3(3) + (abs(Janela.OrientRobo3-Postura.Robo3(3))>180)*...
                          sign(Postura.Robo3(3))*((Postura.Robo3(3)*Janela.OrientRobo3)<0)*360 ) / Tempo.ToVeloc;
Filtro.Adv1.dXobs(3)  = ( Janela.OrientAdv1 -Postura.Adv1(3)  + (abs(Janela.OrientAdv1 -Postura.Adv1(3)) >180)*...
                          sign(Postura.Adv1(3)) *((Postura.Adv1(3) *Janela.OrientAdv1) <0)*360 ) / Tempo.ToVeloc;
Filtro.Adv2.dXobs(3)  = ( Janela.OrientAdv2 -Postura.Adv2(3)  + (abs(Janela.OrientAdv2 -Postura.Adv2(3)) >180)*...
                          sign(Postura.Adv2(3)) *((Postura.Adv2(3) *Janela.OrientAdv2) <0)*360 ) / Tempo.ToVeloc;
Filtro.Adv3.dXobs(3)  = ( Janela.OrientAdv3 -Postura.Adv3(3)  + (abs(Janela.OrientAdv3 -Postura.Adv3(3)) >180)*...
                          sign(Postura.Adv3(3)) *((Postura.Adv3(3) *Janela.OrientAdv3) <0)*360 ) / Tempo.ToVeloc;
Filtro.Bola.dXobs(3)  = ( Janela.OrientBola -Postura.Bola(3)  + (abs(Janela.OrientBola -Postura.Bola(3)) >180)*...
                          sign(Postura.Bola(3)) *((Postura.Bola(3) *Janela.OrientBola) <0)*360 ) / Tempo.ToVeloc;

% Realiza a filtragem das velocidades
% [Filtro.Robo1.dXpred,Filtro.Robo1.dMSE] = FiltroKalman(Filtro.Robo1.dXobs,Filtro.Robo1.dXpred,Filtro.Robo1.dMSE,Filtro.VARW,Filtro.VARN);
% [Filtro.Robo2.dXpred,Filtro.Robo2.dMSE] = FiltroKalman(Filtro.Robo2.dXobs,Filtro.Robo2.dXpred,Filtro.Robo2.dMSE,Filtro.VARW,Filtro.VARN);
% [Filtro.Robo3.dXpred,Filtro.Robo3.dMSE] = FiltroKalman(Filtro.Robo3.dXobs,Filtro.Robo3.dXpred,Filtro.Robo3.dMSE,Filtro.VARW,Filtro.VARN);
% [Filtro.Adv1.dXpred, Filtro.Adv1.dMSE]  = FiltroKalman(Filtro.Adv1.dXobs, Filtro.Adv1.dXpred, Filtro.Adv1.dMSE, Filtro.VARW,Filtro.VARN);
% [Filtro.Adv2.dXpred, Filtro.Adv2.dMSE]  = FiltroKalman(Filtro.Adv2.dXobs, Filtro.Adv2.dXpred, Filtro.Adv2.dMSE, Filtro.VARW,Filtro.VARN);
% [Filtro.Adv3.dXpred, Filtro.Adv3.dMSE]  = FiltroKalman(Filtro.Adv3.dXobs, Filtro.Adv3.dXpred, Filtro.Adv3.dMSE, Filtro.VARW,Filtro.VARN);
% [Filtro.Bola.dXpred, Filtro.Bola.dMSE]  = FiltroKalman(Filtro.Bola.dXobs, Filtro.Bola.dXpred, Filtro.Bola.dMSE, Filtro.VARW,Filtro.VARN);

% Desconsidera a filtragem das velocidades
Filtro.Robo1.dXpred = Filtro.Robo1.dXobs;
Filtro.Robo2.dXpred = Filtro.Robo2.dXobs;
Filtro.Robo3.dXpred = Filtro.Robo3.dXobs;
Filtro.Adv1.dXpred  = Filtro.Adv1.dXobs;
Filtro.Adv2.dXpred  = Filtro.Adv2.dXobs;
Filtro.Adv3.dXpred  = Filtro.Adv3.dXobs;
Filtro.Bola.dXpred  = Filtro.Bola.dXobs;