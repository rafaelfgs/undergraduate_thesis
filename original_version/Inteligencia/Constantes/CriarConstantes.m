%% Cria a tela de constantes

% Cria a tela
TelaConstantes.Fig = figure;
set(TelaConstantes.Fig,'name','Constantes','toolbar','none','dockcontrols','off','menubar','none','numbertitle','off')

% Cria os textos e os edits para os erros de postura
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.87 0.44 0.10],'HorizontalAlignment','center','string','Erros máximos de postura','fontsize',14)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.79 0.30 0.08],'HorizontalAlignment','center','string','Posição (em mm)','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.72 0.30 0.08],'HorizontalAlignment','center','string','Orientação (em graus)','fontsize',09)
TelaConstantes.Valor(1)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.32 0.82 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Erro(1),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(2)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.32 0.75 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Erro(2),'fontsize',09,'callback','AtualizarConstantes');

% Cria os textos e os edits para as constantes de saturação da velocidade
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.59 0.44 0.10],'HorizontalAlignment','center','string','Saturação da velocidade','fontsize',14)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.32 0.53 0.14 0.08],'HorizontalAlignment','center','string','Angular (º/s)','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.18 0.53 0.14 0.08],'HorizontalAlignment','center','string','Linear (mm/s)','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.06 0.46 0.12 0.08],'HorizontalAlignment','center','string','Trajetória','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.06 0.39 0.12 0.08],'HorizontalAlignment','center','string','Chute','fontsize',09)
TelaConstantes.Valor(3)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.20 0.49 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Saturacao(1),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(4)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.34 0.49 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Saturacao(2),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(5)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.20 0.42 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Saturacao(3),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(6)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.34 0.42 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Saturacao(4),'fontsize',09,'callback','AtualizarConstantes');

% Cria os textos e os edits para as constantes do comportamento da curva de velocidade
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.04 0.26 0.44 0.10],'HorizontalAlignment','center','string','Constantes da curva','fontsize',14)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.32 0.20 0.14 0.08],'HorizontalAlignment','center','string','Angular','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.18 0.20 0.14 0.08],'HorizontalAlignment','center','string','Linear','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.06 0.13 0.12 0.08],'HorizontalAlignment','center','string','Trajetória','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.06 0.06 0.12 0.08],'HorizontalAlignment','center','string','Chute','fontsize',09)
TelaConstantes.Valor(7)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.20 0.16 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Curva(1),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(8)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.34 0.16 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Curva(2),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(9)  = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.20 0.09 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Curva(3),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(10) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.34 0.09 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Curva(4),'fontsize',09,'callback','AtualizarConstantes');

% Cria os textos e os edits para os tempos de cada setor
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.87 0.44 0.10],'HorizontalAlignment','center','string','Tempo para cada setor','fontsize',14)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.79 0.30 0.08],'HorizontalAlignment','center','string','Partida (em ms)','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.72 0.30 0.08],'HorizontalAlignment','center','string','Robos (em ms)','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.65 0.30 0.08],'HorizontalAlignment','center','string','Resultados (em ms)','fontsize',09)
TelaConstantes.Valor(11) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.84 0.82 0.1 0.06],'HorizontalAlignment','center','string',1000*Constantes.TmaxPartida,'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(12) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.84 0.75 0.1 0.06],'HorizontalAlignment','center','string',1000*Constantes.TmaxRobos  ,'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(13) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.84 0.68 0.1 0.06],'HorizontalAlignment','center','string',1000*Constantes.TmaxResult ,'fontsize',09,'callback','AtualizarConstantes');

% Cria os textos e os edits para os ganhos de cada roda
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.52 0.44 0.10],'HorizontalAlignment','center','string','Ganhos de cada roda','fontsize',14)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.78 0.46 0.14 0.08],'HorizontalAlignment','center','string','Direita' ,'fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.64 0.46 0.14 0.08],'HorizontalAlignment','center','string','Esquerda','fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.39 0.12 0.08],'HorizontalAlignment','center','string','Robô 1'  ,'fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.32 0.12 0.08],'HorizontalAlignment','center','string','Robô 2'  ,'fontsize',09)
uicontrol(TelaConstantes.Fig,'style','text','units','normalized','position',[0.52 0.25 0.12 0.08],'HorizontalAlignment','center','string','Robô 3'  ,'fontsize',09)
TelaConstantes.Valor(14) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.66 0.42 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Ganho(1,1),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(15) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.80 0.42 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Ganho(1,2),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(16) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.66 0.35 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Ganho(2,1),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(17) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.80 0.35 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Ganho(2,2),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(18) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.66 0.28 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Ganho(3,1),'fontsize',09,'callback','AtualizarConstantes');
TelaConstantes.Valor(19) = uicontrol(TelaConstantes.Fig,'style','edit','units','normalized','position',[0.80 0.28 0.1 0.06],'HorizontalAlignment','center','string',Constantes.Ganho(3,2),'fontsize',09,'callback','AtualizarConstantes');

% Cria o botão para salvar as constantes
TelaConstantes.Botao = uicontrol(TelaConstantes.Fig,'style','pushbutton','units','normalized','position',[0.6 0.1 0.3 0.1],'HorizontalAlignment','center','string','Salvar Constantes','fontsize',11,'callback','SalvarConstantes');