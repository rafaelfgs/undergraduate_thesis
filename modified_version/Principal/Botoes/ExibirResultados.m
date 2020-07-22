%% Exibe o Resultado Final a Cada Instante

% Apaga o desenho anterior dos resultados
try delete(TelaJogo.Pos), delete(TelaJogo.Texto), delete(TelaJogo.Seta), catch, end

% Segura a tela para plotar todas as posições
hold(TelaJogo.Eixo,'on')

% Plota a postura e o texto do Robô 1
TelaJogo.Pos(1)   = plot(Robo(1).Posicao(1),Robo(1).Posicao(2),'o','color',TelaJogo.Cores(ConstantesPDI.CorRobo(1),:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(1) = text(Robo(1).Posicao(1),Robo(1).Posicao(2)-sign(Robo(1).Posicao(3))*60,'Robô1','horizontalalignment','center','color',TelaJogo.Cores(ConstantesPDI.CorRobo(1),:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(1)  = text(Robo(1).Posicao(1)-15*sind(Robo(1).Posicao(3)),Robo(1).Posicao(2)+18*cosd(Robo(1).Posicao(3)),'\rightarrow','rotation',Robo(1).Posicao(3),'fontsize',16,'color',TelaJogo.Cores(ConstantesPDI.CorRobo(1),:),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Robô 2
TelaJogo.Pos(2)   = plot(Robo(2).Posicao(1),Robo(2).Posicao(2),'o','color',TelaJogo.Cores(ConstantesPDI.CorRobo(2),:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(2) = text(Robo(2).Posicao(1),Robo(2).Posicao(2)-sign(Robo(2).Posicao(3))*60,'Robô2','horizontalalignment','center','color',TelaJogo.Cores(ConstantesPDI.CorRobo(2),:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(2)  = text(Robo(2).Posicao(1)-15*sind(Robo(2).Posicao(3)),Robo(2).Posicao(2)+18*cosd(Robo(2).Posicao(3)),'\rightarrow','rotation',Robo(2).Posicao(3),'fontsize',16,'color',TelaJogo.Cores(ConstantesPDI.CorRobo(2),:),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Robô 3
TelaJogo.Pos(3)   = plot(Robo(3).Posicao(1),Robo(3).Posicao(2),'o','color',TelaJogo.Cores(ConstantesPDI.CorRobo(3),:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(3) = text(Robo(3).Posicao(1),Robo(3).Posicao(2)-sign(Robo(3).Posicao(3))*60,'Robô3','horizontalalignment','center','color',TelaJogo.Cores(ConstantesPDI.CorRobo(3),:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(3)  = text(Robo(3).Posicao(1)-15*sind(Robo(3).Posicao(3)),Robo(3).Posicao(2)+18*cosd(Robo(3).Posicao(3)),'\rightarrow','rotation',Robo(3).Posicao(3),'fontsize',16,'color',TelaJogo.Cores(ConstantesPDI.CorRobo(3),:),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Adversário 1
TelaJogo.Pos(4)   = plot(Adv(1).Posicao(1),Adv(1).Posicao(2),'o','color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(4) = text(Adv(1).Posicao(1),Adv(1).Posicao(2)-sign(Adv(1).Posicao(3))*60,'Adv1','horizontalalignment','center','color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(4)  = text(Adv(1).Posicao(1)-15*sind(Adv(1).Posicao(3)),Adv(1).Posicao(2)+18*cosd(Adv(1).Posicao(3)),'\rightarrow','rotation',Adv(1).Posicao(3),'fontsize',16,'color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Adversário 2
TelaJogo.Pos(5)   = plot(Adv(2).Posicao(1),Adv(2).Posicao(2),'o','color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(5) = text(Adv(2).Posicao(1),Adv(2).Posicao(2)-sign(Adv(2).Posicao(3))*60,'Adv2','horizontalalignment','center','color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(5)  = text(Adv(2).Posicao(1)-15*sind(Adv(2).Posicao(3)),Adv(2).Posicao(2)+18*cosd(Adv(2).Posicao(3)),'\rightarrow','rotation',Adv(2).Posicao(3),'fontsize',16,'color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Adversário 3
TelaJogo.Pos(6)   = plot(Adv(3).Posicao(1),Adv(3).Posicao(2),'o','color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(6) = text(Adv(3).Posicao(1),Adv(3).Posicao(2)-sign(Adv(3).Posicao(3))*60,'Adv3','horizontalalignment','center','color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(6)  = text(Adv(3).Posicao(1)-15*sind(Adv(3).Posicao(3)),Adv(3).Posicao(2)+18*cosd(Adv(3).Posicao(3)),'\rightarrow','rotation',Adv(3).Posicao(3),'fontsize',16,'color',TelaJogo.Cores(ConstantesPDI.CorAdv,:),'parent',TelaJogo.Imagem);

% Plota a postura e o texto da Bola
TelaJogo.Pos(7)   = plot(Bola.Posicao(1),Bola.Posicao(2),'o','color',TelaJogo.Cores(ConstantesPDI.CorBola,:),'parent',TelaJogo.Imagem);
TelaJogo.Texto(7) = text(Bola.Posicao(1),Bola.Posicao(2)-sign(Bola.Posicao(3))*60,'Bola','horizontalalignment','center','color',TelaJogo.Cores(ConstantesPDI.CorBola,:),'parent',TelaJogo.Imagem);
TelaJogo.Seta(7)  = text(Bola.Posicao(1)-15*sind(Bola.Posicao(3)),Bola.Posicao(2)+18*cosd(Bola.Posicao(3)),'\rightarrow','rotation',Bola.Posicao(3),'fontsize',16,'color',TelaJogo.Cores(ConstantesPDI.CorBola,:),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Robô 1 Desejado
TelaJogo.Pos(8)   = plot(Robo(1).Desejado(1),Robo(1).Desejado(2),'o','color',min([TelaJogo.Cores(ConstantesPDI.CorRobo(1),:)+0.5;ones(1,3)],[],1),'parent',TelaJogo.Imagem);
TelaJogo.Texto(8) = text(Robo(1).Desejado(1),Robo(1).Desejado(2)+80,'Desej1','horizontalalignment','center','color',min([TelaJogo.Cores(ConstantesPDI.CorRobo(1),:)+0.5;ones(1,3)],[],1),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Robô 2 Desejado
TelaJogo.Pos(9)   = plot(Robo(2).Desejado(1),Robo(2).Desejado(2),'o','color',min([TelaJogo.Cores(ConstantesPDI.CorRobo(2),:)+0.5;ones(1,3)],[],1),'parent',TelaJogo.Imagem);
TelaJogo.Texto(9) = text(Robo(2).Desejado(1),Robo(2).Desejado(2)+80,'Desej2','horizontalalignment','center','color',min([TelaJogo.Cores(ConstantesPDI.CorRobo(2),:)+0.5;ones(1,3)],[],1),'parent',TelaJogo.Imagem);

% Plota a postura e o texto do Robô 3 Desejado
TelaJogo.Pos(10)  = plot(Robo(3).Desejado(1),Robo(3).Desejado(2),'o','color',min([TelaJogo.Cores(ConstantesPDI.CorRobo(3),:)+0.5;ones(1,3)],[],1),'parent',TelaJogo.Imagem);
TelaJogo.Texto(10)= text(Robo(3).Desejado(1),Robo(3).Desejado(2)+80,'Desej3','horizontalalignment','center','color',min([TelaJogo.Cores(ConstantesPDI.CorRobo(3),:)+0.5;ones(1,3)],[],1),'parent',TelaJogo.Imagem);

% Libera a tela e força a exibição
hold(TelaJogo.Eixo,'off')
drawnow