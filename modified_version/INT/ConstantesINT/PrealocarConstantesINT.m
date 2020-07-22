%% Cria um Padrão para as Variáveis de Constantes da Inteligência

% Erro máximo da posição (em mm) e da orientação (em graus)
ConstantesINT.Erro = [60; 15];

% ConstantesINT de controle dos robôs
ConstantesINT.Saturacao = [600 400; 400 300; 600 900];
ConstantesINT.Inclinacao = [0.006 0.015; 0.004 0.01];

% Ganho das rodas: As linhas representam os Robôs e as colunas as rodas
ConstantesINT.Ganho = [1 1; 1 1; 1 1];

% Porta Serial de Comunicação com os Robôs
ConstantesINT.Porta = 'COM4';

% Tempo entre os envios (segundos)
ConstantesINT.TempoEnvio = 0.5;

% Frequência do movimento da Demonstração (graus/s)
ConstantesINT.Frequencia = 15;

% Constantes dos Robôs
ConstantesINT.Ativo = true(3,1);
ConstantesINT.Funcao = [1;2;3];

% Nosso campo (-1 esquerda e 1 direita)
ConstantesINT.Campo = -1;

% Tipos possíveis de Robôs
ConstantesINT.Tipo = {'Goleiro';'Zagueiro';'Atacante'};