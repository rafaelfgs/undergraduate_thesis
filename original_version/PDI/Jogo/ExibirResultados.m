%% Exibe o resultado final a cada instante

% Apaga o desenho anterior dos resultados
try delete(TelaJogo.Pos), delete(TelaJogo.Texto), delete(TelaJogo.Seta), catch, end

% Segura a tela para plotar todas as posições
hold(TelaJogo.Eixo,'on')

% Plota a posição e o texto do Robô 1
TelaJogo.Pos(1)   = plot(Filtro.Robo1.Xpred(1),Filtro.Robo1.Xpred(2),'o','color',TelaJogo.Cores(Constantes.CorRobo(1),:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(1) = text(Filtro.Robo1.Xpred(1),Filtro.Robo1.Xpred(2)-sign(Filtro.Robo1.Xpred(3))*60,'Robô1','horizontalalignment','center','color',TelaJogo.Cores(Constantes.CorRobo(1),:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(1)  = text(Filtro.Robo1.Xpred(1)-15*sind(Filtro.Robo1.Xpred(3)),Filtro.Robo1.Xpred(2)+18*cosd(Filtro.Robo1.Xpred(3)),'\rightarrow','rotation',Filtro.Robo1.Xpred(3),'fontsize',16,'color',TelaJogo.Cores(Constantes.CorRobo(1),:),'parent',TelaJogo.Imagem);

% Plota a posição e o texto do Robô 2
TelaJogo.Pos(2)   = plot(Filtro.Robo2.Xpred(1),Filtro.Robo2.Xpred(2),'o','color',TelaJogo.Cores(Constantes.CorRobo(2),:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(2) = text(Filtro.Robo2.Xpred(1),Filtro.Robo2.Xpred(2)-sign(Filtro.Robo2.Xpred(3))*60,'Robô2','horizontalalignment','center','color',TelaJogo.Cores(Constantes.CorRobo(2),:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(2)  = text(Filtro.Robo2.Xpred(1)-15*sind(Filtro.Robo2.Xpred(3)),Filtro.Robo2.Xpred(2)+18*cosd(Filtro.Robo2.Xpred(3)),'\rightarrow','rotation',Filtro.Robo2.Xpred(3),'fontsize',16,'color',TelaJogo.Cores(Constantes.CorRobo(2),:),'parent',TelaJogo.Imagem);

% Plota a posição e o texto do Robô 3
TelaJogo.Pos(3)   = plot(Filtro.Robo3.Xpred(1),Filtro.Robo3.Xpred(2),'o','color',TelaJogo.Cores(Constantes.CorRobo(3),:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(3) = text(Filtro.Robo3.Xpred(1),Filtro.Robo3.Xpred(2)-sign(Filtro.Robo3.Xpred(3))*60,'Robô3','horizontalalignment','center','color',TelaJogo.Cores(Constantes.CorRobo(3),:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(3)  = text(Filtro.Robo3.Xpred(1)-15*sind(Filtro.Robo3.Xpred(3)),Filtro.Robo3.Xpred(2)+18*cosd(Filtro.Robo3.Xpred(3)),'\rightarrow','rotation',Filtro.Robo3.Xpred(3),'fontsize',16,'color',TelaJogo.Cores(Constantes.CorRobo(3),:),'parent',TelaJogo.Imagem);

% Plota a posição e o texto do Adversário 1
TelaJogo.Pos(4)   = plot(Filtro.Adv1.Xpred(1),Filtro.Adv1.Xpred(2),'o','color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(4) = text(Filtro.Adv1.Xpred(1),Filtro.Adv1.Xpred(2)-sign(Filtro.Adv1.Xpred(3))*60,'Adv1','horizontalalignment','center','color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(4)  = text(Filtro.Adv1.Xpred(1)-15*sind(Filtro.Adv1.Xpred(3)),Filtro.Adv1.Xpred(2)+18*cosd(Filtro.Adv1.Xpred(3)),'\rightarrow','rotation',Filtro.Adv1.Xpred(3),'fontsize',16,'color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);

% Plota a posição e o texto do Adversário 2
TelaJogo.Pos(5)   = plot(Filtro.Adv2.Xpred(1),Filtro.Adv2.Xpred(2),'o','color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(5) = text(Filtro.Adv2.Xpred(1),Filtro.Adv2.Xpred(2)-sign(Filtro.Adv2.Xpred(3))*60,'Adv2','horizontalalignment','center','color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(5)  = text(Filtro.Adv2.Xpred(1)-15*sind(Filtro.Adv2.Xpred(3)),Filtro.Adv2.Xpred(2)+18*cosd(Filtro.Adv2.Xpred(3)),'\rightarrow','rotation',Filtro.Adv2.Xpred(3),'fontsize',16,'color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);

% Plota a posição e o texto do Adversário 3
TelaJogo.Pos(6)   = plot(Filtro.Adv3.Xpred(1),Filtro.Adv3.Xpred(2),'o','color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(6) = text(Filtro.Adv3.Xpred(1),Filtro.Adv3.Xpred(2)-sign(Filtro.Adv3.Xpred(3))*60,'Adv3','horizontalalignment','center','color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(6)  = text(Filtro.Adv3.Xpred(1)-15*sind(Filtro.Adv3.Xpred(3)),Filtro.Adv3.Xpred(2)+18*cosd(Filtro.Adv3.Xpred(3)),'\rightarrow','rotation',Filtro.Adv3.Xpred(3),'fontsize',16,'color',TelaJogo.Cores(Constantes.CorAdv,:),'parent',TelaJogo.Imagem);

% Plota a posição e o texto da Bola
TelaJogo.Pos(7)   = plot(Filtro.Bola.Xpred(1),Filtro.Bola.Xpred(2),'o','color',TelaJogo.Cores(Constantes.CorBola,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(7) = text(Filtro.Bola.Xpred(1),Filtro.Bola.Xpred(2)-sign(Filtro.Bola.Xpred(3))*60,'Bola','horizontalalignment','center','color',TelaJogo.Cores(Constantes.CorBola,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(7)  = text(Filtro.Bola.Xpred(1)-15*sind(Filtro.Bola.Xpred(3)),Filtro.Bola.Xpred(2)+18*cosd(Filtro.Bola.Xpred(3)),'\rightarrow','rotation',Filtro.Bola.Xpred(3),'fontsize',16,'color',TelaJogo.Cores(Constantes.CorBola,:),'parent',TelaJogo.Imagem);

% Libera a tela e força a exibição
hold(TelaJogo.Eixo,'off')
drawnow