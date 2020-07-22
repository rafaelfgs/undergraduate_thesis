%% Inicia a tela de jogo

% Inicia a tela de jogo
TelaJogo.Fig = figure;

% Modifica os parâmetros da tela e chama a função FecharJogo caso a tela for fechada
set(TelaJogo.Fig,'menubar','none','numbertitle','off')
set(TelaJogo.Fig,'name','Campo de Jogo','closerequestfcn','FecharJogo')

% Insere os botões para mostrar a segmentação ou os resultados
TelaJogo.Botao(1) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Mostrar Segmentação','units','normalized','position',[0.15 0.025 0.3 0.1],'fontsize',09,'Callback','CriarSegmentacao');
TelaJogo.Botao(2) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Mostrar Resultados' ,'units','normalized','position',[0.55 0.025 0.3 0.1],'fontsize',09,'Callback','CriarResultados' );

% Cria o painel central
TelaJogo.Painel = uipanel(TelaJogo.Fig,'units','normalized','position',[0.1 0.15 0.8 0.8]);
TelaJogo.Imagem = subplot(1,1,1,'parent',TelaJogo.Painel,'position',[0 0 1 1]); axis off
TelaJogo.Eixo = gca;

% Desabilita os botões de Atualizar Campo, da Câmera, da Comunicação e do Jogo
try set(TelaCampo.Botao(1),'enable','off'), catch, end
set(TelaPrincipal.Botao([1 4 7]),'enable','off')