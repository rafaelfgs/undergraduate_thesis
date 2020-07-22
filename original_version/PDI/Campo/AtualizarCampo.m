%% Permite ao usu�rio determinar os 24 pontos chave do campo

try
    
    % Percorre os pontos chave do campo
    for ii = 1:size(Relacao.Milimetros,1)
        
        % Desabilita os bot�es de Iniciar Jogo e de salvar
        try set(TelaPrincipal.Botao(4),'enable','off'), catch, end
        set(TelaCampo.Botao(2),'enable','off')
        
        % Exibe a imagem atual da C�mera
        imshow(imresize(getsnapshot(Camera.Video),Camera.Redimensionar),'parent',TelaCampo.Imagem)
        
        % Exibe os pontos selecionados na tela
        hold on
        plot(Relacao.Pixels(1:ii-1,1),Relacao.Pixels(1:ii-1,2),'r.','markersize',14,'parent',TelaCampo.Imagem)
        hold off
        
        % Altera o texto do pr�ximo ponto a ser selecionado
        set(TelaCampo.Texto(2),'string',num2str(Relacao.Milimetros(ii,:)))
        
        % Permite ao usu�rio determinar os 24 pontos
        Relacao.Pixels(ii,:) = ginput(1);
        
    end
    
    % Habilita o bot�o de Iniciar Jogo
    if isrunning(Camera.Video) && exist('Calibracao','var') && exist('Constantes','var') && Partida.Comunicacao == 1 && Partida.Jogo == 0
        set(TelaPrincipal.Botao(4),'enable','on')
    end
    
    % Altera o texto do pr�ximo ponto e habilita o bot�o de Salvar Campo
    set(TelaCampo.Texto(2),'string',' - ')
    set(TelaCampo.Botao(2),'enable','on')
    
    % Chama a fun��o para determinar a rela��o entre pixels e mil�metros
    RelacionarCampo
    
    % Chama a fun��o para exibir os pontos na tela
    PlotarCampo
    
catch
    
    % Habilita o bot�o de Iniciar Jogo
    if isrunning(Camera.Video) && exist('Calibracao','var') && exist('Constantes','var') && Partida.Comunicacao == 1 && Partida.Jogo == 0
        set(TelaPrincipal.Botao(4),'enable','on')
    end
    
end