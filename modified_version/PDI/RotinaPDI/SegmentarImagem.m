%% Realiza a segmenta��o da imagem

% Determina a imagem atual (1.23ms)
ImJogo.Atual = imread('Arquivos\ImTeste.png');
% ImJogo.Atual = getsnapshot(Camera.Video);

% Redimensiona a imagem atual (3.64ms)
ImJogo.RGB = imresize(ImJogo.Atual,Camera.Redimensionar);

% Converte a imagem de RGB para HSV (7.41ms)
ImJogo.HSVdouble = rgb2hsv(ImJogo.RGB);

% Converte os valores do HSV para uint8 (0.41ms)
ImJogo.HSV(:,:,1) = uint8(180*(ImJogo.HSVdouble(:,:,1)));
ImJogo.HSV(:,:,2) = uint8(100*(ImJogo.HSVdouble(:,:,2)));
ImJogo.HSV(:,:,3) = uint8(100*(ImJogo.HSVdouble(:,:,3)));

% Inicia a vari�vel das imagens das sete cores (0.11ms)
ImJogo.Segmentada = false(size(ImJogo.HSV,1),size(ImJogo.HSV,2),7);
ImJogo.Filtrada = false(size(ImJogo.HSV,1),size(ImJogo.HSV,2),7);

% Percorre cada cor (17.9ms)
for ii = [ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorRobo ConstantesPDI.CorBola]
    
    % Realiza a segmenta��o da matiz da imagem de acordo com os limites dados pela Calibra��o (1.76ms)
    if Calibracao(ii,1) <= Calibracao(ii,2)
        ImJogo.SegMat = (ImJogo.HSV(:,:,1) >= Calibracao(ii,1)) & (ImJogo.HSV(:,:,1) <= Calibracao(ii,2));
    else
        ImJogo.SegMat = (ImJogo.HSV(:,:,1) >= Calibracao(ii,1)) | (ImJogo.HSV(:,:,1) <= Calibracao(ii,2));
    end
    
    % Realiza a segmenta��o da satura��o da imagem de acordo com os limites dados pela Calibra��o (1.69ms)
    ImJogo.SegSat = (ImJogo.HSV(:,:,2) >= Calibracao(ii,3)) & (ImJogo.HSV(:,:,2) <= Calibracao(ii,4));
    
    % Realiza a segmenta��o da luminosidade da imagem de acordo com os limites dados pela Calibra��o (1.47ms)
    ImJogo.SegLum = (ImJogo.HSV(:,:,3) >= Calibracao(ii,5)) & (ImJogo.HSV(:,:,3) <= Calibracao(ii,6));
    
    % Soma as segmenta��es encontradas do HSV (1.75ms)
    ImJogo.Segmentada(:,:,ii) = ImJogo.SegMat & ImJogo.SegSat & ImJogo.SegLum;
    
    % Filtra a imagem segmentada (6.65ms)
    ImJogo.Filtrada(:,:,ii) = FiltrarImagem(ImJogo.Segmentada(:,:,ii));
    
end