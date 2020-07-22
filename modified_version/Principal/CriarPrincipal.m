%% Inicia a tela principal e configura os botões

% Inicia a tela principal, altera as propriedades e chama a função FecharPrincipal se for fechada
TelaPrincipal.Fig = figure;
set(TelaPrincipal.Fig,'menubar','none','numbertitle','off','name','Tela Principal','closerequestfcn','FecharPrincipal')

% Insere os botões
TelaPrincipal.Botao(1) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Preparar PDI'          ,'units','normalized','position',[0.10 0.72 0.36 0.16],'fontsize',12,'Callback','PrepararPDI');
TelaPrincipal.Botao(2) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Opções do PDI'         ,'units','normalized','position',[0.56 0.72 0.36 0.16],'fontsize',12,'Callback','CriarPDI');
TelaPrincipal.Botao(3) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Preparar Inteligência' ,'units','normalized','position',[0.10 0.42 0.36 0.16],'fontsize',12,'Callback','PrepararINT');
TelaPrincipal.Botao(4) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Opções da Inteligência','units','normalized','position',[0.56 0.42 0.36 0.16],'fontsize',12,'Callback','CriarINT');
TelaPrincipal.Botao(5) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Jogo'          ,'units','normalized','position',[0.10 0.12 0.36 0.16],'fontsize',12,'Callback','IniciarJogo');
TelaPrincipal.Botao(6) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Teste'         ,'units','normalized','position',[0.56 0.12 0.36 0.16],'fontsize',12,'Callback','IniciarTeste');

% Desabilita os botões que necessitam do PDI e da Inteligência funcionando
set(TelaPrincipal.Botao([2 4 5 6]),'enable','off')