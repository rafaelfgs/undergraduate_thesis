%% Determina a posição do campo e transforma de pixels para milímetros

% Desabilita os botões de Encerrar a Câmera e de Definir o Campo
set(TelaPDI.Botao([1 5]),'enable','off')

% Chama a função para criar a tela do campo
CriarCampo

% Chama a função para determinar a relação entre pixels e milímetros
RelacionarCampo

% Chama a função para exibir os pontos na tela
PlotarCampo