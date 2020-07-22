%% Inicia a tela de calibração de cores

% Inicia e modifica os parâmetros da tela de calibração e chama a função FecharCalibracao para fechar
TelaCalibracao.Fig = figure;
set(TelaCalibracao.Fig,'menubar','none','numbertitle','off')
set(TelaCalibracao.Fig,'name','Calibração das Cores','closerequestfcn','FecharCalibracao')

% Cria o texto dos edits e dos sliders
uicontrol(TelaCalibracao.Fig,'style','text','string','Matiz','units','normalized','position',[0.05 0.93 0.25 0.05],'horizontalalignment','center','fontsize',10);
uicontrol(TelaCalibracao.Fig,'style','text','string','Saturação','units','normalized','position',[0.37 0.93 0.25 0.05],'horizontalalignment','center','fontsize',10);
uicontrol(TelaCalibracao.Fig,'style','text','string','Luminosidade','units','normalized','position',[0.69 0.93 0.25 0.05],'horizontalalignment','center','fontsize',10);

% Cria os edits para o padrão de cada cor
TelaCalibracao.Botao.Edit(1) = uicontrol(TelaCalibracao.Fig,'style','edit','string',0,  'units','normalized','position',[0.05 0.875 0.06 0.05],'horizontalalignment','center','callback','AtualizarEdit');
TelaCalibracao.Botao.Edit(2) = uicontrol(TelaCalibracao.Fig,'style','edit','string',360,'units','normalized','position',[0.05 0.825 0.06 0.05],'horizontalalignment','center','callback','AtualizarEdit');
TelaCalibracao.Botao.Edit(3) = uicontrol(TelaCalibracao.Fig,'style','edit','string',0,  'units','normalized','position',[0.37 0.875 0.06 0.05],'horizontalalignment','center','callback','AtualizarEdit');
TelaCalibracao.Botao.Edit(4) = uicontrol(TelaCalibracao.Fig,'style','edit','string',100,'units','normalized','position',[0.37 0.825 0.06 0.05],'horizontalalignment','center','callback','AtualizarEdit');
TelaCalibracao.Botao.Edit(5) = uicontrol(TelaCalibracao.Fig,'style','edit','string',0,  'units','normalized','position',[0.69 0.875 0.06 0.05],'horizontalalignment','center','callback','AtualizarEdit');
TelaCalibracao.Botao.Edit(6) = uicontrol(TelaCalibracao.Fig,'style','edit','string',100,'units','normalized','position',[0.69 0.825 0.06 0.05],'horizontalalignment','center','callback','AtualizarEdit');

% Cria os sliders para o padrão de cada cor
TelaCalibracao.Botao.Slider(1) = uicontrol(TelaCalibracao.Fig,'style','slider','Min',0,'Max',360,'value',0,  'sliderstep',[1/360 1/10],'units','normalized','position',[0.12 0.875 0.19 0.05],'backgroundcolor',hsv2rgb([0 0 0.8]),'callback','AtualizarSlider');
TelaCalibracao.Botao.Slider(2) = uicontrol(TelaCalibracao.Fig,'style','slider','Min',0,'Max',360,'value',360,'sliderstep',[1/360 1/10],'units','normalized','position',[0.12 0.825 0.19 0.05],'backgroundcolor',hsv2rgb([0 0 0.6]),'callback','AtualizarSlider');
TelaCalibracao.Botao.Slider(3) = uicontrol(TelaCalibracao.Fig,'style','slider','Min',0,'Max',100,'value',0,  'sliderstep',[1/100 1/10],'units','normalized','position',[0.44 0.875 0.19 0.05],'backgroundcolor',hsv2rgb([0 0 0.8]),'callback','AtualizarSlider');
TelaCalibracao.Botao.Slider(4) = uicontrol(TelaCalibracao.Fig,'style','slider','Min',0,'Max',100,'value',100,'sliderstep',[1/100 1/10],'units','normalized','position',[0.44 0.825 0.19 0.05],'backgroundcolor',hsv2rgb([0 0 0.6]),'callback','AtualizarSlider');
TelaCalibracao.Botao.Slider(5) = uicontrol(TelaCalibracao.Fig,'style','slider','Min',0,'Max',100,'value',0,  'sliderstep',[1/100 1/10],'units','normalized','position',[0.76 0.875 0.19 0.05],'backgroundcolor',hsv2rgb([0 0 0.8]),'callback','AtualizarSlider');
TelaCalibracao.Botao.Slider(6) = uicontrol(TelaCalibracao.Fig,'style','slider','Min',0,'Max',100,'value',100,'sliderstep',[1/100 1/10],'units','normalized','position',[0.76 0.825 0.19 0.05],'backgroundcolor',hsv2rgb([0 0 0.6]),'callback','AtualizarSlider');

% Cria o espaço para o grupo de botões de cores
TelaCalibracao.Botao.Cores = uibuttongroup(TelaCalibracao.Fig,'units','normalized','position',[0 0.15 0.2 0.65],'selectionchangedfcn','ProcessarImagem');

% Cria um botão para cada cor e marca a opção total como padrão
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Vermelho','units','normalized','position',[0 7/8 1 1/8],'backgroundcolor',[0.8 0.0 0.0],'fontsize',09);
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Laranja' ,'units','normalized','position',[0 6/8 1 1/8],'backgroundcolor',[0.8 0.4 0.0],'fontsize',09);
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Amarelo' ,'units','normalized','position',[0 5/8 1 1/8],'backgroundcolor',[0.8 0.8 0.0],'fontsize',09);
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Verde'   ,'units','normalized','position',[0 4/8 1 1/8],'backgroundcolor',[0.0 0.8 0.0],'fontsize',09);
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Ciano'   ,'units','normalized','position',[0 3/8 1 1/8],'backgroundcolor',[0.0 0.8 0.8],'fontsize',09);
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Azul'    ,'units','normalized','position',[0 2/8 1 1/8],'backgroundcolor',[0.0 0.0 0.8],'fontsize',09);
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Magenta' ,'units','normalized','position',[0 1/8 1 1/8],'backgroundcolor',[0.8 0.0 0.8],'fontsize',09);
uicontrol(TelaCalibracao.Botao.Cores,'style','radiobutton','string','Total'   ,'units','normalized','position',[0 0/8 1 1/8],'backgroundcolor',[0.8 0.8 0.8],'fontsize',09,'value',1);

% Determina o local da tela de calibração onde será exibida a imagem
TelaCalibracao.Painel = uipanel('parent',TelaCalibracao.Fig,'units','normalized','position',[0.2 0.15 0.8 0.65]);
TelaCalibracao.Imagem = subplot(1,1,1,'parent',TelaCalibracao.Painel,'position',[0 0 1 1]); axis off

% Cria os botões para segmentar as cores
TelaCalibracao.Botao.Pixels = uicontrol(TelaCalibracao.Fig,'style','pushbutton','string','Segmentar Pixels' ,'units','normalized','position',[0.15 0.025 0.3 0.1],'fontsize',09,'callback','CriarPixels');
TelaCalibracao.Botao.Salvar = uicontrol(TelaCalibracao.Fig,'style','pushbutton','string','Salvar Calibração','units','normalized','position',[0.55 0.025 0.3 0.1],'fontsize',09,'callback','SalvarCalibracao' );