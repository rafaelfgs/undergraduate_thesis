%% Encerra a execução do Teste e fecha as telas

% Habilita novamente os botões
set(TelaPrincipal.Botao(:),'enable','on')

% Finaliza as variáveis do teste
Partida.EmDemo = false;
Partida.EmEnvio = false;
Partida.EmJogo = false;
Partida.EmTeste = false;
Partida.ExibeSegmentacao = false;
Partida.ExibeResultados = false;

% Fecha a tela do teste
closereq
clear TelaJogo