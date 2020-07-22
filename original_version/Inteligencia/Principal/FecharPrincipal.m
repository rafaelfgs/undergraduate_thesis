%% Fecha a tela principal

% Finaliza o jogo
Partida.EmJogo = 0;

% Finaliza a cominucação com o PDI
if Partida.ComunicacaoPDI == 1
    ComunicarPDI
end

% Finaliza a comunicação com os robôs
if Partida.ComunicacaoRobos == 1
    ComunicarRobos
end

% Fecha as janelas abertas
closereq
close all