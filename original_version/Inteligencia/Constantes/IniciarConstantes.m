%% Determina as constantes do Jogo

% Se n�o encontrar a vari�vel das constantes, determina um padr�o
if ~exist('Constantes','var')
    
    % Erro m�ximo da posi��o (em mm) e da orienta��o (em graus)
    Constantes.Erro = [60 15];
    
    % Constantes de controle dos rob�s
    Constantes.Saturacao = [600 400; 600 300];
    Constantes.Curva = [0.006 0.015; 0 0.01];
    
    % Tempo de m�ximo para atualizar cada setor
    Constantes.TmaxPartida = 0.05;
    Constantes.TmaxRobos = 0.1;
    Constantes.TmaxResult = 0.1;
    
    % Ganho das rodas: As linhas representam cada Rob� e as colunas as rodas esquerda e direita
    Constantes.Ganho = [1 1;1 1;1 1];
    
end

% Chama a fun��o para criar a tela de constantes
CriarConstantes

% Chama a fun��o para criar a tela de constantes
AtualizarConstantes

% Habilita o bot�o de Iniciar Jogo
if Partida.ComunicacaoPDI == 1 && Partida.ComunicacaoRobos == 1
    set(TelaPrincipal.Botao(1),'enable','on')
end