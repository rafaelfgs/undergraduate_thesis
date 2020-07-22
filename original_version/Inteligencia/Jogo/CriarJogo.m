%% Cria a tela para exibir os resultados

% Desabilita os botões da Tela Principal
set(TelaPrincipal.Botao,'enable','off')
set(TelaPrincipal.AtivRobo,'enable','off')
set(TelaPrincipal.FuncRobo,'visible','off')
set(TelaPrincipal.Campo,'visible','off')

% Abre uma nova janela
TelaJogo.Fig = figure;

% Modifica os parâmetros da tela e chama a função FecharTelaJogo caso a tela for fechada
set(TelaJogo.Fig, 'Toolbar', 'none', 'Dockcontrols', 'off', 'Menubar', 'none', 'NumberTitle', 'off')
set(TelaJogo.Fig,'Name','Campo de Jogo','CloseRequestFcn','FecharJogo')

% Cria o painel central
TelaJogo.Painel = uipanel(TelaJogo.Fig,'Units','normalized','Position',[0.1 0.15 0.8 0.8]);
TelaJogo.Imagem = subplot(1,1,1,'Parent',TelaJogo.Painel,'Position',[0 0 1 1]); axis off
TelaJogo.Eixo = gca;

% Cria os botões da tela
TelaJogo.Botao(1) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Mostrar Resultados','units','normalized','position',[0.15 0.025 0.3 0.1],'fontsize',09,'Callback','CriarResultados');
TelaJogo.Botao(2) = uicontrol(TelaJogo.Fig,'style','pushbutton','string','Iniciar Jogo'      ,'units','normalized','position',[0.55 0.025 0.3 0.1],'fontsize',09,'Callback','PausarJogo'     );