%% Filtra uma imagem bin�ria (l�gica) ou em escala de cinza (uint8)

function Imf = FiltrarImagem(Im)

% A fun��o cria uma imagem tempor�ria Imt com duas linhas e duas colunas a
% mais que a imagem original. O centro da imagem, que vai do elemento (2,2)
% at� o elemento(end-2,end-2) corresopnde � imagem original. A primeira e a
% �ltima linha correspondem � primeira e a �ltima linha da imagem original,
% assim como �s colunas e os v�rtices.

%                              0   0  63 127 127
%       0  63 127              0   0  63 127 127
%     127 255   0     =>     127 127 255   0   0
%      63   0 191             63  63   0 191 191
%                             63  63   0 191 191

% A filtragem � feita sobre a imagem tempor�ria. O valor de um elemento da
% imagem filtrada � definido pelos valores  da imagem original de acordo
% com os seguintes pesos: 4 para o elemento de mesmas linha e coluna, 2 
% para os elementos que fazem fronteira direta, e 1 para os que fazem
% fronteira na diagonal.

% Por conta da satura��o que possa ser produzida pela soma, os valores s�o
% convertidos para uma classe superior � atual (l�gico para uint8 e uint8
% para double). Para a filtragem bin�ria, o resultado l�gico corresponde
% aos valores maiores ou iguais a 8. Para a filtragem em escala de cinza,
% o resultado corresponde a convers�o para uint8 dos valores divididos por
% 8. Caso a entrada seja diferente de l�gica ou uint8, a fun��o retorna um
% erro.

if islogical(Im)
    
    Imt = uint8( [ Im(1,1) Im(1,:) Im(1,end); Im(:,1) Im Im(:,end); Im(end,1) Im(end,:) Im(end,end)] );
    
    Imf = (           Imt(1:end-2,1:end-2) + uint8(2).*Imt(1:end-2,2:end-1) +           Imt(1:end-2,3:end) + ...
            uint8(2).*Imt(2:end-1,1:end-2) + uint8(4).*Imt(2:end-1,2:end-1) + uint8(2).*Imt(2:end-1,3:end) + ...
                      Imt( 3:end, 1:end-2) + uint8(2).*Imt( 3:end, 2:end-1) +           Imt( 3:end, 3:end) ) >= uint8(8);
    
elseif isa(Im,'uint8')
    
    Imt = double( [ Im(1,1) Im(1,:) Im(1,end); Im(:,1) Im Im(:,end); Im(end,1) Im(end,:) Im(end,end)] );
    
    Imf = uint8( (    Imt(1:end-2,1:end-2) + 2.*Imt(1:end-2,2:end-1) +    Imt(1:end-2,3:end) + ...
                   2.*Imt(2:end-1,1:end-2) + 4.*Imt(2:end-1,2:end-1) + 2.*Imt(2:end-1,3:end) + ...
                      Imt( 3:end, 1:end-2) + 2.*Imt( 3:end, 2:end-1) +    Imt( 3:end, 3:end) ) ./ 16 );
    
else
    
    error('Trying to filter a %s image.\nInput must be a logical or uint8.',class(Im))
    
end