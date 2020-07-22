%% Estima e Filtra as Velocidades dos Objetos de Acordo com o Tempo Gasto na Iteração

% Finaliza a contagem de tempo da Velocidade
Tempo.ToVeloc = toc(Tempo.TiVeloc);

% Reinicia a contagem de tempo da Velocidade
Tempo.TiVeloc = tic;

% Determina as velocidades lineares observadas dos Robôs, dos Adversários e da Bola
Filtro.Robo1.dXobs(1:2) = ( Filtro.Robo1.Xpred(1:2) - Filtro.Robo1.Xant(1:2) ) / Tempo.ToVeloc;
Filtro.Robo2.dXobs(1:2) = ( Filtro.Robo2.Xpred(1:2) - Filtro.Robo2.Xant(1:2) ) / Tempo.ToVeloc;
Filtro.Robo3.dXobs(1:2) = ( Filtro.Robo3.Xpred(1:2) - Filtro.Robo3.Xant(1:2) ) / Tempo.ToVeloc;
Filtro.Adv1.dXobs(1:2)  = ( Filtro.Adv1.Xpred(1:2)  - Filtro.Adv1.Xant(1:2)  ) / Tempo.ToVeloc;
Filtro.Adv2.dXobs(1:2)  = ( Filtro.Adv2.Xpred(1:2)  - Filtro.Adv2.Xant(1:2)  ) / Tempo.ToVeloc;
Filtro.Adv3.dXobs(1:2)  = ( Filtro.Adv3.Xpred(1:2)  - Filtro.Adv3.Xant(1:2)  ) / Tempo.ToVeloc;
Filtro.Bola.dXobs(1:2)  = ( Filtro.Bola.Xpred(1:2)  - Filtro.Bola.Xant(1:2)  ) / Tempo.ToVeloc;

% Determina as velocidades angulares observadas dos Robôs, dos Adversários e da Bola
Filtro.Robo1.dXobs(3) = ( Janela.OrientRobo1-Filtro.Robo1.Xant(3) + (abs(Janela.OrientRobo1-Filtro.Robo1.Xant(3))>180)*...
                          sign(Filtro.Robo1.Xant(3))*((Filtro.Robo1.Xant(3)*Janela.OrientRobo1)<0)*360 ) / Tempo.ToVeloc;
Filtro.Robo2.dXobs(3) = ( Janela.OrientRobo2-Filtro.Robo2.Xant(3) + (abs(Janela.OrientRobo2-Filtro.Robo2.Xant(3))>180)*...
                          sign(Filtro.Robo2.Xant(3))*((Filtro.Robo2.Xant(3)*Janela.OrientRobo2)<0)*360 ) / Tempo.ToVeloc;
Filtro.Robo3.dXobs(3) = ( Janela.OrientRobo3-Filtro.Robo3.Xant(3) + (abs(Janela.OrientRobo3-Filtro.Robo3.Xant(3))>180)*...
                          sign(Filtro.Robo3.Xant(3))*((Filtro.Robo3.Xant(3)*Janela.OrientRobo3)<0)*360 ) / Tempo.ToVeloc;
Filtro.Adv1.dXobs(3)  = ( Janela.OrientAdv1 -Filtro.Adv1.Xant(3)  + (abs(Janela.OrientAdv1 -Filtro.Adv1.Xant(3)) >180)*...
                          sign(Filtro.Adv1.Xant(3)) *((Filtro.Adv1.Xant(3) *Janela.OrientAdv1) <0)*360 ) / Tempo.ToVeloc;
Filtro.Adv2.dXobs(3)  = ( Janela.OrientAdv2 -Filtro.Adv2.Xant(3)  + (abs(Janela.OrientAdv2 -Filtro.Adv2.Xant(3)) >180)*...
                          sign(Filtro.Adv2.Xant(3)) *((Filtro.Adv2.Xant(3) *Janela.OrientAdv2) <0)*360 ) / Tempo.ToVeloc;
Filtro.Adv3.dXobs(3)  = ( Janela.OrientAdv3 -Filtro.Adv3.Xant(3)  + (abs(Janela.OrientAdv3 -Filtro.Adv3.Xant(3)) >180)*...
                          sign(Filtro.Adv3.Xant(3)) *((Filtro.Adv3.Xant(3) *Janela.OrientAdv3) <0)*360 ) / Tempo.ToVeloc;
Filtro.Bola.dXobs(3)  = ( Janela.OrientBola -Filtro.Bola.Xant(3)  + (abs(Janela.OrientBola -Filtro.Bola.Xant(3)) >180)*...
                          sign(Filtro.Bola.Xant(3)) *((Filtro.Bola.Xant(3) *Janela.OrientBola) <0)*360 ) / Tempo.ToVeloc;

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