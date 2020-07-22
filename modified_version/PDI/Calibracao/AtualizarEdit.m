%% Altera��o dos valores definidos pelas caixas de texto

% Percorre todas as caixas de texto
for ii = 1:6
    
    % Verifica se o valor digitado � um n�mero real
    if ~isnan(str2double(TelaCalibracao.Botao.Edit(ii).String)) && isreal(str2double(TelaCalibracao.Botao.Edit(ii).String))
        
        % Verifica se os valores s�o menores que 0
        if str2double(TelaCalibracao.Botao.Edit(ii).String) < 0
            TelaCalibracao.Botao.Edit(ii).String = '0';
        end
        
        % Verifica se os valores da Matiz s�o maiores que 360
        if ii <= 2 && str2double(TelaCalibracao.Botao.Edit(ii).String) > 360
            TelaCalibracao.Botao.Edit(ii).String = '360';
        end
        
        % Verifica se os valores de Satura��o e Luminosidade s�o maiores que 100
        if ii >= 3 && str2double(TelaCalibracao.Botao.Edit(ii).String) > 100
            TelaCalibracao.Botao.Edit(ii).String = '100';
        end
        
        % Verifica se os valores m�ximos de Satura��o e Luminosidade s�o menores que o m�nimo
        if ( ii == 4 || ii == 6 ) && str2double(TelaCalibracao.Botao.Edit(ii).String) < str2double(TelaCalibracao.Botao.Edit(ii-1).String)
            TelaCalibracao.Botao.Edit(ii).String = TelaCalibracao.Botao.Edit(ii-1).String;
        end
        
        % Arredonda e salva o valor definido pelas caixas de texto
        if ii == 1 || ii == 2
            TelaCalibracao.Botao.Edit(ii).String = num2str(2*round(str2double(TelaCalibracao.Botao.Edit(ii).String)/2));
            Calibracao(ImCalib.Cor,ii) = uint8(str2double(TelaCalibracao.Botao.Edit(ii).String)/2); %#ok<SAGROW>
        else
            TelaCalibracao.Botao.Edit(ii).String = num2str(round(str2double(TelaCalibracao.Botao.Edit(ii).String)));
            Calibracao(ImCalib.Cor,ii) = uint8(str2double(TelaCalibracao.Botao.Edit(ii).String)); %#ok<SAGROW>
        end
        
    else
        
        % Retorna o valor para a cor anterior
        if ii == 1 || ii == 2
            TelaCalibracao.Botao.Edit(ii).String = num2str(2*double(Calibracao(ImCalib.Cor,ii)));
        else
            TelaCalibracao.Botao.Edit(ii).String = num2str(double(Calibracao(ImCalib.Cor,ii)));
        end
        
    end
    
end

% Chama a fun��o para exibir a segmenta��o da cor escolhida
ProcessarImagem