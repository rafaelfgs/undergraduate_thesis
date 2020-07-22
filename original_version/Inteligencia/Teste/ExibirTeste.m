%% Exibe o resultado final a cada instante

% Apaga o desenho anterior dos resultados
try delete(TelaTeste.Pos), delete(TelaTeste.Nome), delete(TelaTeste.Seta), delete(TelaTeste.Desej), delete(TelaTeste.Texto), catch, end

% Segura a tela para plotar todas as posições
hold(TelaTeste.Eixo,'on')

% Plota a posição e o texto do Robô 1
TelaTeste.Pos(1)   = plot(Robo(1).Posicao(1),Robo(1).Posicao(2),'o','color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Nome(1)  = text(Robo(1).Posicao(1),Robo(1).Posicao(2)-sign(Robo(1).Posicao(3))*60,'Robô1','horizontalalignment','center','color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Seta(1)  = text(Robo(1).Posicao(1)-15*sind(Robo(1).Posicao(3)),Robo(1).Posicao(2)+18*cosd(Robo(1).Posicao(3)),'\rightarrow','rotation',Robo(1).Posicao(3),'fontsize',16,'color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Desej(1) = plot(Robo(1).Desejado(1),Robo(1).Desejado(2),'o','color',[0.5 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Texto(1) = text(Robo(1).Desejado(1),Robo(1).Desejado(2)+60,'Desej1','horizontalalignment','center','color',[0.5 1 1],'parent',TelaTeste.Imagem);

% Plota a posição e o texto do Robô 2
TelaTeste.Pos(2)   = plot(Robo(2).Posicao(1),Robo(2).Posicao(2),'o','color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Nome(2)  = text(Robo(2).Posicao(1),Robo(2).Posicao(2)-sign(Robo(2).Posicao(3))*60,'Robô2','horizontalalignment','center','color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Seta(2)  = text(Robo(2).Posicao(1)-15*sind(Robo(2).Posicao(3)),Robo(2).Posicao(2)+18*cosd(Robo(2).Posicao(3)),'\rightarrow','rotation',Robo(2).Posicao(3),'fontsize',16,'color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Desej(2) = plot(Robo(2).Desejado(1),Robo(2).Desejado(2),'o','color',[0.5 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Texto(2) = text(Robo(2).Desejado(1),Robo(2).Desejado(2)+60,'Desej2','horizontalalignment','center','color',[0.5 1 1],'parent',TelaTeste.Imagem);

% Plota a posição e o texto do Robô 3
TelaTeste.Pos(3)   = plot(Robo(3).Posicao(1),Robo(3).Posicao(2),'o','color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Nome(3)  = text(Robo(3).Posicao(1),Robo(3).Posicao(2)-sign(Robo(3).Posicao(3))*60,'Robô3','horizontalalignment','center','color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Seta(3)  = text(Robo(3).Posicao(1)-15*sind(Robo(3).Posicao(3)),Robo(3).Posicao(2)+18*cosd(Robo(3).Posicao(3)),'\rightarrow','rotation',Robo(3).Posicao(3),'fontsize',16,'color',[0 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Desej(3) = plot(Robo(3).Desejado(1),Robo(3).Desejado(2),'o','color',[0.5 1 1],'parent',TelaTeste.Imagem);
TelaTeste.Texto(3) = text(Robo(3).Desejado(1),Robo(3).Desejado(2)+60,'Desej3','horizontalalignment','center','color',[0.5 1 1],'parent',TelaTeste.Imagem);

% Plota a posição e o texto do Adversário 1
TelaTeste.Pos(4)   = plot(Adv(1).Posicao(1),Adv(1).Posicao(2),'o','color',[1 0.25 0.25],'parent',TelaTeste.Imagem);
TelaTeste.Nome(4)  = text(Adv(1).Posicao(1),Adv(1).Posicao(2)-sign(Adv(1).Posicao(3))*60,'Adv(1)','horizontalalignment','center','color',[1 0.25 0.25],'parent',TelaTeste.Imagem);
TelaTeste.Seta(4)  = text(Adv(1).Posicao(1)-15*sind(Adv(1).Posicao(3)),Adv(1).Posicao(2)+18*cosd(Adv(1).Posicao(3)),'\rightarrow','rotation',Adv(1).Posicao(3),'fontsize',16,'color',[1 0.25 0.25],'parent',TelaTeste.Imagem);

% Plota a posição e o texto do Adversário 2
TelaTeste.Pos(5)   = plot(Adv(2).Posicao(1),Adv(2).Posicao(2),'o','color',[1 0.25 0.25],'parent',TelaTeste.Imagem);
TelaTeste.Nome(5)  = text(Adv(2).Posicao(1),Adv(2).Posicao(2)-sign(Adv(2).Posicao(3))*60,'Adv(2)','horizontalalignment','center','color',[1 0.25 0.25],'parent',TelaTeste.Imagem);
TelaTeste.Seta(5)  = text(Adv(2).Posicao(1)-15*sind(Adv(2).Posicao(3)),Adv(2).Posicao(2)+18*cosd(Adv(2).Posicao(3)),'\rightarrow','rotation',Adv(2).Posicao(3),'fontsize',16,'color',[1 0.25 0.25],'parent',TelaTeste.Imagem);

% Plota a posição e o texto do Adversário 3
TelaTeste.Pos(6)   = plot(Adv(3).Posicao(1),Adv(3).Posicao(2),'o','color',[1 0.25 0.25],'parent',TelaTeste.Imagem);
TelaTeste.Nome(6)  = text(Adv(3).Posicao(1),Adv(3).Posicao(2)-sign(Adv(3).Posicao(3))*60,'Adv(3)','horizontalalignment','center','color',[1 0.25 0.25],'parent',TelaTeste.Imagem);
TelaTeste.Seta(6)  = text(Adv(3).Posicao(1)-15*sind(Adv(3).Posicao(3)),Adv(3).Posicao(2)+18*cosd(Adv(3).Posicao(3)),'\rightarrow','rotation',Adv(3).Posicao(3),'fontsize',16,'color',[1 0.25 0.25],'parent',TelaTeste.Imagem);

% Plota a posição e o texto da Bola
TelaTeste.Pos(7)   = plot(Bola.Posicao(1),Bola.Posicao(2),'o','color',[1 1 0],'parent',TelaTeste.Imagem);
TelaTeste.Nome(7)  = text(Bola.Posicao(1),Bola.Posicao(2)-sign(Bola.Posicao(3))*60,'Bola','horizontalalignment','center','color',[1 1 0],'parent',TelaTeste.Imagem);
TelaTeste.Seta(7)  = text(Bola.Posicao(1)-15*sind(Bola.Posicao(3)),Bola.Posicao(2)+18*cosd(Bola.Posicao(3)),'\rightarrow','rotation',Bola.Posicao(3),'fontsize',16,'color',[1 1 0],'parent',TelaTeste.Imagem);

% Libera a tela e força a exibição
hold(TelaTeste.Eixo,'off')
drawnow