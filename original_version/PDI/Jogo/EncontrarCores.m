%% Define a posi��o das cores

% Pr� aloca o resultado da fun��o regionprops e o n�mero m�ximo de cores
Pseudo.Props = cell(1,7);
Pseudo.Nmax = 0;

% Percorre todas as cores
for ii = [Constantes.CorNos Constantes.CorAdv Constantes.CorRobo Constantes.CorBola]
    
    % Retorna a �rea e o centr�ide de cada cor (9.11ms)
    Pseudo.Props{ii} = regionprops(ImJogo.Filtrada(:,:,ii),'area','centroid');
    
    % Determina a quantidade m�xima de cores
    Pseudo.Nmax = max(size(Pseudo.Props{ii},1),Pseudo.Nmax);
    
end

% Pr� aloca a �rea e o centr�ide
Pseudo.AreasP = zeros(Pseudo.Nmax,7);
Pseudo.XCentrosP = zeros(2*Pseudo.Nmax,7);
Pseudo.YCentrosP = zeros(Pseudo.Nmax,7);

% Percorre todas as cores
for ii = [Constantes.CorNos Constantes.CorAdv Constantes.CorRobo Constantes.CorBola]
    
    % Salva as �reas em uma vari�vel pr�pria
    Pseudo.AreasP(1:size(Pseudo.Props{ii},1),ii) = [Pseudo.Props{ii}.Area];
    
    % Salva todos os centr�ides em uma vari�vel pr�pria
    Pseudo.XCentrosP(1:2*size(Pseudo.Props{ii},1),ii) = [Pseudo.Props{ii}.Centroid];
    
end

% Separa o vetor anterior nas coordenadas (x,y) do centr�ide
Pseudo.YCentrosP = Pseudo.XCentrosP(2*(1:Pseudo.Nmax),:);
Pseudo.XCentrosP(2*(1:Pseudo.Nmax),:) = [];