%% Inicia a tela de constantes

% Cria e configura a tela das constantes
TelaConstantes.Fig = figure;
set(TelaConstantes.Fig,'menubar','none','numbertitle','off')
set(TelaConstantes.Fig,'name','Defini��o das Constantes','closerequestfcn','FecharConstantes')

% Op��es para determinar a dist�ncia entre as cores
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.01 0.87 0.5 0.07],'string','Dist�ncia entre as cores (mm)','fontsize',11)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.06 0.81 0.1 0.04],'string','M�nima','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.26 0.81 0.1 0.04],'string','M�xima','fontsize',09)
TelaConstantes.Valor(1) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.16 0.80 0.08 0.06],'string',Constantes.DistMin,'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(2) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.36 0.80 0.08 0.06],'string',Constantes.DistMax,'fontsize',09,'callback','AtualizarConstantes');

% Op��es para determinar o tamanho das cores prim�rias
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.01 0.68 0.5 0.07],'string','�rea das cores prim�rias (cm�)','fontsize',11)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.06 0.62 0.1 0.04],'string','M�nima','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.26 0.62 0.1 0.04],'string','M�xima','fontsize',09)
TelaConstantes.Valor(3) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.16 0.61 0.08 0.06],'string',Constantes.Area1Min,'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(4) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.36 0.61 0.08 0.06],'string',Constantes.Area1Max,'fontsize',09,'callback','AtualizarConstantes');

% Op��es para determinar o tamanho das cores secund�rias
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.01 0.49 0.5 0.07],'string','�rea das cores secund�rias (cm�)','fontsize',11)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.06 0.43 0.1 0.04],'string','M�nima','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.26 0.43 0.1 0.04],'string','M�xima','fontsize',09)
TelaConstantes.Valor(5) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.16 0.42 0.08 0.06],'string',Constantes.Area2Min,'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(6) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.36 0.42 0.08 0.06],'string',Constantes.Area2Max,'fontsize',09,'callback','AtualizarConstantes');

% Tamanhos e dist�ncias encontrados na �ltima itera��o
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.255 0.15 0.07],'string','Dist�ncias','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.17 0.15 0.07],'string','�reas Prim�rias','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.07 0.15 0.07],'string','�reas Secund�rias','fontsize',09)
TelaConstantes.Valor(7) = uitable(TelaConstantes.Fig,'data',round(Constantes.Distancias),'units','normalized','position',[0.2 0.28 0.26 0.05],'columnwidth',{20 20 20 20 20 20 20 20 20 20},'columnname',[],'rowname',[],'fontsize',09);
TelaConstantes.Valor(8) = uitable(TelaConstantes.Fig,'data',round(Constantes.Areas1),'units','normalized','position',[0.2 0.18 0.26 0.05],'columnwidth',{20 20 20 20 20 20 20 20},'ColumnName',[],'RowName',[],'fontsize',09);
TelaConstantes.Valor(9) = uitable(TelaConstantes.Fig,'data',round(Constantes.Areas2),'units','normalized','position',[0.2 0.08 0.26 0.05],'columnwidth',{20 20 20 20 20 20 20 20},'ColumnName',[],'RowName',[],'fontsize',09);

% Op��es para a sele��o da cor do time
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.515 0.88 0.2 0.06],'string','Nosso time','fontsize',10)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.515 0.74 0.2 0.06],'string','Advers�rio','fontsize',10)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.515 0.60 0.2 0.06],'string','Bola','fontsize',10)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.755 0.88 0.2 0.06],'string','Rob� 1','fontsize',10)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.755 0.74 0.2 0.06],'string','Rob� 2','fontsize',10)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.755 0.60 0.2 0.06],'string','Rob� 3','fontsize',10)
TelaConstantes.Cores(1) = uicontrol(TelaConstantes.Fig,'style','popup','units','normalized','position',[0.54 0.81 0.16 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',Constantes.CorNos,    'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Cores(2) = uicontrol(TelaConstantes.Fig,'style','popup','units','normalized','position',[0.54 0.67 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',Constantes.CorAdv,    'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Cores(3) = uicontrol(TelaConstantes.Fig,'style','popup','units','normalized','position',[0.54 0.53 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',Constantes.CorBola,   'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Cores(4) = uicontrol(TelaConstantes.Fig,'style','popup','units','normalized','position',[0.78 0.81 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',Constantes.CorRobo(1),'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Cores(5) = uicontrol(TelaConstantes.Fig,'style','popup','units','normalized','position',[0.78 0.67 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',Constantes.CorRobo(2),'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Cores(6) = uicontrol(TelaConstantes.Fig,'style','popup','units','normalized','position',[0.78 0.53 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',Constantes.CorRobo(3),'fontsize',10,'callback','AtualizarConstantes');

% Op��es para determinar a altura dos objetos e o tempo de envio
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.54 0.42 0.16 0.06],'string','Envio (s)'  ,'fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.76 0.42 0.16 0.06],'string','C�mera (mm)','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.54 0.27 0.16 0.06],'string','Rob�s (mm)' ,'fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.76 0.27 0.16 0.06],'string','Bola (mm)'  ,'fontsize',09)
TelaConstantes.Altura(1) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.58 0.37 0.08 0.06],'string',Constantes.TEnviar,   'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Altura(2) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.80 0.37 0.08 0.06],'string',Constantes.AlturaCam, 'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Altura(3) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.58 0.22 0.08 0.06],'string',Constantes.AlturaRobo,'fontsize',10,'callback','AtualizarConstantes');
TelaConstantes.Altura(4) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.80 0.22 0.08 0.06],'string',Constantes.AlturaBola,'fontsize',10,'callback','AtualizarConstantes');

% Bot�o para Salvar as Constantes
TelaConstantes.Botao = uicontrol(TelaConstantes.Fig,'style','pushbutton','string','Salvar Constantes','units','normalized','position',[0.58 0.06 0.3 0.1],'fontsize',10,'callback','SalvarConstantes');