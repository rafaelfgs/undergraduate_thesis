%% Inicia a tela de constantes

% Desabilita o bot�o de Definir Constantes
set(TelaPDI.Botao(6),'enable','off')

% Cria e configura a tela das constantes
TelaConstantesPDI.Fig = figure;
set(TelaConstantesPDI.Fig,'menubar','none','numbertitle','off','name','Defini��o das Constantes','closerequestfcn','FecharConstantesPDI')

% Op��es para determinar a dist�ncia entre as cores
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.01 0.87 0.5 0.07],'string','Dist�ncia entre as cores (mm)','fontsize',11)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.06 0.81 0.1 0.04],'string','M�nima','fontsize',09)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.26 0.81 0.1 0.04],'string','M�xima','fontsize',09)
TelaConstantesPDI.Valor(1) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.16 0.80 0.08 0.06],'string',ConstantesPDI.DistMin,'fontsize',09,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Valor(2) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.36 0.80 0.08 0.06],'string',ConstantesPDI.DistMax,'fontsize',09,'callback','AtualizarConstantesPDI');

% Op��es para determinar o tamanho das cores prim�rias
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.01 0.68 0.5 0.07],'string','�rea das cores prim�rias (cm�)','fontsize',11)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.06 0.62 0.1 0.04],'string','M�nima','fontsize',09)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.26 0.62 0.1 0.04],'string','M�xima','fontsize',09)
TelaConstantesPDI.Valor(3) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.16 0.61 0.08 0.06],'string',ConstantesPDI.Area1Min,'fontsize',09,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Valor(4) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.36 0.61 0.08 0.06],'string',ConstantesPDI.Area1Max,'fontsize',09,'callback','AtualizarConstantesPDI');

% Op��es para determinar o tamanho das cores secund�rias
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.01 0.49 0.5 0.07],'string','�rea das cores secund�rias (cm�)','fontsize',11)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.06 0.43 0.1 0.04],'string','M�nima','fontsize',09)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.26 0.43 0.1 0.04],'string','M�xima','fontsize',09)
TelaConstantesPDI.Valor(5) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.16 0.42 0.08 0.06],'string',ConstantesPDI.Area2Min,'fontsize',09,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Valor(6) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.36 0.42 0.08 0.06],'string',ConstantesPDI.Area2Max,'fontsize',09,'callback','AtualizarConstantesPDI');

% Tamanhos e dist�ncias encontrados na �ltima itera��o
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.04 0.255 0.15 0.07],'string','Dist�ncias','fontsize',09)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.04 0.17 0.15 0.07],'string','�reas Prim�rias','fontsize',09)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.04 0.07 0.15 0.07],'string','�reas Secund�rias','fontsize',09)
TelaConstantesPDI.Valor(7) = uitable(TelaConstantesPDI.Fig,'data',round(ConstantesPDI.Distancias),'units','normalized','position',[0.2 0.28 0.26 0.05],'columnwidth',{20 20 20 20 20 20 20 20 20 20},'columnname',[],'rowname',[],'fontsize',09);
TelaConstantesPDI.Valor(8) = uitable(TelaConstantesPDI.Fig,'data',round(ConstantesPDI.Areas1),'units','normalized','position',[0.2 0.18 0.26 0.05],'columnwidth',{20 20 20 20 20 20 20 20},'ColumnName',[],'RowName',[],'fontsize',09);
TelaConstantesPDI.Valor(9) = uitable(TelaConstantesPDI.Fig,'data',round(ConstantesPDI.Areas2),'units','normalized','position',[0.2 0.08 0.26 0.05],'columnwidth',{20 20 20 20 20 20 20 20},'ColumnName',[],'RowName',[],'fontsize',09);

% Op��es para a sele��o da cor do time
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.515 0.88 0.2 0.06],'string','Nosso time','fontsize',10)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.515 0.73 0.2 0.06],'string','Advers�rio','fontsize',10)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.515 0.58 0.2 0.06],'string','Bola','fontsize',10)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.755 0.88 0.2 0.06],'string','Rob� 1','fontsize',10)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.755 0.73 0.2 0.06],'string','Rob� 2','fontsize',10)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.755 0.58 0.2 0.06],'string','Rob� 3','fontsize',10)
TelaConstantesPDI.Cores(1) = uicontrol(TelaConstantesPDI.Fig,'style','popup','units','normalized','position',[0.54 0.81 0.16 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',ConstantesPDI.CorNos,    'fontsize',10,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Cores(2) = uicontrol(TelaConstantesPDI.Fig,'style','popup','units','normalized','position',[0.54 0.66 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',ConstantesPDI.CorAdv,    'fontsize',10,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Cores(3) = uicontrol(TelaConstantesPDI.Fig,'style','popup','units','normalized','position',[0.54 0.51 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',ConstantesPDI.CorBola,   'fontsize',10,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Cores(4) = uicontrol(TelaConstantesPDI.Fig,'style','popup','units','normalized','position',[0.78 0.81 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',ConstantesPDI.CorRobo(1),'fontsize',10,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Cores(5) = uicontrol(TelaConstantesPDI.Fig,'style','popup','units','normalized','position',[0.78 0.66 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',ConstantesPDI.CorRobo(2),'fontsize',10,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Cores(6) = uicontrol(TelaConstantesPDI.Fig,'style','popup','units','normalized','position',[0.78 0.51 0.15 0.08],'string',{'Vermelho','Laranja','Amarelo','Verde','Ciano','Azul','Magenta'},'value',ConstantesPDI.CorRobo(3),'fontsize',10,'callback','AtualizarConstantesPDI');

% Op��es para determinar a altura dos objetos
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.54 0.38 0.26 0.06],'string','Altura da C�mera (mm)','fontsize',09)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.54 0.29 0.26 0.06],'string','Altura dos Rob�s (mm)','fontsize',09)
uicontrol(TelaConstantesPDI.Fig,'style','text','units','normalized','position',[0.54 0.20 0.26 0.06],'string','Di�metro da Bola (mm)','fontsize',09)
TelaConstantesPDI.Altura(1) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.82 0.39 0.08 0.06],'string',ConstantesPDI.AlturaCam, 'fontsize',10,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Altura(2) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.82 0.30 0.08 0.06],'string',ConstantesPDI.AlturaRobo,'fontsize',10,'callback','AtualizarConstantesPDI');
TelaConstantesPDI.Altura(3) = uicontrol(TelaConstantesPDI.Fig,'style','edit','units','normalized','position',[0.82 0.21 0.08 0.06],'string',ConstantesPDI.AlturaBola,'fontsize',10,'callback','AtualizarConstantesPDI');

% Bot�o para Salvar as Constantes
TelaConstantesPDI.Botao = uicontrol(TelaConstantesPDI.Fig,'style','pushbutton','string','Salvar Constantes','units','normalized','position',[0.58 0.06 0.3 0.1],'fontsize',10,'callback','SalvarConstantesPDI');