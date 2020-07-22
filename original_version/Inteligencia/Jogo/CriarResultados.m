%% Inicia o resultado final

if Partida.Resultados == 0
    
    % Inicia a exibição dos resultados do programa
    Partida.Resultados = 1;
    set(TelaJogo.Botao(1),'string','Fechar Resultados')
    
    % Limpa os objetos visíveis na figura atual
    cla reset
    
    % Altera o eixo
    axis([-900 900 -850 850])
    
    hold on
    
    % Deixa preto o fundo da tela
    rectangle('position',[-900 -850 1800 1700],'facecolor',[.2 .2 .2])
    
    % Cria as bordas do campo
    line([-680  680],[ 650  650],'color','w','linewidth',2)
    line([ 680  750],[ 650  580],'color','w','linewidth',2)
    line([ 750  750],[ 580 -580],'color','w','linewidth',2)
    line([ 750  680],[-580 -650],'color','w','linewidth',2)
    line([ 680 -680],[-650 -650],'color','w','linewidth',2)
    line([-680 -750],[-650 -580],'color','w','linewidth',2)
    line([-750 -750],[-580  580],'color','w','linewidth',2)
    line([-750 -680],[ 580  650],'color','w','linewidth',2)
    line([-750 -600],[ 350  350],'color','w','linewidth',2)
    line([-600 -600],[ 350 -350],'color','w','linewidth',2)
    line([-750 -600],[-350 -350],'color','w','linewidth',2)
    line([ 750  600],[ 350  350],'color','w','linewidth',2)
    line([ 600  600],[ 350 -350],'color','w','linewidth',2)
    line([ 750  600],[-350 -350],'color','w','linewidth',2)
    line([ 000  000],[-650  650],'color','w','linewidth',2)
    rectangle('position',[-200 -200 400 400],'curvature',[1 1],'edgecolor','w','linewidth',2)
    
    hold off
    
else
    
    % Para a exibição dos resultados do programa
    Partida.Resultados = 0;
    set(TelaJogo.Botao(1),'string','Mostrar Resultados')
    
    % Limpa os objetos visíveis na figura atual
    cla reset
    axis off
    
end