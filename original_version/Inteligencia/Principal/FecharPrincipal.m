%% Fecha a tela principal

% Finaliza o jogo
Partida.EmJogo = 0;

% Finaliza a cominuca��o com o PDI
if Partida.ComunicacaoPDI == 1
    ComunicarPDI
end

% Finaliza a comunica��o com os rob�s
if Partida.ComunicacaoRobos == 1
    ComunicarRobos
end

% Fecha as janelas abertas
closereq
close all