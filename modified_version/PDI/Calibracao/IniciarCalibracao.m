%% Calibra e segmenta de cores

% Desabilita os bot�es de Encerrar a C�mera e de Calibra��o
set(TelaPDI.Botao([1 4]),'enable','off')

% Chama a fun��o para criar a tela de calibra��o
CriarCalibracao

% Chama a fun��o para exibir a segmenta��o da cor escolhida
ProcessarImagem