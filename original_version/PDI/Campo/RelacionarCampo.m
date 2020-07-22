%% Determina a relação entre pixels e milímetros

% Realiza a transformação geométrica dos dados
Relacao.Tpx2mm = fitgeotrans(Relacao.Milimetros,Relacao.Pixels,'polynomial',4);

% Pré aloca as variável com as distâncias em milímetros
Relacao.Posicao = zeros(4,2);

% Determina as constantes e converte a posição (80,60) para milímetros
Relacao.Posicao(1,:) = (  80.^Relacao.Potencias(1,:) .*  60.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina as constantes e converte a posição (240,60) para milímetros
Relacao.Posicao(2,:) = ( 240.^Relacao.Potencias(1,:) .*  60.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina as constantes e converte a posição (80,180) para milímetros
Relacao.Posicao(3,:) = (  80.^Relacao.Potencias(1,:) .* 180.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina as constantes e converte a posição (240,180) para milímetros
Relacao.Posicao(4,:) = ( 240.^Relacao.Potencias(1,:) .* 180.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina uma média de quantos milímetros equivale à um pixel
Relacao.Constante = mean([ rssq(Relacao.Posicao(2,:)-Relacao.Posicao(1,:)) / 160 ...
                           rssq(Relacao.Posicao(3,:)-Relacao.Posicao(1,:)) / 120 ...
                           rssq(Relacao.Posicao(4,:)-Relacao.Posicao(1,:)) / 200 ...
                           rssq(Relacao.Posicao(3,:)-Relacao.Posicao(2,:)) / 200 ...
                           rssq(Relacao.Posicao(4,:)-Relacao.Posicao(2,:)) / 120 ...
                           rssq(Relacao.Posicao(4,:)-Relacao.Posicao(3,:)) / 160 ]);