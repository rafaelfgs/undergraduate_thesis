%% Cria a Tela de Constantes do Movimento dos Robôs

% Desabilita o botão de Constantes do Movimento
set(TelaINT.Botao(2),'enable','off')

% Cria a tela
TelaConstantesINT.Fig = figure;
set(TelaConstantesINT.Fig,'menubar','none','numbertitle','off','name','Definição das Constantes','closerequestfcn','FecharConstantesINT')

% Cria os textos e os edits para as constantes da inclinação da curva de velocidade
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.04 0.84 0.44 0.10],'HorizontalAlignment','center','string','Inclinação da curva' ,'fontsize',14)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.16 0.77 0.16 0.08],'HorizontalAlignment','center','string','Linear (º/s)','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.32 0.77 0.16 0.08],'HorizontalAlignment','center','string','Angular (mm/s)','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.04 0.70 0.12 0.08],'HorizontalAlignment','center','string','Trajetória','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.04 0.60 0.12 0.08],'HorizontalAlignment','center','string','Orientação','fontsize',09)
TelaConstantesINT.Inclinacao(1,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Inclinacao(1,1),'units','normalized','position',[0.19 0.73 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Inclinacao(1,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Inclinacao(1,2),'units','normalized','position',[0.35 0.73 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Inclinacao(2,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Inclinacao(2,1),'units','normalized','position',[0.19 0.63 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Inclinacao(2,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Inclinacao(2,2),'units','normalized','position',[0.35 0.63 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');

% Cria os textos e os edits para as constantes de saturação da velocidade
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.54 0.86 0.44 0.10],'HorizontalAlignment','center','string','Saturação da velocidade','fontsize',14)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.66 0.79 0.15 0.08],'HorizontalAlignment','center','string','Linear (mm/s)','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.82 0.79 0.15 0.08],'HorizontalAlignment','center','string','Angular (º/s)','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.54 0.72 0.12 0.08],'HorizontalAlignment','center','string','Trajetória','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.54 0.62 0.12 0.08],'HorizontalAlignment','center','string','Orientação','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.54 0.52 0.12 0.08],'HorizontalAlignment','center','string','Chute/Giro','fontsize',09)
TelaConstantesINT.Saturacao(1,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Saturacao(1,1),'units','normalized','position',[0.69 0.75 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Saturacao(1,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Saturacao(1,2),'units','normalized','position',[0.85 0.75 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Saturacao(2,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Saturacao(2,1),'units','normalized','position',[0.69 0.65 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Saturacao(2,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Saturacao(2,2),'units','normalized','position',[0.85 0.65 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Saturacao(3,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Saturacao(3,1),'units','normalized','position',[0.69 0.55 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Saturacao(3,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Saturacao(3,2),'units','normalized','position',[0.85 0.55 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');

% Cria os textos e os edits para os ganhos de cada roda
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.04 0.44 0.44 0.10],'HorizontalAlignment','center','string','Ganhos de cada roda','fontsize',14)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.16 0.37 0.16 0.08],'HorizontalAlignment','center','string','Direita' ,'fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.32 0.37 0.16 0.08],'HorizontalAlignment','center','string','Esquerda','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.04 0.30 0.12 0.08],'HorizontalAlignment','center','string','Robô 1'  ,'fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.04 0.20 0.12 0.08],'HorizontalAlignment','center','string','Robô 2'  ,'fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.04 0.10 0.12 0.08],'HorizontalAlignment','center','string','Robô 3'  ,'fontsize',09)
TelaConstantesINT.Ganho(1,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Ganho(1,1),'units','normalized','position',[0.19 0.33 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Ganho(1,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Ganho(1,2),'units','normalized','position',[0.35 0.33 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Ganho(2,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Ganho(2,1),'units','normalized','position',[0.19 0.23 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Ganho(2,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Ganho(2,2),'units','normalized','position',[0.35 0.23 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Ganho(3,1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Ganho(3,1),'units','normalized','position',[0.19 0.13 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Ganho(3,2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Ganho(3,2),'units','normalized','position',[0.35 0.13 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');

% Cria os textos e os edits para os erros de postura
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.52 0.38 0.44 0.10],'HorizontalAlignment','center','string','Erros máximos de postura','fontsize',14)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.55 0.30 0.24 0.08],'HorizontalAlignment','center','string','Trajetória (em mm)','fontsize',09)
uicontrol(TelaConstantesINT.Fig,'style','text','units','normalized','position',[0.55 0.20 0.24 0.08],'HorizontalAlignment','center','string','Orientação (em graus)','fontsize',09)
TelaConstantesINT.Erro(1) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Erro(1),'units','normalized','position',[0.81 0.33 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');
TelaConstantesINT.Erro(2) = uicontrol(TelaConstantesINT.Fig,'style','edit','string',ConstantesINT.Erro(2),'units','normalized','position',[0.81 0.23 0.1 0.06],'HorizontalAlignment','center','fontsize',09,'callback','AtualizarConstantesINT');

% Cria o botão para salvar as constantes
TelaConstantesINT.Botao = uicontrol(TelaConstantesINT.Fig,'style','pushbutton','units','normalized','position',[0.60 0.08 0.3 0.1],'HorizontalAlignment','center','string','Salvar Constantes','fontsize',11,'callback','SalvarConstantesINT');