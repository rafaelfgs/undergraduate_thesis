%% Atualiza os valores do padrão de cores de acordo com os pixels selecionados

% Determina se as maiores matizes são valores máximos ou mínimos
if mean(TelaPixels.Valores(TelaPixels.Valores(:,1)>0.5,1)) - mean(TelaPixels.Valores(TelaPixels.Valores(:,1)<0.5,1)) > 0.5
    
    % Acrescenta +1 nas matizes menores que 0.5
    TelaPixels.ValTemp = [TelaPixels.Valores(TelaPixels.Valores(:,1)<0.5,1)+1; TelaPixels.Valores(TelaPixels.Valores(:,1)>0.5,1)];
    
    % Determina os valores máximo e mínimo da matiz
    Calibracao(ImCalib.Cor,1) = uint8(255*(mean(TelaPixels.ValTemp) - 1.5*std(TelaPixels.ValTemp)));
    Calibracao(ImCalib.Cor,2) = uint8(255*(mean(TelaPixels.ValTemp) + 1.5*std(TelaPixels.ValTemp)));
    
    % Retorna o valor da matiz, caso der maior que 1
    Calibracao(ImCalib.Cor,1:2) = Calibracao(ImCalib.Cor,1:2) - uint8(Calibracao(ImCalib.Cor,1:2)>255);
    
    % Determina os valores máximo e mínimo da saturação e da luminosidade
    Calibracao(ImCalib.Cor,[3 5]) = uint8(255*(mean(TelaPixels.Valores(:,2:3)) - 1.5*std(TelaPixels.Valores(:,2:3))));
    Calibracao(ImCalib.Cor,[4 6]) = uint8(255*(mean(TelaPixels.Valores(:,2:3)) + 1.5*std(TelaPixels.Valores(:,2:3))));
    
else
    
    % Determina os valores máximo e mínimo para os pixels
    Calibracao(ImCalib.Cor,[1 3 5]) = uint8(255*(mean(TelaPixels.Valores) - 1.5*std(TelaPixels.Valores)));
    Calibracao(ImCalib.Cor,[2 4 6]) = uint8(255*(mean(TelaPixels.Valores) + 1.5*std(TelaPixels.Valores)));
    
end

% Altera e s atura os valores da Calibração para [0,255]
Calibracao(Calibracao<0) = 0;
Calibracao(Calibracao>255) = 255;

% Chama a função para exibir a segmentação da cor escolhida
ProcessarImagem

% Fecha a figura dos pixels
closereq