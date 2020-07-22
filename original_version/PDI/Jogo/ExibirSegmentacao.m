%% Exibe a segmenta��o da imagem final da segmenta��o

% Realiza a soma das segmenta��es que cont�m vermelho
ImJogo.Final(:,:,1) = ImJogo.Filtrada(:,:,1) + ImJogo.Filtrada(:,:,2) + ...
                      ImJogo.Filtrada(:,:,3) + ImJogo.Filtrada(:,:,7);

% Realiza a soma das segmenta��es que cont�m verde
ImJogo.Final(:,:,2) = 0.5 * ImJogo.Filtrada(:,:,2) + ImJogo.Filtrada(:,:,3) + ...
                      ImJogo.Filtrada(:,:,4) + ImJogo.Filtrada(:,:,5);

% Realiza a soma das segmenta��es que cont�m azul
ImJogo.Final(:,:,3) = ImJogo.Filtrada(:,:,5) + ImJogo.Filtrada(:,:,6) + ...
                      ImJogo.Filtrada(:,:,7);

% Exibe a imagem segmentada final
imshow(ImJogo.Final,'parent',TelaJogo.Imagem)
drawnow