%% Cria a tela para exibir os testes

% Desabilita os botões da Tela Principal
set(TelaPrincipal.Botao,'enable','off')
set(TelaPrincipal.AtivRobo,'enable','off')
set(TelaPrincipal.FuncRobo,'visible','off')
set(TelaPrincipal.Campo,'visible','off')

% Abre uma nova janela
TelaTeste.Fig = figure;

% Modifica os parâmetros da tela e chama a função FecharTeste caso a tela for fechada
set(TelaTeste.Fig,'toolbar','none','dockcontrols','off','menubar','none','numberTitle','off')
set(TelaTeste.Fig,'name','Campo de Teste','closerequestfcn','FecharTeste')

% Cria o painel central
TelaTeste.Painel = uipanel(TelaTeste.Fig,'units','normalized','position',[0.1 0.05 0.8 0.8]);
TelaTeste.Imagem = subplot(1,1,1,'parent',TelaTeste.Painel,'position',[0 0 1 1]); axis off
TelaTeste.Eixo = gca;

% Cria os botões da tela
TelaTeste.Botao(1) = uicontrol(TelaTeste.Fig,'style','popup','string',{'Potências','Desejado','Demo'},'units','normalized','position',[0.1 0.85 0.16 0.1],'fontsize',10,'callback','DefinirParametros');
TelaTeste.Botao(2) = uicontrol(TelaTeste.Fig,'style','popup','string',{'Robô 1','Robô 2','Robô 3'}   ,'units','normalized','position',[0.3 0.85 0.16 0.1],'fontsize',10,'callback','DefinirParametros');
TelaTeste.Botao(3) = uicontrol(TelaTeste.Fig,'style','edit','string',100,'units','normalized','position',[0.50 0.89 0.06 0.06],'fontsize',10,'callback','DefinirParametros');
TelaTeste.Botao(4) = uicontrol(TelaTeste.Fig,'style','edit','string',100,'units','normalized','position',[0.58 0.89 0.06 0.06],'fontsize',10,'callback','DefinirParametros');
TelaTeste.Botao(5) = uicontrol(TelaTeste.Fig,'style','pushbutton','string','Iniciar Teste','units','normalized','position',[0.7 0.88 0.2 0.08],'fontsize',10,'callback','PausarTeste');

%% Cria o campo na tela

% Altera o eixo
axis([-900 900 -850 850])

hold on

% Deixa preto o fundo da tela
rectangle('position',[-900 -850 1800 1700],'facecolor',[.2 .2 .2])

% Cria as bordas do campo
line([-680  680],[ 650  650],'color','w','linewidth',2)
line([ 680  750],[ 650  580],'color','w','linewidth',2)
line([ 750  750],[ 580 -580],'color','w','linewidth',2)
line([ 750  680],[-580 -650],'color','w','linewidth',2)
line([ 680 -680],[-650 -650],'color','w','linewidth',2)
line([-680 -750],[-650 -580],'color','w','linewidth',2)
line([-750 -750],[-580  580],'color','w','linewidth',2)
line([-750 -680],[ 580  650],'color','w','linewidth',2)
line([-750 -600],[ 350  350],'color','w','linewidth',2)
line([-600 -600],[ 350 -350],'color','w','linewidth',2)
line([-750 -600],[-350 -350],'color','w','linewidth',2)
line([ 750  600],[ 350  350],'color','w','linewidth',2)
line([ 600  600],[ 350 -350],'color','w','linewidth',2)
line([ 750  600],[-350 -350],'color','w','linewidth',2)
line([ 000  000],[-650  650],'color','w','linewidth',2)
rectangle('position',[-200 -200 400 400],'curvature',[1 1],'edgecolor','w','linewidth',2)

hold off