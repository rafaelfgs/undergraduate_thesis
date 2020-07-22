%% Determina a rela��o entre pixels e mil�metros

% Realiza a transforma��o geom�trica dos dados
Relacao.Tpx2mm = fitgeotrans(Relacao.Milimetros,Relacao.Pixels,'polynomial',4);

% Pr� aloca as vari�vel com as dist�ncias em mil�metros
Relacao.Posicao = zeros(4,2);

% Determina as constantes e converte a posi��o (80,60) para mil�metros
Relacao.Posicao(1,:) = (  80.^Relacao.Potencias(1,:) .*  60.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina as constantes e converte a posi��o (240,60) para mil�metros
Relacao.Posicao(2,:) = ( 240.^Relacao.Potencias(1,:) .*  60.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina as constantes e converte a posi��o (80,180) para mil�metros
Relacao.Posicao(3,:) = (  80.^Relacao.Potencias(1,:) .* 180.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina as constantes e converte a posi��o (240,180) para mil�metros
Relacao.Posicao(4,:) = ( 240.^Relacao.Potencias(1,:) .* 180.^Relacao.Potencias(2,:) ) * ...
                       [ Relacao.Tpx2mm.A' Relacao.Tpx2mm.B' ];

% Determina uma m�dia de quantos mil�metros equivale � um pixel
Relacao.Constante = mean([ rssq(Relacao.Posicao(2,:)-Relacao.Posicao(1,:)) / 160 ...
                           rssq(Relacao.Posicao(3,:)-Relacao.Posicao(1,:)) / 120 ...
                           rssq(Relacao.Posicao(4,:)-Relacao.Posicao(1,:)) / 200 ...
                           rssq(Relacao.Posicao(3,:)-Relacao.Posicao(2,:)) / 200 ...
                           rssq(Relacao.Posicao(4,:)-Relacao.Posicao(2,:)) / 120 ...
                           rssq(Relacao.Posicao(4,:)-Relacao.Posicao(3,:)) / 160 ]);