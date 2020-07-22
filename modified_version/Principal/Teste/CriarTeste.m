%% Cria a tela para exibir o Teste

% Cria uma nova janela
TelaJogo.Fig = figure;

% Modifica os parâmetros da tela e chama a função FecharTeste caso a tela for fechada
set(TelaJogo.Fig,'menubar','none','numbertitle','off')
set(TelaJogo.Fig,'name','Campo de Teste','closerequestfcn','FecharTeste')

% Cria o painel central
TelaJogo.Painel = uipanel(TelaJogo.Fig,'units','normalized','position',[0.1 0.04 0.8 0.8]);
TelaJogo.Imagem = subplot(1,1,1,'parent',TelaJogo.Painel,'position',[0 0 1 1]); axis off
TelaJogo.Eixo = gca;

% Cria os parâmetros da tela
TelaJogo.Parametro(1) = uicontrol(TelaJogo.Fig,'style','popup','string',{'Potências','Desejado','Demo O','Demo 8'},'units','normalized','position',[0.04 0.85 0.16 0.1],'fontsize',10,'callback','DefinirParametros');
TelaJogo.Parametro(2) = uicontrol(TelaJogo.Fig,'style','popup','string',{'Robô 1','Robô 2','Robô 3'}   ,'units','normalized','position',[0.22 0.85 0.12 0.1],'fontsize',10,'callback','DefinirParametros');
TelaJogo.Parametro(3) = uicontrol(TelaJogo.Fig,'style','edit','string',100,'units','normalized','position',[0.36 0.89 0.06 0.06],'fontsize',10,'callback','DefinirParametros');
TelaJogo.Parametro(4) = uicontrol(TelaJogo.Fig,'style','edit','string',100,'units','normalized','position',[0.44 0.89 0.06 0.06],'fontsize',10,'callback','DefinirParametros');

% Cria os botões da tela
TelaJogo.Botao(1) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Ver Segmentação','units','normalized','position',[0.54 0.88 0.20 0.08],'fontsize',10,'callback','CriarSegmentacao');
TelaJogo.Botao(2) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Enviar Dados'   ,'units','normalized','position',[0.78 0.88 0.18 0.08],'fontsize',10,'callback','CriarEnvio');