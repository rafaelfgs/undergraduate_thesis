%% Fecha as telas de calibração de cores e habilita os botões

% Para a variável de Calibração
Partida.Calibracao = 0;

% Habilita os botões de Parar a Câmera e de Calibração
set(TelaPrincipal.Botao([1 5]),'enable','on')

% Fecha as janelas
try close(TelaPixels.fig), catch, end
closereq