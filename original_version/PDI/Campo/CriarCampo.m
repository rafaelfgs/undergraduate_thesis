%% Inicia a tela de definir campo

% Abre e configura uma figura
TelaCampo.Fig = figure;
set(TelaCampo.Fig,'menubar','none','numbertitle','off')
set(TelaCampo.Fig,'name','Definição do Campo','closerequestfcn','FecharCampo')

% Determina o local da tela onde será exibida a imagem
TelaCampo.Painel = uipanel('parent',TelaCampo.Fig,'units','normalized','position',[0.1 0.05 0.8 0.8]);
TelaCampo.Imagem = subplot(1,1,1,'parent',TelaCampo.Painel,'position',[0 0 1 1]); axis off

% Cria os textos e os botões da tela
TelaCampo.Texto(1) = uicontrol(TelaCampo.Fig,'style','text','string','Ponto (x,y): ' ,'units','normalized','position',[0.35 0.89 0.2 0.05],'fontsize',09);
TelaCampo.Texto(2) = uicontrol(TelaCampo.Fig,'style','text','string','    -    ','units','normalized','position',[0.5 0.89 0.1 0.05],'fontsize',09);
TelaCampo.Botao(1) = uicontrol(TelaCampo.Fig,'style','pushbutton','string','Atualizar Campo','units','normalized','position',[0.1 0.88 0.25 0.09],'fontsize',09,'callback','AtualizarCampo');
TelaCampo.Botao(2) = uicontrol(TelaCampo.Fig,'style','pushbutton','string','Salvar Relação PX2M','units','normalized','position',[0.65 0.88 0.25 0.09],'fontsize',09,'callback','SalvarCampo');

% Desabilita o botão de Atualizar o Campo se estiver em Jogo
% if Partida.Jogo == 1
%     set(TelaCampo.Botao(1),'enable','off')
% end