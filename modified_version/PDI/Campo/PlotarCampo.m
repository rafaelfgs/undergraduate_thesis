%% Determina e plota os pontos do campo transforamdos em pixels

% Exibe a imagem atual da Câmera
imshow(imresize(getsnapshot(Camera.Video),Camera.Redimensionar),'parent',TelaCampo.Imagem)

% Realiza a transformação geométrica inversa dos dados
Relacao.Tmm2px = fitgeotrans(Relacao.Pixels,Relacao.Milimetros,'polynomial',4);

% Percorre os pontos chave do campo
for ii = 1:size(Relacao.Milimetros,1)
    
      Relacao.Pixels(ii,:) = ( Relacao.Milimetros(ii,1).^Relacao.Potencias(1,:) .* ...
                               Relacao.Milimetros(ii,2).^Relacao.Potencias(2,:) ) * ...
                             [ Relacao.Tmm2px.A' Relacao.Tmm2px.B' ];
      
end

% Plota os pontos em pixels encontrados
hold on
try plot(Relacao.PxReal(:,1),Relacao.PxReal(:,2),'r.','markersize',14,'parent',TelaCampo.Imagem), catch, end
hold off