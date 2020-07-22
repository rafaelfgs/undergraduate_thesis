%% Pré aloca as variáveis do janelamento e do filtro

% Posições iniciais dos centórides e das orientações dos Robôs e da Bola para o Janelamento
Janela.Pos1 = [999 999];
Janela.Pos2 = [999 999];
Janela.Pos3 = [999 999];
Janela.OrientRobo1 = 0;
Janela.OrientRobo2 = 0;
Janela.OrientRobo3 = 0;
Janela.Adv1 = [999 999];
Janela.Adv2 = [999 999];
Janela.Adv3 = [999 999];
Janela.Bola = [999 999];

% Variância do sistema de medição de velocidade da variância da estimação da velocidade
% Representa o quanto o objeto pode alterar sua velocidade em um período de amostragem
Filtro.VARW = 1 * eye(3);
Filtro.VARN = 1 * eye(3);

% Erro médio quadrático inicial da velocidade em qualquer direção
Filtro.Robo1.MSE  = diag([rand(1);rand(1);rand(1)]);
Filtro.Robo1.dMSE = diag([rand(1);rand(1);rand(1)]);
Filtro.Robo2.MSE  = diag([rand(1);rand(1);rand(1)]);
Filtro.Robo2.dMSE = diag([rand(1);rand(1);rand(1)]);
Filtro.Robo3.MSE  = diag([rand(1);rand(1);rand(1)]);
Filtro.Robo3.dMSE = diag([rand(1);rand(1);rand(1)]);
Filtro.Adv1.MSE   = diag([rand(1);rand(1);rand(1)]);
Filtro.Adv1.dMSE  = diag([rand(1);rand(1);rand(1)]);
Filtro.Adv2.MSE   = diag([rand(1);rand(1);rand(1)]);
Filtro.Adv2.dMSE  = diag([rand(1);rand(1);rand(1)]);
Filtro.Adv3.MSE   = diag([rand(1);rand(1);rand(1)]);
Filtro.Adv3.dMSE  = diag([rand(1);rand(1);rand(1)]);
Filtro.Bola.MSE   = diag([rand(1);rand(1);rand(1)]);
Filtro.Bola.dMSE  = diag([rand(1);rand(1);rand(1)]);

% Valor predito da posição e da velocidade
Filtro.Robo1.Xpred  = [0;0;0];
Filtro.Robo1.dXpred = [0;0;0];
Filtro.Robo2.Xpred  = [0;0;0];
Filtro.Robo2.dXpred = [0;0;0];
Filtro.Robo3.Xpred  = [0;0;0];
Filtro.Robo3.dXpred = [0;0;0];
Filtro.Adv1.Xpred   = [0;0;0];
Filtro.Adv1.dXpred  = [0;0;0];
Filtro.Adv2.Xpred   = [0;0;0];
Filtro.Adv2.dXpred  = [0;0;0];
Filtro.Adv3.Xpred   = [0;0;0];
Filtro.Adv3.dXpred  = [0;0;0];
Filtro.Bola.Xpred   = [0;0;0];
Filtro.Bola.dXpred  = [0;0;0];

% Valor observado da posição e da velocidade
Filtro.Robo1.Xobs  = [0;0;0];
Filtro.Robo1.dXobs = [0;0;0];
Filtro.Robo2.Xobs  = [0;0;0];
Filtro.Robo2.dXobs = [0;0;0];
Filtro.Robo3.Xobs  = [0;0;0];
Filtro.Robo3.dXobs = [0;0;0];
Filtro.Adv1.Xobs   = [0;0;0];
Filtro.Adv1.dXobs  = [0;0;0];
Filtro.Adv2.Xobs   = [0;0;0];
Filtro.Adv2.dXobs  = [0;0;0];
Filtro.Adv3.Xobs   = [0;0;0];
Filtro.Adv3.dXobs  = [0;0;0];
Filtro.Bola.Xobs   = [0;0;0];
Filtro.Bola.dXobs  = [0;0;0];