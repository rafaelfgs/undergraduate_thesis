%% Pr�-aloca as vari�veis dos Rob�s e da Bola

% Inicia as vari�veis dos Rob�s
Robo(1).Ativado = 0;
Robo(1).Desejado = [0;0];
Robo(1).Formula = [0;0];
Robo(1).Funcao = '';
Robo(1).Posicao = [0;0;0];
Robo(1).Potencia = [0;0];
Robo(1).Saida = [0;0];
Robo(1).Velocidade = [0;0;0];

Robo(2) = Robo(1); Robo(3) = Robo(1);

% Inicia as vari�veis dos Advers�rios
Adv(1).Posicao = [0;0;0];
Adv(1).Velocidade = [0;0;0];

Adv(2) = Adv(1); Adv(3) = Adv(1);

% Inicia as vari�veis da Bola
Bola.Posicao = [0;0;0];
Bola.Velocidade = [0;0;0];

% Inicia as vari�veis de Saida
% Saida.Formula = [0 0; 0 0; 0 0];
% Saida.Pacote = zeros(1,12);
% Saida.Potencia = [0 0; 0 0; 0 0];