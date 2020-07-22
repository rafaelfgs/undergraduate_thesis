%% Inicia a Tela da Inteligência e Configura os Botões

% Desabilita os botões da Inteligência
set(TelaPrincipal.Botao(3:4),'enable','off')

% Inicia a tela principal, altera as propriedades e chama a função FecharINT se for fechada
TelaINT.Fig = figure;
set(TelaINT.Fig,'menubar','none','numbertitle','off','name','Tela de Opções da Inteligência','closerequestfcn','FecharINT')

% Insere os controles para alterar a comunicação com os robôs
uicontrol(TelaINT.Fig,'style','text','string','Porta Serial Utilizada','units','normalized','position',[0.06 0.80 0.26 0.08],'HorizontalAlignment','center','fontsize',11)
TelaINT.Edit(1) = uicontrol(TelaINT.Fig,'style','edit','string',ConstantesINT.Porta,'units','normalized','position',[0.34 0.82 0.12 0.08],'HorizontalAlignment','center','fontsize',11,'callback','AtualizarConstantesINT','enable','off');
TelaINT.Botao(1) = uicontrol(TelaINT.Fig,'style','pushbutton','string','Encerrar Comunicação','units','normalized','position',[0.10 0.66 0.32 0.10],'fontsize',11,'callback','IniciarComunicacao');

% Insere os controles para alterar o tempo de envio dos dados
uicontrol(TelaINT.Fig,'style','text','string','Tempo de Envio dos Dados','units','normalized','position',[0.07 0.48 0.38 0.08],'HorizontalAlignment','center','fontsize',13)
uicontrol(TelaINT.Fig,'style','text','string','Em segundos','units','normalized','position',[0.10 0.36 0.16 0.08],'HorizontalAlignment','center','fontsize',09)
TelaINT.Edit(2) = uicontrol(TelaINT.Fig,'style','edit','string',ConstantesINT.TempoEnvio,'units','normalized','position',[0.28 0.38 0.12 0.08],'HorizontalAlignment','center','fontsize',11,'callback','AtualizarConstantesINT');

% Insere os controles para alterar a frequência da Demostração
uicontrol(TelaINT.Fig,'style','text','string','Frequência da Demontração','units','normalized','position',[0.07 0.22 0.38 0.08],'HorizontalAlignment','center','fontsize',13)
uicontrol(TelaINT.Fig,'style','text','string','Em graus/s','units','normalized','position',[0.10 0.10 0.16 0.08],'HorizontalAlignment','center','fontsize',09)
TelaINT.Edit(3) = uicontrol(TelaINT.Fig,'style','edit','string',ConstantesINT.Frequencia,'units','normalized','position',[0.28 0.12 0.12 0.08],'HorizontalAlignment','center','fontsize',11,'callback','AtualizarConstantesINT');

% Insere os textos com os nomes do Goleiro, do Zagueiro e do Atacante
uicontrol(TelaINT.Fig,'style','text','string','Função do Robôs','units','normalized','position',[0.55 0.80 0.35 0.10],'fontsize',13);
uicontrol(TelaINT.Fig,'style','text','string','Goleiro' ,'units','normalized','position',[0.63 0.76 0.10 0.04],'fontsize',09);
uicontrol(TelaINT.Fig,'style','text','string','Zagueiro','units','normalized','position',[0.73 0.76 0.10 0.04],'fontsize',09);
uicontrol(TelaINT.Fig,'style','text','string','Atacante','units','normalized','position',[0.83 0.76 0.10 0.04],'fontsize',09);

% Insere um grupo de botões para a escolha do Robô 1
TelaINT.AtivRobo(1) = uicontrol(TelaINT.Fig,'style','checkbox','string','Robô 1','units','normalized','position',[0.52 0.67 0.25 0.08],'fontsize',09,'callback','AtualizarConstantesINT');
TelaINT.FuncRobo(1) = uibuttongroup(TelaINT.Fig,'units','normalized','position',[0.67 0.67 0.3 0.08],'bordertype','none','selectionchangedfcn','AtualizarConstantesINT');
TelaINT.RadioRobo(1,1) = uicontrol(TelaINT.FuncRobo(1),'style','radiobutton','units','normalized','position',[0/3 0 1/3 1],'fontsize',09);
TelaINT.RadioRobo(2,1) = uicontrol(TelaINT.FuncRobo(1),'style','radiobutton','units','normalized','position',[1/3 0 1/3 1],'fontsize',09);
TelaINT.RadioRobo(3,1) = uicontrol(TelaINT.FuncRobo(1),'style','radiobutton','units','normalized','position',[2/3 0 1/3 1],'fontsize',09);

% Insere um grupo de botões para a escolha do Robô 2
TelaINT.AtivRobo(2) = uicontrol(TelaINT.Fig,'style','checkbox','string','Robô 2','units','normalized','position',[0.52 0.58 0.25 0.08],'fontsize',09,'callback','AtualizarConstantesINT');
TelaINT.FuncRobo(2) = uibuttongroup(TelaINT.Fig,'units','normalized','position',[0.67 0.58 0.3 0.08],'bordertype','none','selectionchangedfcn','AtualizarConstantesINT');
TelaINT.RadioRobo(1,2) = uicontrol(TelaINT.FuncRobo(2),'style','radiobutton','units','normalized','position',[0/3 0 1/3 1],'fontsize',09);
TelaINT.RadioRobo(2,2) = uicontrol(TelaINT.FuncRobo(2),'style','radiobutton','units','normalized','position',[1/3 0 1/3 1],'fontsize',09);
TelaINT.RadioRobo(3,2) = uicontrol(TelaINT.FuncRobo(2),'style','radiobutton','units','normalized','position',[2/3 0 1/3 1],'fontsize',09);

% Insere um grupo de botões para a escolha do Robô 3
TelaINT.AtivRobo(3) = uicontrol(TelaINT.Fig,'style','checkbox','string','Robô 3','units','normalized','position',[0.52 0.49 0.25 0.08],'fontsize',09,'callback','AtualizarConstantesINT');
TelaINT.FuncRobo(3) = uibuttongroup(TelaINT.Fig,'units','normalized','position',[0.67 0.49 0.3 0.08],'bordertype','none','selectionchangedfcn','AtualizarConstantesINT');
TelaINT.RadioRobo(1,3) = uicontrol(TelaINT.FuncRobo(3),'style','radiobutton','units','normalized','position',[0/3 0 1/3 1],'fontsize',09);
TelaINT.RadioRobo(2,3) = uicontrol(TelaINT.FuncRobo(3),'style','radiobutton','units','normalized','position',[1/3 0 1/3 1],'fontsize',09);
TelaINT.RadioRobo(3,3) = uicontrol(TelaINT.FuncRobo(3),'style','radiobutton','units','normalized','position',[2/3 0 1/3 1],'fontsize',09);

% Insere um grupo de botões para a escolha do campo
uicontrol(TelaINT.Fig,'style','text','string','Nosso Campo de Defesa','units','normalized','position',[0.50 0.32 0.45 0.10],'fontsize',13);
TelaINT.Campo = uibuttongroup(TelaINT.Fig,'units','normalized','position',[0.575 0.26 0.375 0.10],'bordertype','none','selectionchangedfcn','AtualizarConstantesINT');
TelaINT.RadioCampo(1) = uicontrol(TelaINT.Campo,'style','radiobutton','string','Esquerda','units','normalized','position',[0/2 0 1/2 1],'fontsize',09);
TelaINT.RadioCampo(2) = uicontrol(TelaINT.Campo,'style','radiobutton','string','Direita' ,'units','normalized','position',[1/2 0 1/2 1],'fontsize',09);

% Insere o botão das constantes de movimento
TelaINT.Botao(2) = uicontrol(TelaINT.Fig,'style','pushbutton','string','Constantes de Movimento','units','normalized','position',[0.55 0.10 0.35 0.10],'fontsize',11,'callback','CriarConstantesINT');

% Verifica se o Robô 1 estão ativo e define sua função
if ConstantesINT.Ativo(1)
    set(TelaINT.AtivRobo(1),'value',1)
    set(TelaINT.RadioRobo(ConstantesINT.Funcao(1),1),'value',1)
else
    set(TelaINT.RadioRobo(:,1),'enable','off')
end

% Verifica se o Robô 2 estão ativo e define sua função
if ConstantesINT.Ativo(2)
    set(TelaINT.AtivRobo(2),'value',1)
    set(TelaINT.RadioRobo(ConstantesINT.Funcao(2),2),'value',1)
else
    set(TelaINT.RadioRobo(:,2),'enable','off')
end

% Verifica se o Robô 3 estão ativo e define sua função
if ConstantesINT.Ativo(3)
    set(TelaINT.AtivRobo(3),'value',1)
    set(TelaINT.RadioRobo(ConstantesINT.Funcao(3),3),'value',1)
else
    set(TelaINT.RadioRobo(:,3),'enable','off')
end

% Verifica o lado do campo de defesa
set(TelaINT.RadioCampo((ConstantesINT.Campo+3)/2),'value',1)

% Desabilita o botão Encerrar Comunicação caso esteja em Jogo ou Teste
if Partida.EmJogo || Partida.EmTeste
    set(TelaINT.Botao(1),'enable','off')
end