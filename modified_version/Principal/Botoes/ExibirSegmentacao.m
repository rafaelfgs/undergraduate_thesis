%% Exibe a imagem final em RGB da segmentação

% Realiza a soma das segmentações que contém vermelho
TelaJogo.Segmentacao(:,:,1) = ImJogo.Filtrada(:,:,1) + ImJogo.Filtrada(:,:,2) + ...
                              ImJogo.Filtrada(:,:,3) + ImJogo.Filtrada(:,:,7);

% Realiza a soma das segmentações que contém verde
TelaJogo.Segmentacao(:,:,2) = 0.5 * ImJogo.Filtrada(:,:,2) + ImJogo.Filtrada(:,:,3) + ...
                              ImJogo.Filtrada(:,:,4) + ImJogo.Filtrada(:,:,5);

% Realiza a soma das segmentações que contém azul
TelaJogo.Segmentacao(:,:,3) = ImJogo.Filtrada(:,:,5) + ImJogo.Filtrada(:,:,6) + ...
                              ImJogo.Filtrada(:,:,7);

% Exibe a imagem segmentada final
imshow(TelaJogo.Segmentacao,'parent',TelaJogo.Imagem)
drawnow