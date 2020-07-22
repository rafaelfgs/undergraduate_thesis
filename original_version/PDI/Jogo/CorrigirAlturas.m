%% Corige os erros relacionados às alturas dos objetos

% Centro da Imagem (em pixels)
Pseudo.CentroP = Camera.Redimensionar .* ([640 480]./2);

% Distância das cores ao centro da imagem (em pixels)
Pseudo.XDistancia = Pseudo.XCentrosP - Pseudo.CentroP(1);
Pseudo.YDistancia = Pseudo.YCentrosP - Pseudo.CentroP(2);
Pseudo.Distancia = sqrt(Pseudo.XDistancia.^2 + Pseudo.YDistancia.^2);

% Pre aloca a variável de alturas
Pseudo.Altura = zeros(1,size(Pseudo.XDistancia,2));

% Altura dos objetos em pixels
Pseudo.Altura([Constantes.CorNos Constantes.CorAdv Constantes.CorRobo]) = Constantes.AlturaRobo./Relacao.Constante;
Pseudo.Altura(Constantes.CorBola) = (Constantes.AlturaBola./2)./Relacao.Constante;
Pseudo.AlturaCam = Constantes.AlturaCam./Relacao.Constante;

% Tangente do ângulo entre a cor e a câmera (entre 0 e inf)
Pseudo.XAngulo = Pseudo.XDistancia ./ (Pseudo.AlturaCam);
Pseudo.YAngulo = Pseudo.YDistancia ./ (Pseudo.AlturaCam);

% Erro cometido nos eixos x e y dos robôs
Pseudo.XErro = Pseudo.XAngulo.*repmat(Pseudo.Altura,size(Pseudo.XDistancia,1),1);
Pseudo.YErro = Pseudo.YAngulo.*repmat(Pseudo.Altura,size(Pseudo.YDistancia,1),1);

% Correção dos centroides dos objetos
Cores.XCentrosP = Pseudo.XCentrosP - Pseudo.XErro;
Cores.YCentrosP = Pseudo.YCentrosP - Pseudo.YErro;

% Correção das áreas dos objetos
Cores.AreasP = Pseudo.AreasP + 0.000578.*Pseudo.Distancia.^2 + 0.0395.*Pseudo.Distancia;
Cores.AreasP = Cores.AreasP .* (Pseudo.AreasP>0);

% [a,f]=max(Pseudo.AreasP(:,6));
% b=max(Cores.AreasP(:,6));
% c=Pseudo.XDistancia(f,6);
% d=Pseudo.YDistancia(f,6);
% e=Pseudo.Distancia(f,6);
% try disp([a b c d e]), catch, end

%   a = sort(Pseudo.Distancia(:,6))';
%   b = sort(Pseudo.AreasP(:,6)','descend');
%   t = t + 1;
%   MediaDist = [MediaDist + a(1,1:2)];
%   MediaArea = [MediaArea + b(1,1:2)];

% disp([a abs(a(1)-a(2))])
% disp(Cores.AreasP(:,6)')