%% Determina a posi��o do campo e transforma de pixels para mil�metros

% Desabilita os bot�es de Encerrar a C�mera e de Definir o Campo
set(TelaPDI.Botao([1 5]),'enable','off')

% Chama a fun��o para criar a tela do campo
CriarCampo

% Chama a fun��o para determinar a rela��o entre pixels e mil�metros
RelacionarCampo

% Chama a fun��o para exibir os pontos na tela
PlotarCampo