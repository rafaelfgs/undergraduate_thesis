%% Altera��o dos valores definidos pelos sliders

% Percorre todas as caixas de texto
for ii = 1:6
    
    % Verifica se os valores m�ximos de SAT e LUM s�o maiores que os m�nimos
    if ( ii == 4 || ii == 6 ) && TelaCalibracao.Botao.Slider(ii).Value < TelaCalibracao.Botao.Slider(ii-1).Value
        TelaCalibracao.Botao.Slider(ii).Value = TelaCalibracao.Botao.Slider(ii-1).Value;
    end
    
    % Arredonda o n�mero digitado para melhor visualiza��o
    TelaCalibracao.Botao.Slider(ii).Value = round(TelaCalibracao.Botao.Slider(ii).Value);
    
    
    % Salva o valor definido pelos sliders
    if ii == 1 || ii == 2
        Calibracao(ImCalib.Cor,ii) = uint8(255*(TelaCalibracao.Botao.Slider(ii).Value/360)); %#ok<*SAGROW>
    else
        Calibracao(ImCalib.Cor,ii) = uint8(255*(TelaCalibracao.Botao.Slider(ii).Value/100));
    end
    
end

% Chama a fun��o para exibir a segmenta��o da cor escolhida
ProcessarImagem