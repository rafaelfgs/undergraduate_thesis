%% Calibra e segmenta de cores

% Desabilita os botões de Encerrar a Câmera e de Calibração
set(TelaPDI.Botao([1 4]),'enable','off')

% Chama a função para criar a tela de calibração
CriarCalibracao

% Chama a função para exibir a segmentação da cor escolhida
ProcessarImagem