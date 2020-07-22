%% Define a posição da cores que pertencem aos Robôs e a Bola (pode encontrar mais de um igual)

% Pré aloca a variável que armazena as distancias entre cada cor e cada cor do nosso time
Robos.Distancias = 1000 * ones( find(Cores.AreasM(:,Constantes.CorNos)>0,1,'last'), ...
                                find(any(Cores.AreasM(:,Constantes.CorRobo)>0,2),1,'last'), 3);

% Pré aloca os índice que armazenam o robôs mais próximo de cada cor do nosso time 
Robos.Indice = zeros(find(Cores.AreasM(:,Constantes.CorNos)>0,1,'last'),3);

% Percorre a quantidade de cores encontradas do nosso time
for ii = 1:find(Cores.AreasM(:,Constantes.CorNos)>0,1,'last')
    
    % Determina as distâncias mais próximas entre cada cor1 e cada cor do nosso time 
    Robos.Distancias(ii,Cores.AreasM(:,Constantes.CorRobo(1))>0,1) = rssq([ Cores.XCentrosM(Cores.AreasM(:,Constantes.CorRobo(1))>0,Constantes.CorRobo(1)) - Cores.XCentrosM(ii,Constantes.CorNos) ...
                                                                            Cores.YCentrosM(Cores.AreasM(:,Constantes.CorRobo(1))>0,Constantes.CorRobo(1)) - Cores.YCentrosM(ii,Constantes.CorNos) ] ,2);
    
    % Determina as distâncias mais próximas entre cada cor2 e cada cor do nosso time 
    Robos.Distancias(ii,Cores.AreasM(:,Constantes.CorRobo(2))>0,2) = rssq([ Cores.XCentrosM(Cores.AreasM(:,Constantes.CorRobo(2))>0,Constantes.CorRobo(2)) - Cores.XCentrosM(ii,Constantes.CorNos) ...
                                                                            Cores.YCentrosM(Cores.AreasM(:,Constantes.CorRobo(2))>0,Constantes.CorRobo(2)) - Cores.YCentrosM(ii,Constantes.CorNos) ] ,2);
    
    % Determina as distâncias mais próximas entre cada cor3 e cada cor do nosso time 
    Robos.Distancias(ii,Cores.AreasM(:,Constantes.CorRobo(3))>0,3) = rssq([ Cores.XCentrosM(Cores.AreasM(:,Constantes.CorRobo(3))>0,Constantes.CorRobo(3)) - Cores.XCentrosM(ii,Constantes.CorNos) ...
                                                                            Cores.YCentrosM(Cores.AreasM(:,Constantes.CorRobo(3))>0,Constantes.CorRobo(3)) - Cores.YCentrosM(ii,Constantes.CorNos) ] ,2);
    
    % Exclui as distâncias fora dos limites determinados
    Robos.Distancias(Robos.Distancias > Constantes.DistMax | Robos.Distancias < Constantes.DistMin) = NaN;
    
    % Verifica se existe alguma distância para a cor do nosso time analisada
    if any(~isnan(Robos.Distancias(ii,:)))
        
        % Determina os índices das menores distâncias (de forma linear)
        [~,Robos.Indice(ii,1)] = min(Robos.Distancias(ii,:));
        
        % Determina as cores secundárias das menores distâncias
        Robos.Indice(ii,2) = ceil(Robos.Indice(ii,1)/find(any(Cores.AreasM(:,Constantes.CorRobo)>0,2),1,'last'));
        
        % Determina as posições das cores secundárias das menores distâncias
        Robos.Indice(ii,3) = mod(Robos.Indice(ii,1)-1,find(any(Cores.AreasM(:,Constantes.CorRobo)>0,2),1,'last'))+1;
    
    end
    
end

% Determina os centróides das cores 1 e das cores do nosso time dos Robôs 1 encontrados
Robos.CorRobo1 = [ Cores.XCentrosM(Robos.Indice(Robos.Indice(:,2)==1,3),Constantes.CorRobo(1)) ...
                   Cores.YCentrosM(Robos.Indice(Robos.Indice(:,2)==1,3),Constantes.CorRobo(1)) ...
                   Cores.XCentrosM(Robos.Indice(:,2)==1,Constantes.CorNos) ...
                   Cores.YCentrosM(Robos.Indice(:,2)==1,Constantes.CorNos) ];

% Determina os centróides das cores 2 e das cores do nosso time dos Robôs 2 encontrados
Robos.CorRobo2 = [ Cores.XCentrosM(Robos.Indice(Robos.Indice(:,2)==2,3),Constantes.CorRobo(2)) ...
                   Cores.YCentrosM(Robos.Indice(Robos.Indice(:,2)==2,3),Constantes.CorRobo(2)) ...
                   Cores.XCentrosM(Robos.Indice(:,2)==2,Constantes.CorNos) ...
                   Cores.YCentrosM(Robos.Indice(:,2)==2,Constantes.CorNos) ];

% Determina os centróides das cores 3 e das cores do nosso time dos Robôs 3 encontrados
Robos.CorRobo3 = [ Cores.XCentrosM(Robos.Indice(Robos.Indice(:,2)==3,3),Constantes.CorRobo(3)) ...
                   Cores.YCentrosM(Robos.Indice(Robos.Indice(:,2)==3,3),Constantes.CorRobo(3)) ...
                   Cores.XCentrosM(Robos.Indice(:,2)==3,Constantes.CorNos) ...
                   Cores.YCentrosM(Robos.Indice(:,2)==3,Constantes.CorNos) ];

% Determina os centróides das cores dos adversários encontrados
Robos.Adv = [ Cores.XCentrosM(Cores.AreasM(:,Constantes.CorAdv)>0,Constantes.CorAdv) ...
              Cores.YCentrosM(Cores.AreasM(:,Constantes.CorAdv)>0,Constantes.CorAdv) ];

% Determina os centróides dos laranjas encontrados
Robos.Bola = [ Cores.XCentrosM(1:find(Cores.AreasM(:,Constantes.CorBola)>0,1,'last'),Constantes.CorBola) ...
               Cores.YCentrosM(1:find(Cores.AreasM(:,Constantes.CorBola)>0,1,'last'),Constantes.CorBola) ];