%% Determina quais Robôs e Bolas encontrados estão mais próximos das posições anteriores

% Verifica se foram encontrados Robôs cor1 nesse frame
if ~isempty(Possiveis.Pos1)
    
    % Determina o índice do Robô mais próximo do anterior
    Janela.DistRobo1 = rssq( repmat(Janela.Pos1,size(Possiveis.Pos1,1),1) - Possiveis.Pos1 ,2);
    [~,Janela.IndRobo1] = min(Janela.DistRobo1);
    
    % Atualiza o centróide e a orientação do Robô 1
    Janela.Pos1 = Possiveis.Pos1(Janela.IndRobo1,:);
    Janela.OrientRobo1 = Possiveis.Orient1(Janela.IndRobo1);
    
end

% Verifica se foram encontrados Robôs cor2 nesse frame
if ~isempty(Possiveis.Pos2)
    
    % Determina índice do Robô mais próximo do anterior e atualiza o centróide
    Janela.DistRobo2 = rssq( repmat(Janela.Pos2,size(Possiveis.Pos2,1),1) - Possiveis.Pos2 ,2);
    [~,Janela.IndRobo2] = min(Janela.DistRobo2);
    
    % Atualiza o centróide e a orientação do Robô 2
    Janela.Pos2 = Possiveis.Pos2(Janela.IndRobo2,:);
    Janela.OrientRobo2 = Possiveis.Orient2(Janela.IndRobo2);
    
end

% Verifica se foram encontrados Robôs cor3 nesse frame
if ~isempty(Possiveis.Pos3)
    
    % Determina o índice do Robô mais próximo do anterior e atualiza o centróide
    Janela.DistRobo3 = rssq( repmat(Janela.Pos3,size(Possiveis.Pos3,1),1) - Possiveis.Pos3 ,2);
    [~,Janela.IndRobo3] = min(Janela.DistRobo3);
    
    % Atualiza o centróide e a orientação do Robô 3
    Janela.Pos3 = Possiveis.Pos3(Janela.IndRobo3,:);
    Janela.OrientRobo3 = Possiveis.Orient3(Janela.IndRobo3);
    
end

% Verifica se foram encontrados Robôs adversários nesse frame
if ~isempty(Possiveis.Adv)
    
    % Determina as distâncias entre os adversários encontrados e os anteriores
    Janela.DistAdv = [ rssq( repmat(Janela.Adv1,size(Possiveis.Adv,1),1) - Possiveis.Adv ,2)';
                       rssq( repmat(Janela.Adv2,size(Possiveis.Adv,1),1) - Possiveis.Adv ,2)';
                       rssq( repmat(Janela.Adv3,size(Possiveis.Adv,1),1) - Possiveis.Adv ,2)' ];
    
    % Pré aloca os índices
    Janela.IndAdv = zeros(3,1);
    
    % Percorre os Adversários encontrados (no máximo 3)
    for ii = 1:min(size(Janela.DistAdv,2),3)
        
        % Encontra a cor do Adversário mais próximo do anterior
        Janela.IndTemp = ceil(find(Janela.DistAdv==min(min(Janela.DistAdv)),1)/3);
        
        % Salva o valor no índice e remove as distâncias do Adverário anterior e do encontrado
        Janela.IndAdv(mod(find(Janela.DistAdv==min(min(Janela.DistAdv)),1)-1,3)+1) = Janela.IndTemp;
        Janela.DistAdv(Janela.IndAdv==Janela.IndTemp,:) = NaN;
        Janela.DistAdv(:,Janela.IndTemp) = NaN;
        
    end
    
    % Tenta atualizar os centróides dos Adversários (para o caso de ser menor que 3)
    try Janela.Adv1 = Possiveis.Adv(Janela.IndAdv(1),:); catch, end
    try Janela.Adv2 = Possiveis.Adv(Janela.IndAdv(2),:); catch, end
    try Janela.Adv3 = Possiveis.Adv(Janela.IndAdv(3),:); catch, end
    
end

% Verifica se foram encontradas Bolas nesse frame
if ~isempty(Possiveis.Bola)
    
    % Determina o índice da Bola mais próxima da anterior e atualiza a posição
    Janela.DistBola = rssq( repmat(Janela.Bola,size(Possiveis.Bola,1),1) - Possiveis.Bola ,2);
    [~,Janela.IndBola] = min(Janela.DistBola);
    
    % Atualiza o centróide da Bola
    Janela.Bola = Possiveis.Bola(Janela.IndBola,:);
    
end