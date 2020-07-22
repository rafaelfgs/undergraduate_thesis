%% Inicia a Segmenta��o das Cores

if ~Partida.ExibeSegmentacao
    
    % Limpa os objetos vis�veis na figura atual
    cla reset
    
    % Inicia a exibi��o da segmenta��o da imagem
    Partida.ExibeResultados = false;
    Partida.ExibeSegmentacao = true;
    
    % Altera a string dos bot�es
    if Partida.EmJogo
        set(TelaJogo.Botao(1),'string','Fechar Segmenta��o')
        set(TelaJogo.Botao(2),'string','Mostrar Resultados')
    else
        set(TelaJogo.Botao(1),'string','Ver Campo')
    end
    
else
    
    % Limpa os objetos vis�veis na figura atual
    cla reset
    axis off
    
    % Para a exibi��o da segmenta��o da imagem
    Partida.ExibeSegmentacao = false;
    
    % Altera a string dos bot�es
    if Partida.EmJogo
        set(TelaJogo.Botao(1),'string','Mostrar Segmenta��o')
    else
        CriarResultados
    end
    
    % Exibe um texto de Enviando Dados na Tela
    if Partida.EmJogo && Partida.EmEnvio
        TelaJogo.Envio = text(0.5,0.5,['Enviando' 10 10 'Dados'],'parent',TelaJogo.Imagem,...
                              'horizontalalignment','center','fontsize',48);
    end
    
end