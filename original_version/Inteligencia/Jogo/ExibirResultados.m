%% Exibe na tela os contróides dos Robôs e da bola e local desejado de cada Robô

% Apaga os resultados anteriores e espera
try delete(TelaJogo.Plot), delete(TelaJogo.Texto), catch, end
hold(TelaJogo.Eixo,'on')

% Robô 1
TelaJogo.Plot(1)  = plot(Robo(1).Posicao(1),Robo(1).Posicao(2),'.','color',[0 1 0],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(1) = text(Robo(1).Posicao(1),Robo(1).Posicao(2)+80,'Robô 1','HorizontalAlignment','center','color',[0 1 0],'Parent',TelaJogo.Imagem);

% Robô 2
TelaJogo.Plot(2)  = plot(Robo(2).Posicao(1),Robo(2).Posicao(2),'.','color',[0 1 0],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(2) = text(Robo(2).Posicao(1),Robo(2).Posicao(2)+80,'Robô 2','HorizontalAlignment','center','color',[0 1 0],'Parent',TelaJogo.Imagem);

% Robô 3
TelaJogo.Plot(3)  = plot(Robo(3).Posicao(1),Robo(3).Posicao(2),'.','color',[0 1 0],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(3) = text(Robo(3).Posicao(1),Robo(3).Posicao(2)+80,'Robô 3','HorizontalAlignment','center','color',[0 1 0],'Parent',TelaJogo.Imagem);

% Adversário 1
TelaJogo.Plot(4)  = plot(Adv(1).Posicao(1),Adv(1).Posicao(2),'.','color',[1 0 0],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(4) = text(Adv(1).Posicao(1),Adv(1).Posicao(2)+80,'Adv1','HorizontalAlignment','center','color',[1 0 0],'Parent',TelaJogo.Imagem);

% Adversário 2
TelaJogo.Plot(5)  = plot(Adv(2).Posicao(1),Adv(2).Posicao(2),'.','color',[1 0 0],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(5) = text(Adv(2).Posicao(1),Adv(2).Posicao(2)+80,'Adv2','HorizontalAlignment','center','color',[1 0 0],'Parent',TelaJogo.Imagem);

% Adversário 3
TelaJogo.Plot(6)  = plot(Adv(3).Posicao(1),Adv(3).Posicao(2),'.','color',[1 0 0],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(6) = text(Adv(3).Posicao(1),Adv(3).Posicao(2)+80,'Adv3','HorizontalAlignment','center','color',[1 0 0],'Parent',TelaJogo.Imagem);

% Bola
TelaJogo.Plot(7)  = plot(Bola.Posicao(1),Bola.Posicao(2),'.','color',[1 1 0],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(7) = text(Bola.Posicao(1),Bola.Posicao(2)+80,'Bola','HorizontalAlignment','center','color',[1 1 0],'Parent',TelaJogo.Imagem);

% Robô 1 Desejado
TelaJogo.Plot(8)  = plot(Robo(1).Desejado(1),Robo(1).Desejado(2),'.','color',[.5 1 1],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(8) = text(Robo(1).Desejado(1),Robo(1).Desejado(2)+80,'Desej 1','HorizontalAlignment','center','color',[.5 1 1],'Parent',TelaJogo.Imagem);

% Robô 2 Desejado
TelaJogo.Plot(9)  = plot(Robo(2).Desejado(1),Robo(2).Desejado(2),'.','color',[.5 1 1],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(9) = text(Robo(2).Desejado(1),Robo(2).Desejado(2)+80,'Desej 2','HorizontalAlignment','center','color',[.5 1 1],'Parent',TelaJogo.Imagem);

% Robô 3 Desejado
TelaJogo.Plot(10) = plot(Robo(3).Desejado(1),Robo(3).Desejado(2),'.','color',[.5 1 1],'markersize',20,'Parent',TelaJogo.Imagem);
TelaJogo.Texto(10)= text(Robo(3).Desejado(1),Robo(3).Desejado(2)+80,'Desej 3','HorizontalAlignment','center','color',[.5 1 1],'Parent',TelaJogo.Imagem);

% Para de esperar e desenha
hold(TelaJogo.Eixo,'off')
drawnow