%% Define a posição das cores

% Pré aloca o resultado da função regionprops e o número máximo de cores
Pseudo.Props = cell(1,7);
Pseudo.Nmax = 0;

% Percorre todas as cores
for ii = [Constantes.CorNos Constantes.CorAdv Constantes.CorRobo Constantes.CorBola]
    
    % Retorna a área e o centróide de cada cor (9.11ms)
    Pseudo.Props{ii} = regionprops(ImJogo.Filtrada(:,:,ii),'area','centroid');
    
    % Determina a quantidade máxima de cores
    Pseudo.Nmax = max(size(Pseudo.Props{ii},1),Pseudo.Nmax);
    
end

% Pré aloca a área e o centróide
Pseudo.AreasP = zeros(Pseudo.Nmax,7);
Pseudo.XCentrosP = zeros(2*Pseudo.Nmax,7);
Pseudo.YCentrosP = zeros(Pseudo.Nmax,7);

% Percorre todas as cores
for ii = [Constantes.CorNos Constantes.CorAdv Constantes.CorRobo Constantes.CorBola]
    
    % Salva as áreas em uma variável própria
    Pseudo.AreasP(1:size(Pseudo.Props{ii},1),ii) = [Pseudo.Props{ii}.Area];
    
    % Salva todos os centróides em uma variável própria
    Pseudo.XCentrosP(1:2*size(Pseudo.Props{ii},1),ii) = [Pseudo.Props{ii}.Centroid];
    
end

% Separa o vetor anterior nas coordenadas (x,y) do centróide
Pseudo.YCentrosP = Pseudo.XCentrosP(2*(1:Pseudo.Nmax),:);
Pseudo.XCentrosP(2*(1:Pseudo.Nmax),:) = [];