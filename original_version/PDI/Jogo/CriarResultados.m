%% Inicia o resultado final

if Partida.Resultados == 0
    
    TelaJogo.Cores = [1 0 0; 1 .5 0; 1 1 0; 0 1 0; 0 1 1; 0 0 1; 1 0 1];
    
    % Inicia a exibição dos resultados do programa
    Partida.Segmentacao = 0;
    Partida.Resultados = 1;
    set(TelaJogo.Botao(1),'string','Mostrar Segmentação')
    set(TelaJogo.Botao(2),'string','Fechar Resultados')
    
    % Limpa os objetos visíveis na figura atual
    cla reset    
    
    % Altera o eixo
    axis([-1000 1000 -800 800])
    
    hold on
    
    % Deixa preto o fundo da tela
    rectangle('position',[-1000 -800 2000 1600],'facecolor','k')
    
    % Cria as bordas do campo
    TelaJogo.Linha(1)  = line([-680  680],[ 650  650],'color','w','linewidth',2);
    TelaJogo.Linha(2)  = line([ 680  750],[ 650  580],'color','w','linewidth',2);
    TelaJogo.Linha(3)  = line([ 750  750],[ 580 -580],'color','w','linewidth',2);
    TelaJogo.Linha(4)  = line([ 750  680],[-580 -650],'color','w','linewidth',2);
    TelaJogo.Linha(5)  = line([ 680 -680],[-650 -650],'color','w','linewidth',2);
    TelaJogo.Linha(6)  = line([-680 -750],[-650 -580],'color','w','linewidth',2);
    TelaJogo.Linha(7)  = line([-750 -750],[-580  580],'color','w','linewidth',2);
    TelaJogo.Linha(8)  = line([-750 -680],[ 580  650],'color','w','linewidth',2);
    TelaJogo.Linha(9)  = line([ 000  000],[-650  650],'color','w','linewidth',2);
    TelaJogo.Linha(10) = line([-750 -600],[ 350  350],'color','w','linewidth',2);
    TelaJogo.Linha(11) = line([-600 -600],[ 350 -350],'color','w','linewidth',2);
    TelaJogo.Linha(12) = line([-750 -600],[-350 -350],'color','w','linewidth',2);
    TelaJogo.Linha(13) = line([ 750  600],[ 350  350],'color','w','linewidth',2);
    TelaJogo.Linha(14) = line([ 600  600],[ 350 -350],'color','w','linewidth',2);
    TelaJogo.Linha(15) = line([ 750  600],[-350 -350],'color','w','linewidth',2);
    TelaJogo.Linha(16) = rectangle('position',[-200 -200 400 400],'curvature',[1 1],'edgecolor','w','linewidth',2);
    
    hold off
    
else
    
    % Para a exibição dos resultados do programa
    Partida.Resultados = 0;
    set(TelaJogo.Botao(2),'string','Mostrar Resultados')
    
    % Limpa os objetos visíveis na figura atual
    cla reset
    axis off
    
end