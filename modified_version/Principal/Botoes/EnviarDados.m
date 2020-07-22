%% Otimiza o Tempo e Envia os Dados para os Robôs

% Finaliza a contagem de tempo do Envio (desconta o tempo pausado do último envio)
Tempo.ToEnvio = toc(Tempo.TiEnvio)-Tempo.Pause;

% Reinicia a contagem de tempo do Envio
Tempo.TiEnvio = tic;

% Verifica o acumulado e a média das últimas iterações (esquecimento de 60%)
if Tempo.Media == 0
    Tempo.Media = Tempo.ToEnvio;
    Tempo.Acumulado = Tempo.ToEnvio;
else
    Tempo.Acumulado = Tempo.Acumulado + Tempo.ToEnvio;
    Tempo.Media = 0.4*Tempo.Media + 0.6*Tempo.ToEnvio;
    Tempo.Desvio = 0.4*Tempo.Desvio + 0.6*abs(Tempo.ToEnvio-Tempo.Media);
end

% Se não houver tempo para fazer outra iteração
if Tempo.Acumulado + (Tempo.Media+Tempo.Desvio) > ConstantesINT.TempoEnvio
    
    % Aguarda o momento certo e zera o acumulador
    Tempo.Pause = ConstantesINT.TempoEnvio - Tempo.Acumulado;
    pause(Tempo.Pause);
    Tempo.Acumulado = 0;
    
    % Reformulação dos dados enviados
    disp(sign(144-Saida.Pacote(4:9)).*(Saida.Pacote(4:9)-128*((Saida.Pacote(4:9)-144)>=0)-16))
    
    % Tenta enviar os dados
    try EnviarPacote(S,Saida.Pacote)
    catch, disp('Não foi possível enviar os dados nesta iteração!')
    end
    
else
    
    % Zera o tempo Pause caso haja tempo para fazer outra iteração
    Tempo.Pause = 0;
    
end