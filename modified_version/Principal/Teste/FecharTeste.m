%% Encerra a execu��o do Teste e fecha as telas

% Habilita novamente os bot�es
set(TelaPrincipal.Botao(:),'enable','on')

% Finaliza as vari�veis do teste
Partida.EmDemo = false;
Partida.EmEnvio = false;
Partida.EmJogo = false;
Partida.EmTeste = false;
Partida.ExibeSegmentacao = false;
Partida.ExibeResultados = false;

% Fecha a tela do teste
closereq
clear TelaJogo