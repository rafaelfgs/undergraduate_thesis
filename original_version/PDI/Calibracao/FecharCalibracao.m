%% Fecha as telas de calibra��o de cores e habilita os bot�es

% Para a vari�vel de Calibra��o
Partida.Calibracao = 0;

% Habilita os bot�es de Parar a C�mera e de Calibra��o
set(TelaPrincipal.Botao([1 5]),'enable','on')

% Fecha as janelas
try close(TelaPixels.fig), catch, end
closereq