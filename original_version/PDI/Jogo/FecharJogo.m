%% Para a execução da partida e fecha as telas

% Limpa as variáveis utilizadas nos loops
clear ii jj

% Habilita os botões de Atualizar Campo, Parar Câmera e Finalizar Comunicação
try set(TelaCampo.Botao(1),'enable','on'), catch, end
set(TelaPrincipal.Botao([1 4 7]),'enable','on')

% Finaliza as variáveis do jogo
Partida.Jogo = 0;
Partida.Segmentacao = 0;
Partida.Resultados = 0;

% MediaArea = MediaArea./t
% MediaDist = MediaDist./t
% Diferenca = [MediaArea(1)- MediaArea(2) MediaDist(2) - MediaDist(1)]


% Fecha a tela do jogo
closereq