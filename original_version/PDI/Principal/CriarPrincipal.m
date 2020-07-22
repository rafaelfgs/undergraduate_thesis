%% Inicia a tela principal e configura os botões

% Inicia a tela principal, altera as propriedades e chama a função FecharPrincipal se for fechada
TelaPrincipal.Fig = figure;
set(TelaPrincipal.Fig,'menubar','none','numbertitle','off','name','Tela Principal','closerequestfcn','FecharPrincipal')

% Insere os botões
TelaPrincipal.Botao(1) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Câmera'     ,'units','normalized','position',[0.075 0.850 0.250 0.100],'fontsize',09,'Callback','IniciarCamera');
TelaPrincipal.Botao(2) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Abrir Preview'      ,'units','normalized','position',[0.375 0.850 0.250 0.100],'fontsize',09,'Callback','AbrirPreview');
TelaPrincipal.Botao(3) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Otimizar Imagem'    ,'units','normalized','position',[0.675 0.850 0.250 0.100],'fontsize',09,'Callback','OtimizarImagem');
TelaPrincipal.Botao(4) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Jogo'       ,'units','normalized','position',[0.300 0.525 0.400 0.200],'fontsize',18,'Callback','IniciarJogo');
TelaPrincipal.Botao(5) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Calibrar Cores'     ,'units','normalized','position',[0.125 0.300 0.325 0.125],'fontsize',11,'Callback','IniciarCalibracao');
TelaPrincipal.Botao(6) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Definir Campo'      ,'units','normalized','position',[0.550 0.300 0.325 0.125],'fontsize',11,'Callback','IniciarCampo');
TelaPrincipal.Botao(7) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Comunicação','units','normalized','position',[0.125 0.100 0.325 0.125],'fontsize',11,'Callback','ComunicarINT');
TelaPrincipal.Botao(8) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Definir Constantes' ,'units','normalized','position',[0.550 0.100 0.325 0.125],'fontsize',11,'Callback','IniciarConstantes');

% Desabilita os botões que necessitam da câmera
set(TelaPrincipal.Botao(4:6),'enable','off')

% Habilita ou desabilita o botão de otimizar imagem, dependendo do formato
if Camera.Tipo == 1
    set(TelaPrincipal.Botao(3),'enable','off')
elseif Camera.Tipo == 2
    set(TelaPrincipal.Botao(3),'enable','on')
end