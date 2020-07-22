%% Determina as constantes do Jogo

% Se não encontrar a variável das constantes, determina um padrão
if ~exist('Constantes','var')
    
    % Erro máximo da posição (em mm) e da orientação (em graus)
    Constantes.Erro = [60 15];
    
    % Constantes de controle dos robôs
    Constantes.Saturacao = [600 400; 600 300];
    Constantes.Curva = [0.006 0.015; 0 0.01];
    
    % Tempo de máximo para atualizar cada setor
    Constantes.TmaxPartida = 0.05;
    Constantes.TmaxRobos = 0.1;
    Constantes.TmaxResult = 0.1;
    
    % Ganho das rodas: As linhas representam cada Robô e as colunas as rodas esquerda e direita
    Constantes.Ganho = [1 1;1 1;1 1];
    
end

% Chama a função para criar a tela de constantes
CriarConstantes

% Chama a função para criar a tela de constantes
AtualizarConstantes

% Habilita o botão de Iniciar Jogo
if Partida.ComunicacaoPDI == 1 && Partida.ComunicacaoRobos == 1
    set(TelaPrincipal.Botao(1),'enable','on')
end