%% Inicia a segmenta��o das cores

if Partida.Segmentacao == 0
    
    % Inicia a exibi��o da segmenta��o da imagem
    Partida.Segmentacao = 1;
    Partida.Resultados = 0;
    set(TelaJogo.Botao(1),'string','Fechar Segmenta��o')
    set(TelaJogo.Botao(2),'string','Mostrar Resultados')
    
    % Limpa os objetos vis�veis na figura atual
    cla reset
    
else
    
    % Para a exibi��o da segmenta��o da imagem
    Partida.Segmentacao = 0;
    set(TelaJogo.Botao(1),'string','Mostrar Segmenta��o')
    
    % Limpa os objetos vis�veis na figura atual
    cla reset
    axis off
    
end