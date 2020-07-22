%% Determinação dos pixels a serem utilizados na segmentação

% Inicia a variável de valor dos pixels
TelaPixels.Valores = [];

% Desabilita o botão de selecionar pixels
set(TelaPixels.Botao(1),'enable','off')

% Salva os valores das cores dos pixels selecionados em RGB
TelaPixels.Valores = [TelaPixels.Valores;impixel];

% Habilita o botão de selecionar pixels
set(TelaPixels.Botao(1),'enable','on')

% Exclui os pixels selecionados fora da imagem
for ii = size(TelaPixels.Valores,1):-1:1
    if isnan(TelaPixels.Valores(ii,:))
        TelaPixels.Valores(ii,:) = [];
    end
end

% Verifica se foi selecionado algum pixel válido
if ~isempty(TelaPixels.Valores)
    
    % Converte as cores dos pixels selecionados de RGB para HSV uint8
    TelaPixels.Valores = rgb2hsv(TelaPixels.Valores./255);
    TelaPixels.Valores(:,1) = uint8(180*TelaPixels.Valores(:,1));
    TelaPixels.Valores(:,2) = uint8(100*TelaPixels.Valores(:,2));
    TelaPixels.Valores(:,3) = uint8(100*TelaPixels.Valores(:,3));
    
    % Habilita o botão de segmentar pixels
    set(TelaPixels.Botao(2),'enable','on')
    
end

% Habilita a função de zoom
zoom on