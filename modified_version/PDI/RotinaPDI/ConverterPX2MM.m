%% Converte as áreas e os centróides de pixels para milímetros ou centímetros

% Converte a área de pixels² para centímetros²
Cores.AreasM = (Relacao.Constante/10)^2 .* Cores.AreasP;

% Pré aloca as variáveis dos valores em milímetros ou centímetros
Cores.XCentrosM = nan(size(Cores.XCentrosP,1),7);
Cores.YCentrosM = nan(size(Cores.YCentrosP,1),7);

% Percorre todas as cores
for ii = [ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorRobo ConstantesPDI.CorBola]
    
    % Percorre a quantidade encontrada de cada cor
    for jj = 1:find(Cores.AreasM(:,ii)>0,1,'last')
        
        % Converte a posição (x,y) do centróide das cores para milímetros
        Cores.XCentrosM(jj,ii) = ( Cores.XCentrosP(jj,ii).^Relacao.Potencias(1,:) .* Cores.YCentrosP(jj,ii).^Relacao.Potencias(2,:) ) * Relacao.Tpx2mm.A';
        Cores.YCentrosM(jj,ii) = ( Cores.XCentrosP(jj,ii).^Relacao.Potencias(1,:) .* Cores.YCentrosP(jj,ii).^Relacao.Potencias(2,:) ) * Relacao.Tpx2mm.B';
        
    end
    
end

% Percorre todas as cores
for ii = [ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorRobo ConstantesPDI.CorBola]
    
    % Verifica se a cor é primária ou secundária e zera as áreas muito grandes ou muito pequenas
    if any(ii == [ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorBola])
        Cores.AreasM(Cores.AreasM(:,ii) > ConstantesPDI.Area1Max | Cores.AreasM(:,ii) < ConstantesPDI.Area1Min ,ii) = 0;
    elseif any(ii == ConstantesPDI.CorRobo)
        Cores.AreasM(Cores.AreasM(:,ii) > ConstantesPDI.Area2Max | Cores.AreasM(:,ii) < ConstantesPDI.Area2Min ,ii) = 0;
    end
    
    % Classifica as áreas em ordem decescente e salva os índices
    [Cores.AreasM(:,ii),Cores.Indice] = sort(Cores.AreasM(:,ii),'descend');
    
    % Classifica os centróides de acordo com os índices encontrados
    Cores.XCentrosM(:,ii) = Cores.XCentrosM(Cores.Indice,ii);
    Cores.YCentrosM(:,ii) = Cores.YCentrosM(Cores.Indice,ii);
    
    % Limpa os centróides com área igual à zero
    Cores.XCentrosM(Cores.AreasM(:,ii)==0,ii) = NaN;
    Cores.YCentrosM(Cores.AreasM(:,ii)==0,ii) = NaN;
    
end

% Exclui as linhas que possuem área igual à zero
Cores.AreasM(all(Cores.AreasM==0,2),:) = [];
Cores.XCentrosM(size(Cores.AreasM,1)+1:end,:) = [];
Cores.YCentrosM(size(Cores.AreasM,1)+1:end,:) = [];