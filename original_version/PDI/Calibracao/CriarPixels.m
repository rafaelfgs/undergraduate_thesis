%% Cria��o da tela para a segmenta��o

% Inicia e modifica os par�metros da tela de pixels
TelaPixels.Fig = figure;
set(TelaPixels.Fig,'menubar','none','numbertitle','off')
set(TelaPixels.Fig,'name','Sele��o de pixels')

% Cria os bot�es de selecionar e segmentar os pixels
TelaPixels.Botao(1) = uicontrol(TelaPixels.Fig,'style','pushbutton','string','Selecionar Pixels'     ,'units','normalized','position',[0.15 0.025 0.3 0.1],'fontsize',09,'callback','SelecionarPixels');
TelaPixels.Botao(2) = uicontrol(TelaPixels.Fig,'style','pushbutton','string','Atualizar Segmenta��o' ,'units','normalized','position',[0.55 0.025 0.3 0.1],'fontsize',09,'callback','AtualizarPixels');
set(TelaPixels.Botao(2),'enable','off')

% Determina o local da tela de pixels onde ser� exibida a imagem
TelaPixels.Painel = uipanel(TelaPixels.Fig,'units','normalized','position',[0.1 0.15 0.8 0.8]);
TelaPixels.Imagem = subplot(1,1,1,'parent',TelaPixels.Painel,'position',[0 0 1 1]);

% Cria e exibe a imagem atual
TelaPixels.Atual = imresize(getsnapshot(Camera.Video),Camera.Redimensionar);
imshow(TelaPixels.Atual,'parent',TelaPixels.Imagem)

% Habilita a fun��o de zoom na tela
zoom on