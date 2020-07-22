%% Chama a fun��o para segmentar uma cor individualmente

% Realiza a segmenta��o da matiz da imagem de acordo com os limites dados pela Calibra��o
if Calibracao(ImCalib.Cor,1) <= Calibracao(ImCalib.Cor,2)
    ImCalib.SegMat = (ImCalib.Atual(:,:,1) >= Calibracao(ImCalib.Cor,1)) & (ImCalib.Atual(:,:,1) <= Calibracao(ImCalib.Cor,2));
else
    ImCalib.SegMat = (ImCalib.Atual(:,:,1) >= Calibracao(ImCalib.Cor,1)) | (ImCalib.Atual(:,:,1) <= Calibracao(ImCalib.Cor,2));
end

% Realiza a segmenta��o da satura��o da imagem de acordo com os limites dados pela Calibra��o
ImCalib.SegSat = (ImCalib.Atual(:,:,2) >= Calibracao(ImCalib.Cor,3)) & (ImCalib.Atual(:,:,2) <= Calibracao(ImCalib.Cor,4));

% Realiza a segmenta��o da luminosidade da imagem de acordo com os limites dados pela Calibra��o
ImCalib.SegLum = (ImCalib.Atual(:,:,3) >= Calibracao(ImCalib.Cor,5)) & (ImCalib.Atual(:,:,3) <= Calibracao(ImCalib.Cor,6));

% Pr� aloca a vari�vel que ir� conter a segmenta��o da cor escolhida
ImCalib.Final = zeros(size(ImCalib.Atual,1),size(ImCalib.Atual,2),3);

% Verifica qual cor foi escolhida
switch ImCalib.Cor
    
    % Se for vermelho, a imagem final conter� apenas vermelho
    case 1
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for laranja, a imagem final conter� vermelho e meio verde
    case 2
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,2) = 0.5 * (ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum);
        
    % Se for amarelo, a imagem final conter� vermelho e verde
    case 3
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,2) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for verde, a imagem final conter� apenas verde
    case 4
        ImCalib.Final(:,:,2) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for ciano, a imagem final conter� verde e azul
    case 5
        ImCalib.Final(:,:,2) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,3) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for azul, a imagem final conter� apenas azul
    case 6
        ImCalib.Final(:,:,3) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
    % Se for magenta, a imagem final conter� vermelho e azul
    case 7
        ImCalib.Final(:,:,1) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        ImCalib.Final(:,:,3) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
        
end