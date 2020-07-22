%% Determina a segmentação e exibe a imagem final da cor escolhida

% Converte a imagem atual de RGB para HSV [0,255]
ImCalib.Atual = uint8(255*(rgb2hsv(imresize(getsnapshot(Camera.Video),Camera.Redimensionar))));

% Determina o número da cor escolhida [R,O,Y,G,C,B,M,T]
ImCalib.Cor = 8-TelaCalibracao.Botao.Cores.SelectedObject.Position(2)*8;

% Se a opção escolhida não for a Total
if ImCalib.Cor ~= 8
    
    % Habilita os Edits, os Sliders e o botão de Segmentar Pixels
    set(TelaCalibracao.Botao.Edit,'enable','on')
    set(TelaCalibracao.Botao.Slider,'enable','on')
    set(TelaCalibracao.Botao.Pixels,'enable','on')
    
    % Atualiza os valores dos Edits e dos Sliders
    for ii = 1:2
        TelaCalibracao.Botao.Edit(ii).String = num2str(round(360*double(Calibracao(ImCalib.Cor,ii))/255));
        TelaCalibracao.Botao.Slider(ii).Value = round(360*double(Calibracao(ImCalib.Cor,ii))/255);
    end
    for ii = 3:6
        TelaCalibracao.Botao.Edit(ii).String = num2str(round(100*double(Calibracao(ImCalib.Cor,ii))/255));
        TelaCalibracao.Botao.Slider(ii).Value = round(100*double(Calibracao(ImCalib.Cor,ii))/255);
    end
    
    % Altera a cor de fundo dos sliders
    set(TelaCalibracao.Botao.Slider(1),'backgroundcolor',hsv2rgb([double(Calibracao(ImCalib.Cor,1))/255 .8 .8]))
    set(TelaCalibracao.Botao.Slider(2),'backgroundcolor',hsv2rgb([double(Calibracao(ImCalib.Cor,2))/255 .8 .8]))
    if Calibracao(ImCalib.Cor,1) <= Calibracao(ImCalib.Cor,2)
        set(TelaCalibracao.Botao.Slider(3),'backgroundcolor',hsv2rgb([mean(double(Calibracao(ImCalib.Cor,1:2)))/255 double(Calibracao(ImCalib.Cor,3))/255 .8]))
        set(TelaCalibracao.Botao.Slider(4),'backgroundcolor',hsv2rgb([mean(double(Calibracao(ImCalib.Cor,1:2)))/255 double(Calibracao(ImCalib.Cor,4))/255 .8]))
        set(TelaCalibracao.Botao.Slider(5),'backgroundcolor',hsv2rgb([mean(double(Calibracao(ImCalib.Cor,1:2)))/255 .8 double(Calibracao(ImCalib.Cor,5))/255]))
        set(TelaCalibracao.Botao.Slider(6),'backgroundcolor',hsv2rgb([mean(double(Calibracao(ImCalib.Cor,1:2)))/255 .8 double(Calibracao(ImCalib.Cor,6))/255]))
    else
        set(TelaCalibracao.Botao.Slider(3),'backgroundcolor',hsv2rgb([mod(mean([double(Calibracao(ImCalib.Cor,1))/255 double(Calibracao(ImCalib.Cor,2))/255+1]),1) double(Calibracao(ImCalib.Cor,3))/255 .8]))
        set(TelaCalibracao.Botao.Slider(4),'backgroundcolor',hsv2rgb([mod(mean([double(Calibracao(ImCalib.Cor,1))/255 double(Calibracao(ImCalib.Cor,2))/255+1]),1) double(Calibracao(ImCalib.Cor,4))/255 .8]))
        set(TelaCalibracao.Botao.Slider(5),'backgroundcolor',hsv2rgb([mod(mean([double(Calibracao(ImCalib.Cor,1))/255 double(Calibracao(ImCalib.Cor,2))/255+1]),1) .8 double(Calibracao(ImCalib.Cor,5))/255]))
        set(TelaCalibracao.Botao.Slider(6),'backgroundcolor',hsv2rgb([mod(mean([double(Calibracao(ImCalib.Cor,1))/255 double(Calibracao(ImCalib.Cor,2))/255+1]),1) .8 double(Calibracao(ImCalib.Cor,6))/255]))
    end
    
    % Chama a função para segmentar uma cor individualmente
    SegmentarCor
    
% Se a opção escolhida for a Total
else
    
    % Altera os valores dos edits
    set(TelaCalibracao.Botao.Edit(1),'string',0)
    set(TelaCalibracao.Botao.Edit(2),'string',360)
    set(TelaCalibracao.Botao.Edit(3),'string',0)
    set(TelaCalibracao.Botao.Edit(4),'string',100)
    set(TelaCalibracao.Botao.Edit(5),'string',0)
    set(TelaCalibracao.Botao.Edit(6),'string',100)
    
    % Altera a cor de fundo e os valores dos sliders
    set(TelaCalibracao.Botao.Slider(1),'backgroundcolor',hsv2rgb([0 0 .8]),'value',0)
    set(TelaCalibracao.Botao.Slider(2),'backgroundcolor',hsv2rgb([0 0 .8]),'value',360)
    set(TelaCalibracao.Botao.Slider(3),'backgroundcolor',hsv2rgb([0 0 .8]),'value',0)
    set(TelaCalibracao.Botao.Slider(4),'backgroundcolor',hsv2rgb([0 0 .8]),'value',100)
    set(TelaCalibracao.Botao.Slider(5),'backgroundcolor',hsv2rgb([0 0 .8]),'value',0)
    set(TelaCalibracao.Botao.Slider(6),'backgroundcolor',hsv2rgb([0 0 .8]),'value',100)
    
    % Desabilita os edits, os sliders e o botão de Segmentar Pixels
    set(TelaCalibracao.Botao.Edit,'enable','off')
    set(TelaCalibracao.Botao.Slider,'enable','off')
    set(TelaCalibracao.Botao.Pixels,'enable','off')
    
    % Chama a função para segmentar todas as cores
    SegmentarTotal
    
end

% Exibe na tela a imagem final segmentada da cor escolhida
imshow(ImCalib.Final,'Parent',TelaCalibracao.Imagem)