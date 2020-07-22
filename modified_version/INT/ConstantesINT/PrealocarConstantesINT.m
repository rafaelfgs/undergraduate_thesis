%% Cria um Padr�o para as Vari�veis de Constantes da Intelig�ncia

% Erro m�ximo da posi��o (em mm) e da orienta��o (em graus)
ConstantesINT.Erro = [60; 15];

% ConstantesINT de controle dos rob�s
ConstantesINT.Saturacao = [600 400; 400 300; 600 900];
ConstantesINT.Inclinacao = [0.006 0.015; 0.004 0.01];

% Ganho das rodas: As linhas representam os Rob�s e as colunas as rodas
ConstantesINT.Ganho = [1 1; 1 1; 1 1];

% Porta Serial de Comunica��o com os Rob�s
ConstantesINT.Porta = 'COM4';

% Tempo entre os envios (segundos)
ConstantesINT.TempoEnvio = 0.5;

% Frequ�ncia do movimento da Demonstra��o (graus/s)
ConstantesINT.Frequencia = 15;

% Constantes dos Rob�s
ConstantesINT.Ativo = true(3,1);
ConstantesINT.Funcao = [1;2;3];

% Nosso campo (-1 esquerda e 1 direita)
ConstantesINT.Campo = -1;

% Tipos poss�veis de Rob�s
ConstantesINT.Tipo = {'Goleiro';'Zagueiro';'Atacante'};