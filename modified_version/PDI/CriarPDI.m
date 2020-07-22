%% Inicia a Tela do PDI e Configura os Botões

% Desabilita os botões do PDI
set(TelaPrincipal.Botao(1:2),'enable','off')

% Inicia a tela principal, altera as propriedades e chama a função FecharPDI se for fechada
TelaPDI.Fig = figure;
set(TelaPDI.Fig,'menubar','none','numbertitle','off','name','Tela de Opções do PDI','closerequestfcn','FecharPDI')

% Insere os botões
TelaPDI.Botao(1) = uicontrol(TelaPDI.Fig,'style','pushbutton','string','Encerrar Câmera'     ,'units','normalized','position',[0.12 0.73 0.3 0.12],'fontsize',11,'Callback','IniciarCamera');
TelaPDI.Botao(2) = uicontrol(TelaPDI.Fig,'style','pushbutton','string','Abrir Preview'      ,'units','normalized','position',[0.58 0.73 0.3 0.12],'fontsize',11,'Callback','AbrirPreview');
TelaPDI.Botao(3) = uicontrol(TelaPDI.Fig,'style','pushbutton','string','Otimizar Imagem'    ,'units','normalized','position',[0.12 0.44 0.3 0.12],'fontsize',11,'Callback','EditarCamera');
TelaPDI.Botao(4) = uicontrol(TelaPDI.Fig,'style','pushbutton','string','Calibrar Cores'     ,'units','normalized','position',[0.58 0.44 0.3 0.12],'fontsize',11,'Callback','IniciarCalibracao');
TelaPDI.Botao(5) = uicontrol(TelaPDI.Fig,'style','pushbutton','string','Definir Campo'      ,'units','normalized','position',[0.12 0.15 0.3 0.12],'fontsize',11,'Callback','IniciarCampo');
TelaPDI.Botao(6) = uicontrol(TelaPDI.Fig,'style','pushbutton','string','Definir Constantes' ,'units','normalized','position',[0.58 0.15 0.3 0.12],'fontsize',11,'Callback','IniciarConstantesPDI');

% Desabilita o botão de configurar os parâmetros da câmera para WINVIDEO
if Camera.Tipo == 2
    set(TelaPDI.Botao(3),'enable','off')
end

% Desabilita o botão Encerrar Câmera caso esteja em Jogo ou Teste
if Partida.EmJogo || Partida.EmTeste
    set(TelaPDI.Botao(1),'enable','off')
end