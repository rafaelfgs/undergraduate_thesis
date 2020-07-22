%% Alteração dos valores definidos pelas caixas de texto

% Percorre todas as caixas de texto
for ii = 1:6
    
    % Verifica se o valor digitado é um número real
    if ~isnan(str2double(TelaCalibracao.Botao.Edit(ii).String)) && isreal(str2double(TelaCalibracao.Botao.Edit(ii).String))
        
        % Verifica se os valores mínimos são menores que 0
        if ( ii == 1 || ii == 3 || ii == 5 ) && str2double(TelaCalibracao.Botao.Edit(ii).String) < 0
            TelaCalibracao.Botao.Edit(ii).String = '0';
        end
        
        % Verifica se o valor máximo de MAT é maior que 360
        if ii == 2 && str2double(TelaCalibracao.Botao.Edit(ii).String) > 360
            TelaCalibracao.Botao.Edit(ii).String = '360';
        end
        
        % Verifica se os valores máximos de SAT e LUM são maiores que 100 e maiores que o mínimo
        if ii == 4 || ii == 6
            if str2double(TelaCalibracao.Botao.Edit(ii).String) > 100
                TelaCalibracao.Botao.Edit(ii).String = '100';
            elseif str2double(TelaCalibracao.Botao.Edit(ii).String) < str2double(TelaCalibracao.Botao.Edit(ii-1).String)
                TelaCalibracao.Botao.Edit(ii).String = TelaCalibracao.Botao.Edit(ii-1).String;
            end
        end
        
        % Arredonda o número digitado para melhor visualização
        TelaCalibracao.Botao.Edit(ii).String = num2str(round(str2double(TelaCalibracao.Botao.Edit(ii).String)));
        
        % Salva o valor definido pelas caixas de texto
        if ii == 1 || ii == 2
            Calibracao(ImCalib.Cor,ii) = uint8(255*(str2double(TelaCalibracao.Botao.Edit(ii).String)/360)); %#ok<*SAGROW>
        else
            Calibracao(ImCalib.Cor,ii) = uint8(255*(str2double(TelaCalibracao.Botao.Edit(ii).String)/100));
        end
            
        
    else
        
        % Retorna o valor para a cor anterior
        if ii == 1 || ii == 2
            TelaCalibracao.Botao.Edit(ii).String = num2str(round(360*double(Calibracao(ImCalib.Cor,ii))/255));
        else
            TelaCalibracao.Botao.Edit(ii).String = num2str(round(100*double(Calibracao(ImCalib.Cor,ii))/255));
        end
        
    end
    
end

% Chama a função para exibir a segmentação da cor escolhida
ProcessarImagem