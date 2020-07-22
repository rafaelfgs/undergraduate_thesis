%% Salva a imagem final como a soma das segmenta��es de cadacor

% Pr� aloca a vari�vel que ir� conter as segmenta��es de cada cor
ImCalib.SegTotal = false(size(ImCalib.Atual,1),size(ImCalib.Atual,2),8);

% Percorre todas as cores
for ii = 1:7
    
    % Altera a cor escolhida para cada cor
    ImCalib.Cor = ii;
    
    % Faz a segmenta��o de cada cor
    SegmentarCor
    
    % Salva cada segmenta��o na vari�vel pr� alocada
    ImCalib.SegTotal(:,:,ii) = ImCalib.SegMat & ImCalib.SegSat & ImCalib.SegLum;
    
end

% Retorna a cor escolhida para a Total
ImCalib.Cor = 8;

% Realiza a soma das segmenta��es que cont�m vermelho
ImCalib.Final(:,:,1) = ImCalib.SegTotal(:,:,1) + ImCalib.SegTotal(:,:,2) + ...
                       ImCalib.SegTotal(:,:,3) + ImCalib.SegTotal(:,:,7);

% Realiza a soma das segmenta��es que cont�m verde
ImCalib.Final(:,:,2) = 0.5 * ImCalib.SegTotal(:,:,2) + ImCalib.SegTotal(:,:,3) + ...
                       ImCalib.SegTotal(:,:,4) + ImCalib.SegTotal(:,:,5) ;

% Realiza a soma das segmenta��es que cont�m azul
ImCalib.Final(:,:,3) = ImCalib.SegTotal(:,:,5) + ImCalib.SegTotal(:,:,6) + ...
                       ImCalib.SegTotal(:,:,7) ;