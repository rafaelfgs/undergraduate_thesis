%% Inicia o Envio dos Dados

if ~Partida.EmEnvio
    
    % Inicia a exibição do Envio dos Dados
    Partida.EmEnvio = true;
    set(TelaJogo.Botao(end),'string','Parar Envio')
    
    % Exibe um texto de Enviando Dados na Tela
    if Partida.EmJogo && ~Partida.ExibeSegmentacao && ~Partida.ExibeResultados
        TelaJogo.Envio = text(0.5,0.5,['Enviando' 10 10 'Dados'],'parent',TelaJogo.Imagem,...
                              'horizontalalignment','center','fontsize',48);
    end
    
else
    
    % Encerra a exibição do Envio dos Dados
    Partida.EmEnvio = false;
    set(TelaJogo.Botao(end),'string','Enviar Dados')
    
    % Exclui o texto Enviando Dados
    try delete(TelaJogo.Envio), catch, end
    
end