%% Se n�o estiver em jogo, finaliza o programa

% Para a Calibra��o e o Jogo
Partida.Calibracao = 0;
Partida.Jogo = 0;
Partida.Segmentacao = 0;
Partida.Resultados = 0;

% Para a comunica��o
if Partida.Comunicacao == 1
    ComunicarINT
end

% Finaliza a captura da c�mera
if isrunning(Camera.Video)
    stop(Camera.Video)
end

% Fecha as janelas
closereq
closereq
closereq
closereq
closereq
closereq
closepreview(Camera.Video)