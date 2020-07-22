%% Pré-aloca as variáveis dos Robôs e da Bola

% Inicia as variáveis dos Robôs
Robo(1).Ativado = 0;
Robo(1).Desejado = [0;0];
Robo(1).Formula = [0;0];
Robo(1).Funcao = '';
Robo(1).Posicao = [0;0;0];
Robo(1).Potencia = [0;0];
Robo(1).Saida = [0;0];
Robo(1).Velocidade = [0;0;0];

Robo(2) = Robo(1); Robo(3) = Robo(1);

% Inicia as variáveis dos Adversários
Adv(1).Posicao = [0;0;0];
Adv(1).Velocidade = [0;0;0];

Adv(2) = Adv(1); Adv(3) = Adv(1);

% Inicia as variáveis da Bola
Bola.Posicao = [0;0;0];
Bola.Velocidade = [0;0;0];

% Inicia as variáveis de Saida
% Saida.Formula = [0 0; 0 0; 0 0];
% Saida.Pacote = zeros(1,12);
% Saida.Potencia = [0 0; 0 0; 0 0];