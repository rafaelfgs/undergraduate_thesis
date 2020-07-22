%% Inicia a tela principal

% Inicia a tela principal e chama a função FecharPrincipal caso a tela for fechada
TelaPrincipal.Fig = figure;
set(TelaPrincipal.Fig,'toolbar','none','dockcontrols','off','menubar','none','numbertitle','off')
set(TelaPrincipal.Fig,'name','Tela Principal','closerequestfcn','FecharPrincipal')


%% Configura os botões da tela

% Insere os botões
TelaPrincipal.Botao(1) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Jogo'          ,'units','normalized','position',[0.10 0.75 0.35 0.15],'fontsize',15,'callback','IniciarJogo');
TelaPrincipal.Botao(2) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Teste'         ,'units','normalized','position',[0.10 0.50 0.35 0.15],'fontsize',15,'callback','IniciarTeste');
TelaPrincipal.Botao(3) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Comunicar com o PDI'   ,'units','normalized','position',[0.10 0.30 0.35 0.10],'fontsize',11,'callback','ComunicarPDI');
TelaPrincipal.Botao(4) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Comunicar com os Robôs','units','normalized','position',[0.10 0.10 0.35 0.10],'fontsize',11,'callback','ComunicarRobos');
TelaPrincipal.Botao(5) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Alterar Constantes'    ,'units','normalized','position',[0.55 0.10 0.35 0.10],'fontsize',11,'callback','IniciarConstantes');

% Insere os textos com os nomes do Goleiro, do Zagueiro e do Atacante
uicontrol(TelaPrincipal.Fig,'style','text','string','Função do Robôs','units','normalized','position',[0.55 0.80 0.35 0.10],'fontsize',13);
uicontrol(TelaPrincipal.Fig,'style','text','string','Goleiro' ,'units','normalized','position',[0.63 0.76 0.10 0.04],'fontsize',09);
uicontrol(TelaPrincipal.Fig,'style','text','string','Zagueiro','units','normalized','position',[0.73 0.76 0.10 0.04],'fontsize',09);
uicontrol(TelaPrincipal.Fig,'style','text','string','Atacante','units','normalized','position',[0.83 0.76 0.10 0.04],'fontsize',09);

% Insere um grupo de botões para a escolha do Robô 1
TelaPrincipal.AtivRobo(1) = uicontrol(TelaPrincipal.Fig,'style','checkbox','string','Robô 1','units','normalized','position',[0.52 0.67 0.25 0.08],'fontsize',09);
TelaPrincipal.FuncRobo(1) = uibuttongroup(TelaPrincipal.Fig,'units','normalized','position',[0.67 0.67 0.3 0.08],'bordertype','none');
uicontrol(TelaPrincipal.FuncRobo(1),'style','radiobutton','units','normalized','position',[0/3 0 1/3 1],'fontsize',09)
uicontrol(TelaPrincipal.FuncRobo(1),'style','radiobutton','units','normalized','position',[1/3 0 1/3 1],'fontsize',09)
uicontrol(TelaPrincipal.FuncRobo(1),'style','radiobutton','units','normalized','position',[2/3 0 1/3 1],'fontsize',09,'value',1)

% Insere um grupo de botões para a escolha do Robô 2
TelaPrincipal.AtivRobo(2) = uicontrol(TelaPrincipal.Fig,'style','checkbox','string','Robô 2','units','normalized','position',[0.52 0.58 0.25 0.08],'fontsize',09);
TelaPrincipal.FuncRobo(2) = uibuttongroup(TelaPrincipal.Fig,'units','normalized','position',[0.67 0.58 0.3 0.08],'bordertype','none');
uicontrol(TelaPrincipal.FuncRobo(2),'style','radiobutton','units','normalized','position',[0/3 0 1/3 1],'fontsize',09,'value',1);
uicontrol(TelaPrincipal.FuncRobo(2),'style','radiobutton','units','normalized','position',[1/3 0 1/3 1],'fontsize',09);
uicontrol(TelaPrincipal.FuncRobo(2),'style','radiobutton','units','normalized','position',[2/3 0 1/3 1],'fontsize',09);

% Insere um grupo de botões para a escolha do Robô 3
TelaPrincipal.AtivRobo(3) = uicontrol(TelaPrincipal.Fig,'style','checkbox','string','Robô 3','units','normalized','position',[0.52 0.49 0.25 0.08],'fontsize',09);
TelaPrincipal.FuncRobo(3) = uibuttongroup(TelaPrincipal.Fig,'units','normalized','position',[0.67 0.49 0.3 0.08],'bordertype','none');
uicontrol(TelaPrincipal.FuncRobo(3),'style','radiobutton','units','normalized','position',[0/3 0 1/3 1],'fontsize',09);
uicontrol(TelaPrincipal.FuncRobo(3),'style','radiobutton','units','normalized','position',[1/3 0 1/3 1],'fontsize',09,'value',1);
uicontrol(TelaPrincipal.FuncRobo(3),'style','radiobutton','units','normalized','position',[2/3 0 1/3 1],'fontsize',09);

% Insere um grupo de botões para a escolha do campo
uicontrol(TelaPrincipal.Fig,'style','text','string','Nosso Campo de Defesa','units','normalized','position',[0.50 0.32 0.45 0.10],'fontsize',13);
TelaPrincipal.Campo = uibuttongroup(TelaPrincipal.Fig,'units','normalized','position',[0.575 0.26 0.375 0.10],'bordertype','none');
uicontrol(TelaPrincipal.Campo,'style','radiobutton','string','Esquerda','units','normalized','position',[0/2 0 1/2 1],'fontsize',09);
uicontrol(TelaPrincipal.Campo,'style','radiobutton','string','Direita' ,'units','normalized','position',[1/2 0 1/2 1],'fontsize',09);

% Desabilita os botões de jogo
set(TelaPrincipal.Botao(1:2),'enable','off')
set(TelaPrincipal.AtivRobo(1:3),'value',1)