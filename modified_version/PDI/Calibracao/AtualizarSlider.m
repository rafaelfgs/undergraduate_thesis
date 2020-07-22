%% Alteração dos valores definidos pelos sliders

% Percorre todas as caixas de texto
for ii = 1:6
    
    % Verifica se os valores máximos de Saturação e Luminosidade são menores que os mínimos
    if ( ii == 4 || ii == 6 ) && TelaCalibracao.Botao.Slider(ii).Value < TelaCalibracao.Botao.Slider(ii-1).Value
        TelaCalibracao.Botao.Slider(ii).Value = TelaCalibracao.Botao.Slider(ii-1).Value;
    end
    
    % Arredonda e salva o valor definido pelos sliders
    if ii == 1 || ii == 2
        TelaCalibracao.Botao.Slider(ii).Value = 2*round(TelaCalibracao.Botao.Slider(ii).Value/2);
        Calibracao(ImCalib.Cor,ii) = TelaCalibracao.Botao.Slider(ii).Value/2; %#ok<SAGROW>
    else
        TelaCalibracao.Botao.Slider(ii).Value = round(TelaCalibracao.Botao.Slider(ii).Value);
        Calibracao(ImCalib.Cor,ii) = TelaCalibracao.Botao.Slider(ii).Value; %#ok<SAGROW>
    end
    
end

% Chama a função para exibir a segmentação da cor escolhida
ProcessarImagem