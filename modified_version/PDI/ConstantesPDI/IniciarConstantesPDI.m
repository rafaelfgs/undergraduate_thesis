%% Determina as constantes do Jogo

try
    
    % Salva as áreas primárias encontradas na variável de constantes
    ConstantesPDI.Areas1 = [Cores.AreasM(Cores.AreasM(:,ConstantesPDI.CorNos)>0,ConstantesPDI.CorNos);...
                            Cores.AreasM(Cores.AreasM(:,ConstantesPDI.CorAdv)>0,ConstantesPDI.CorAdv);...
                            Cores.AreasM(Cores.AreasM(:,ConstantesPDI.CorBola)>0,ConstantesPDI.CorBola)]';
    ConstantesPDI.Areas1(size(ConstantesPDI.Areas1,2)+1:7) = 0;
    ConstantesPDI.Areas1(8:size(ConstantesPDI.Areas1,2)) = [];
    
    % Salva as áreas secundárias encontradas na variável de constantesCorRobo(1)
    ConstantesPDI.Areas2 = [Cores.AreasM(Cores.AreasM(:,ConstantesPDI.CorRobo(1))>0,ConstantesPDI.CorRobo(1));...
                            Cores.AreasM(Cores.AreasM(:,ConstantesPDI.CorRobo(2))>0,ConstantesPDI.CorRobo(2));...
                            Cores.AreasM(Cores.AreasM(:,ConstantesPDI.CorRobo(3))>0,ConstantesPDI.CorRobo(3))]';
    ConstantesPDI.Areas2(size(ConstantesPDI.Areas2,2)+1:7) = 0;
    ConstantesPDI.Areas2(8:size(ConstantesPDI.Areas2,2)) = [];
    
    % Salva as distâncias encontradas na variável de constantes
    ConstantesPDI.Distancias = Robos.Distancias(~isnan(Robos.Distancias))';
    ConstantesPDI.Distancias(size(ConstantesPDI.Distancias,2)+1:7) = 0;
    ConstantesPDI.Distancias(8:size(ConstantesPDI.Distancias,2)) = [];
    
catch
    
end

% Chama a função para criar a tela de constantes
CriarConstantesPDI