%% Inicia a segmentação das cores

if Partida.Segmentacao == 0
    
    % Inicia a exibição da segmentação da imagem
    Partida.Segmentacao = 1;
    Partida.Resultados = 0;
    set(TelaJogo.Botao(1),'string','Fechar Segmentação')
    set(TelaJogo.Botao(2),'string','Mostrar Resultados')
    
    % Limpa os objetos visíveis na figura atual
    cla reset
    
else
    
    % Para a exibição da segmentação da imagem
    Partida.Segmentacao = 0;
    set(TelaJogo.Botao(1),'string','Mostrar Segmentação')
    
    % Limpa os objetos visíveis na figura atual
    cla reset
    axis off
    
end