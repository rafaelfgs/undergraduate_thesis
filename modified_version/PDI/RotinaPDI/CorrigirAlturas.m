%% Corige os erros relacionados �s alturas dos objetos

% Centro da Imagem (em pixels)
Pseudo.CentroP = Camera.Redimensionar .* ([640 480]./2);

% Dist�ncia das cores ao centro da imagem (em pixels)
Pseudo.XDistancia = Pseudo.XCentrosP - Pseudo.CentroP(1);
Pseudo.YDistancia = Pseudo.YCentrosP - Pseudo.CentroP(2);
Pseudo.Distancia = sqrt(Pseudo.XDistancia.^2 + Pseudo.YDistancia.^2);

% Pre aloca a vari�vel de alturas
Pseudo.Altura = zeros(1,size(Pseudo.XDistancia,2));

% Altura dos objetos em pixels
Pseudo.Altura([ConstantesPDI.CorNos ConstantesPDI.CorAdv ConstantesPDI.CorRobo]) = ConstantesPDI.AlturaRobo./Relacao.Constante;
Pseudo.Altura(ConstantesPDI.CorBola) = (ConstantesPDI.AlturaBola./2)./Relacao.Constante;
Pseudo.AlturaCam = ConstantesPDI.AlturaCam./Relacao.Constante;

% Tangente do �ngulo entre a cor e a c�mera (entre 0 e inf)
Pseudo.XAngulo = Pseudo.XDistancia ./ (Pseudo.AlturaCam);
Pseudo.YAngulo = Pseudo.YDistancia ./ (Pseudo.AlturaCam);

% Erro cometido nos eixos x e y dos rob�s
Pseudo.XErro = Pseudo.XAngulo.*repmat(Pseudo.Altura,size(Pseudo.XDistancia,1),1);
Pseudo.YErro = Pseudo.YAngulo.*repmat(Pseudo.Altura,size(Pseudo.YDistancia,1),1);

% Corre��o dos centroides dos objetos
Cores.XCentrosP = Pseudo.XCentrosP - Pseudo.XErro;
Cores.YCentrosP = Pseudo.YCentrosP - Pseudo.YErro;

% Corre��o das �reas dos objetos
Cores.AreasP = Pseudo.AreasP + 0.000578.*Pseudo.Distancia.^2 + 0.0395.*Pseudo.Distancia;
Cores.AreasP = Cores.AreasP .* (Pseudo.AreasP>0);