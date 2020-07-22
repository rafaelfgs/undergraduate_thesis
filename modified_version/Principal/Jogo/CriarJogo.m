%% Inicia a tela de jogo

% Cria uma nova janela
TelaJogo.Fig = figure;

% Modifica os par�metros da tela e chama a fun��o FecharJogo caso a tela for fechada
set(TelaJogo.Fig,'menubar','none','numbertitle','off')
set(TelaJogo.Fig,'name','Campo de Jogo','closerequestfcn','FecharJogo')

% Cria o painel central
TelaJogo.Painel = uipanel(TelaJogo.Fig,'units','normalized','position',[0.1 0.16 0.8 0.8]);
TelaJogo.Imagem = subplot(1,1,1,'parent',TelaJogo.Painel,'position',[0 0 1 1]); axis off
TelaJogo.Eixo = gca;

% Insere os bot�es para mostrar a segmenta��o ou os resultados
TelaJogo.Botao(1) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Mostrar Segmenta��o','units','normalized','position',[0.06 0.03 0.26 0.1],'fontsize',09,'Callback','CriarSegmentacao');
TelaJogo.Botao(2) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Mostrar Resultados' ,'units','normalized','position',[0.37 0.03 0.26 0.1],'fontsize',09,'Callback','CriarResultados');
TelaJogo.Botao(3) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Enviar Dados'       ,'units','normalized','position',[0.68 0.03 0.26 0.1],'fontsize',09,'Callback','CriarEnvio');