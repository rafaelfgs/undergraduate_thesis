%% Chama a função para segmentar uma cor individualmente

% Realiza a segmentação da matiz da imagem de acordo com os limites dados pela Calibração
if Calibracao(ImCalib.Cor,1) <= Calibracao(ImCalib.Cor,2)
    ImCalib.SegMat = (ImCalib.Atual(:,:,1) >= Calibracao(ImCalib.Cor,1)) & (ImCalib.Atual(:,:,1) <= Calibracao(ImCalib.Cor,2));
else
    ImCalib.SegMat = (ImCalib.Atual(:,:,1) >= Calibracao(ImCalib.Cor,1)) | (ImCalib.Atual(:,:,1) <= Calibracao(ImCalib.Cor,2));
end

% Realiza a segmentação da saturação da imagem de acordo com os limites dados pela Calibração
ImCalib.SegSat = (ImCalib.Atual(:,:,2) >= Calibracao(ImCalib.Cor,3)) & (ImCalib.Atual(:,:,2) <= Calibracao(ImCalib.Cor,4));

% Realiza a segmentação da luminosidade da imagem de acordo com os limites dados pela Calibração
ImCalib.SegLum = (ImCalib.Atual(:,:,3) >= Calibracao(ImCalib.Cor,5)) & (ImCalib.Atual(:,:,3) <= Calibracao(ImCalib.Cor,6));

% Pré aloca a variável que irá conter a segmentação da cor escolhida
ImCalib.Final = zeros(size(ImCalib.Atual,1),size(ImCalib.Atual,2),3);

% Verifica qual cor foi escolhida
switch ImCalib.Cor
    
    % Se for vermelho, a imagem final conterá apenas vermelho
    case 1
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for laranja, a imagem final conterá vermelho e meio verde
    case 2
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,2) = 0.5 * (ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum);
        
    % Se for amarelo, a imagem final conterá vermelho e verde
    case 3
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,2) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for verde, a imagem final conterá apenas verde
    case 4
        ImCalib.Final(:,:,2) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for ciano, a imagem final conterá verde e azul
    case 5
        ImCalib.Final(:,:,2) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,3) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for azul, a imagem final conterá apenas azul
    case 6
        ImCalib.Final(:,:,3) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for magenta, a imagem final conterá vermelho e azul
    case 7
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,3) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
end