%% Inicia a tela principal e configura os bot�es

% Inicia a tela principal, altera as propriedades e chama a fun��o FecharPrincipal se for fechada
TelaPrincipal.Fig = figure;
set(TelaPrincipal.Fig,'menubar','none','numbertitle','off','name','Tela Principal','closerequestfcn','FecharPrincipal')

% Insere os bot�es
TelaPrincipal.Botao(1) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Preparar PDI'          ,'units','normalized','position',[0.10 0.72 0.36 0.16],'fontsize',12,'Callback','PrepararPDI');
TelaPrincipal.Botao(2) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Op��es do PDI'         ,'units','normalized','position',[0.56 0.72 0.36 0.16],'fontsize',12,'Callback','CriarPDI');
TelaPrincipal.Botao(3) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Preparar Intelig�ncia' ,'units','normalized','position',[0.10 0.42 0.36 0.16],'fontsize',12,'Callback','PrepararINT');
TelaPrincipal.Botao(4) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Op��es da Intelig�ncia','units','normalized','position',[0.56 0.42 0.36 0.16],'fontsize',12,'Callback','CriarINT');
TelaPrincipal.Botao(5) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Jogo'          ,'units','normalized','position',[0.10 0.12 0.36 0.16],'fontsize',12,'Callback','IniciarJogo');
TelaPrincipal.Botao(6) = uicontrol(TelaPrincipal.Fig,'style','pushbutton','string','Iniciar Teste'         ,'units','normalized','position',[0.56 0.12 0.36 0.16],'fontsize',12,'Callback','IniciarTeste');

% Desabilita os bot�es que necessitam do PDI e da Intelig�ncia funcionando
set(TelaPrincipal.Botao([2 4 5 6]),'enable','off')