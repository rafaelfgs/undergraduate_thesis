%% Rotina para realizar o jogo

% Inicia o n�mero da rotina atual
Tempo.K = 0;

% Segmenta a imagem (26ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
SegmentarImagem
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Encontra as �reas e os centr�ides das cores (8.8ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
EncontrarCores
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Corige os erros relacionados �s alturas dos objetos (0.13ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
CorrigirAlturas
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Converte as cores de pixels para mil�metros (0.82ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
ConverterPX2MM
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Associa as cores � cada Rob� e � Bola (0.66ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
EscolherRobos
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Encontra os centr�ides corretos e a orienta��o (0.18ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
DeterminarPosturas
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Encontra os Rob�s e as Bolas ideais (0.48ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
RealizarJanelamento
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Define e filtra as posturas dos objetos (0.45ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
FiltrarPosturas
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Define e filtra as velocidades dos objetos (0.15ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
FiltrarVelocidades
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);

% Exibe a segmenta��o na tela se precisar (43ms)
Tempo.K = Tempo.K + 1;
if Partida.Segmentacao == 1
    Tempo.Ti(Tempo.K) = tic;
    ExibirSegmentacao
    Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
    Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);
end

% Exibe os resultados na tela se precisar (50ms)
Tempo.K = Tempo.K + 1;
if Partida.Resultados == 1
    Tempo.Ti(Tempo.K) = tic;
    ExibirResultados
    Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
    Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);
end

% Depois de passar o tempo m�ximo, envia os resultados para a intelig�ncia (0.75ms)
Tempo.K = Tempo.K + 1;
Tempo.Ti(Tempo.K) = tic;
EnviarDados
Tempo.Frames(Tempo.K) = Tempo.Frames(Tempo.K) + 1;
Tempo.Tf(Tempo.K) = ( 1000*toc(Tempo.Ti(Tempo.K)) + (Tempo.Frames(Tempo.K)-1)*Tempo.Tf(Tempo.K) ) / Tempo.Frames(Tempo.K);