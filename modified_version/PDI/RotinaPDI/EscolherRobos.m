%% Define a posição da cores que pertencem aos Robôs e a Bola (pode encontrar mais de um igual)

% Pré aloca a variável que armazena as distancias entre cada cor e cada cor do nosso time
Possiveis.Distancias = 1000 * ones( find(Cores.AreasM(:,ConstantesPDI.CorNos)>0,1,'last'), ...
                                    find(any(Cores.AreasM(:,ConstantesPDI.CorRobo)>0,2),1,'last'), 3);

% Pré aloca os índice que armazenam o robôs mais próximo de cada cor do nosso time 
Possiveis.Indice = zeros(find(Cores.AreasM(:,ConstantesPDI.CorNos)>0,1,'last'),3);

% Percorre a quantidade de cores encontradas do nosso time
for ii = 1:find(Cores.AreasM(:,ConstantesPDI.CorNos)>0,1,'last')
    
    % Determina as distâncias mais próximas entre cada cor1 e cada cor do nosso time 
    Possiveis.Distancias(ii,Cores.AreasM(:,ConstantesPDI.CorRobo(1))>0,1) = rssq([ Cores.XCentrosM(Cores.AreasM(:,ConstantesPDI.CorRobo(1))>0,ConstantesPDI.CorRobo(1)) - Cores.XCentrosM(ii,ConstantesPDI.CorNos) ...
                                                                                   Cores.YCentrosM(Cores.AreasM(:,ConstantesPDI.CorRobo(1))>0,ConstantesPDI.CorRobo(1)) - Cores.YCentrosM(ii,ConstantesPDI.CorNos) ] ,2);
    
    % Determina as distâncias mais próximas entre cada cor2 e cada cor do nosso time 
    Possiveis.Distancias(ii,Cores.AreasM(:,ConstantesPDI.CorRobo(2))>0,2) = rssq([ Cores.XCentrosM(Cores.AreasM(:,ConstantesPDI.CorRobo(2))>0,ConstantesPDI.CorRobo(2)) - Cores.XCentrosM(ii,ConstantesPDI.CorNos) ...
                                                                                   Cores.YCentrosM(Cores.AreasM(:,ConstantesPDI.CorRobo(2))>0,ConstantesPDI.CorRobo(2)) - Cores.YCentrosM(ii,ConstantesPDI.CorNos) ] ,2);
    
    % Determina as distâncias mais próximas entre cada cor3 e cada cor do nosso time 
    Possiveis.Distancias(ii,Cores.AreasM(:,ConstantesPDI.CorRobo(3))>0,3) = rssq([ Cores.XCentrosM(Cores.AreasM(:,ConstantesPDI.CorRobo(3))>0,ConstantesPDI.CorRobo(3)) - Cores.XCentrosM(ii,ConstantesPDI.CorNos) ...
                                                                                   Cores.YCentrosM(Cores.AreasM(:,ConstantesPDI.CorRobo(3))>0,ConstantesPDI.CorRobo(3)) - Cores.YCentrosM(ii,ConstantesPDI.CorNos) ] ,2);
    
    % Exclui as distâncias fora dos limites determinados
    Possiveis.Distancias(Possiveis.Distancias > ConstantesPDI.DistMax | Possiveis.Distancias < ConstantesPDI.DistMin) = NaN;
    
    % Verifica se existe alguma distância para a cor do nosso time analisada
    if any(~isnan(Possiveis.Distancias(ii,:)))
        
        % Determina os índices das menores distâncias (de forma linear)
        [~,Possiveis.Indice(ii,1)] = min(Possiveis.Distancias(ii,:));
        
        % Determina as cores secundárias das menores distâncias
        Possiveis.Indice(ii,2) = ceil(Possiveis.Indice(ii,1)/find(any(Cores.AreasM(:,ConstantesPDI.CorRobo)>0,2),1,'last'));
        
        % Determina as posições das cores secundárias das menores distâncias
        Possiveis.Indice(ii,3) = mod(Possiveis.Indice(ii,1)-1,find(any(Cores.AreasM(:,ConstantesPDI.CorRobo)>0,2),1,'last'))+1;
    
    end
    
end

% Determina os centróides das cores 1 e das cores do nosso time dos Robôs 1 encontrados
Possiveis.CorRobo1 = [ Cores.XCentrosM(Possiveis.Indice(Possiveis.Indice(:,2)==1,3),ConstantesPDI.CorRobo(1)) ...
                       Cores.YCentrosM(Possiveis.Indice(Possiveis.Indice(:,2)==1,3),ConstantesPDI.CorRobo(1)) ...
                       Cores.XCentrosM(Possiveis.Indice(:,2)==1,ConstantesPDI.CorNos) ...
                       Cores.YCentrosM(Possiveis.Indice(:,2)==1,ConstantesPDI.CorNos) ];

% Determina os centróides das cores 2 e das cores do nosso time dos Robôs 2 encontrados
Possiveis.CorRobo2 = [ Cores.XCentrosM(Possiveis.Indice(Possiveis.Indice(:,2)==2,3),ConstantesPDI.CorRobo(2)) ...
                       Cores.YCentrosM(Possiveis.Indice(Possiveis.Indice(:,2)==2,3),ConstantesPDI.CorRobo(2)) ...
                       Cores.XCentrosM(Possiveis.Indice(:,2)==2,ConstantesPDI.CorNos) ...
                       Cores.YCentrosM(Possiveis.Indice(:,2)==2,ConstantesPDI.CorNos) ];

% Determina os centróides das cores 3 e das cores do nosso time dos Robôs 3 encontrados
Possiveis.CorRobo3 = [ Cores.XCentrosM(Possiveis.Indice(Possiveis.Indice(:,2)==3,3),ConstantesPDI.CorRobo(3)) ...
                       Cores.YCentrosM(Possiveis.Indice(Possiveis.Indice(:,2)==3,3),ConstantesPDI.CorRobo(3)) ...
                       Cores.XCentrosM(Possiveis.Indice(:,2)==3,ConstantesPDI.CorNos) ...
                       Cores.YCentrosM(Possiveis.Indice(:,2)==3,ConstantesPDI.CorNos) ];

% Determina os centróides das cores dos adversários encontrados
Possiveis.Adv = [ Cores.XCentrosM(Cores.AreasM(:,ConstantesPDI.CorAdv)>0,ConstantesPDI.CorAdv) ...
                  Cores.YCentrosM(Cores.AreasM(:,ConstantesPDI.CorAdv)>0,ConstantesPDI.CorAdv) ];

% Determina os centróides dos laranjas encontrados
Possiveis.Bola = [ Cores.XCentrosM(1:find(Cores.AreasM(:,ConstantesPDI.CorBola)>0,1,'last'),ConstantesPDI.CorBola) ...
                   Cores.YCentrosM(1:find(Cores.AreasM(:,ConstantesPDI.CorBola)>0,1,'last'),ConstantesPDI.CorBola) ];