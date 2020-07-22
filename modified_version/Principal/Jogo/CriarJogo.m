%% Inicia a tela de jogo

% Cria uma nova janela
TelaJogo.Fig = figure;

% Modifica os parâmetros da tela e chama a função FecharJogo caso a tela for fechada
set(TelaJogo.Fig,'menubar','none','numbertitle','off')
set(TelaJogo.Fig,'name','Campo de Jogo','closerequestfcn','FecharJogo')

% Cria o painel central
TelaJogo.Painel = uipanel(TelaJogo.Fig,'units','normalized','position',[0.1 0.16 0.8 0.8]);
TelaJogo.Imagem = subplot(1,1,1,'parent',TelaJogo.Painel,'position',[0 0 1 1]); axis off
TelaJogo.Eixo = gca;

% Insere os botões para mostrar a segmentação ou os resultados
TelaJogo.Botao(1) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Mostrar Segmentação','units','normalized','position',[0.06 0.03 0.26 0.1],'fontsize',09,'Callback','CriarSegmentacao');
TelaJogo.Botao(2) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Mostrar Resultados' ,'units','normalized','position',[0.37 0.03 0.26 0.1],'fontsize',09,'Callback','CriarResultados');
TelaJogo.Botao(3) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Enviar Dados'       ,'units','normalized','position',[0.68 0.03 0.26 0.1],'fontsize',09,'Callback','CriarEnvio');