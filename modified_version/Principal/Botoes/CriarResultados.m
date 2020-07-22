%% Inicia o Resultado Final

if ~Partida.ExibeResultados
    
    % Limpa os objetos visíveis na figura atual
    cla reset   
    
    % Cores exibidas em Resultados [R;O;Y;G;C;B;M]
    TelaJogo.Cores = [1 0 0; 1 .5 0; 1 1 0; 0 1 0; 0 1 1; 0 0 1; 1 0 1];
    
    % Inicia a exibição dos resultados do programa
    Partida.ExibeSegmentacao = false;
    Partida.ExibeResultados = true;
    
    % Altera a string dos botões
    if Partida.EmJogo
        set(TelaJogo.Botao(1),'string','Mostrar Segmentação')
        set(TelaJogo.Botao(2),'string','Fechar Resultados')
    else
        set(TelaJogo.Botao(1),'string','Ver Segmentação')
    end
    
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
    
    % Limpa os objetos visíveis na figura atual
    cla reset
    axis off
    
    % Para a exibição dos resultados do programa
    Partida.ExibeResultados = false;
    set(TelaJogo.Botao(2),'string','Mostrar Resultados')
    
    % Exibe um texto de Enviando Dados na Tela
    if Partida.EmJogo && Partida.EmEnvio
        TelaJogo.Envio = text(0.5,0.5,['Enviando' 10 10 'Dados'],'parent',TelaJogo.Imagem,...
                              'horizontalalignment','center','fontsize',48);
    end
    
end