%% Converte as �reas e os centr�ides de pixels para mil�metros ou cent�metros

% Converte a �rea de pixels� para cent�metros�
Cores.AreasM = (Relacao.Constante/10)^2 .* Cores.AreasP;

% Pr� aloca as vari�veis dos valores em mil�metros ou cent�metros
Cores.XCentrosM = nan(size(Cores.XCentrosP,1),7);
Cores.YCentrosM = nan(size(Cores.YCentrosP,1),7);

% Percorre todas as cores
for ii = [ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorRobo ConstantesPDI.CorBola]
    
    % Percorre a quantidade encontrada de cada cor
    for jj = 1:find(Cores.AreasM(:,ii)>0,1,'last')
        
        % Converte a posi��o (x,y) do centr�ide das cores para mil�metros
        Cores.XCentrosM(jj,ii) = ( Cores.XCentrosP(jj,ii).^Relacao.Potencias(1,:) .* Cores.YCentrosP(jj,ii).^Relacao.Potencias(2,:) ) * Relacao.Tpx2mm.A';
        Cores.YCentrosM(jj,ii) = ( Cores.XCentrosP(jj,ii).^Relacao.Potencias(1,:) .* Cores.YCentrosP(jj,ii).^Relacao.Potencias(2,:) ) * Relacao.Tpx2mm.B';
        
    end
    
end

% Percorre todas as cores
for ii = [ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorRobo ConstantesPDI.CorBola]
    
    % Verifica se a cor � prim�ria ou secund�ria e zera as �reas muito grandes ou muito pequenas
    if any(ii == [ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorBola])
        Cores.AreasM(Cores.AreasM(:,ii) > ConstantesPDI.Area1Max | Cores.AreasM(:,ii) < ConstantesPDI.Area1Min ,ii) = 0;
    elseif any(ii == ConstantesPDI.CorRobo)
        Cores.AreasM(Cores.AreasM(:,ii) > ConstantesPDI.Area2Max | Cores.AreasM(:,ii) < ConstantesPDI.Area2Min ,ii) = 0;
    end
    
    % Classifica as �reas em ordem decescente e salva os �ndices
    [Cores.AreasM(:,ii),Cores.Indice] = sort(Cores.AreasM(:,ii),'descend');
    
    % Classifica os centr�ides de acordo com os �ndices encontrados
    Cores.XCentrosM(:,ii) = Cores.XCentrosM(Cores.Indice,ii);
    Cores.YCentrosM(:,ii) = Cores.YCentrosM(Cores.Indice,ii);
    
    % Limpa os centr�ides com �rea igual � zero
    Cores.XCentrosM(Cores.AreasM(:,ii)==0,ii) = NaN;
    Cores.YCentrosM(Cores.AreasM(:,ii)==0,ii) = NaN;
    
end

% Exclui as linhas que possuem �rea igual � zero
Cores.AreasM(all(Cores.AreasM==0,2),:) = [];
Cores.XCentrosM(size(Cores.AreasM,1)+1:end,:) = [];
Cores.YCentrosM(size(Cores.AreasM,1)+1:end,:) = [];