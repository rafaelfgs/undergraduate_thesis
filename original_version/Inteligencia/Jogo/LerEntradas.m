%% Lê e reorganiza a variável comunicada

% Lê a variável comunicada
% Entrada.Vetor = fscanf(Comunicacao.u2);

% Entrada pré-definida para teste
Entrada.Vetor = ['-400 400-135   0   0   0',...
                 ' 000 400 -90   0   0   0',...
                 ' 400 400 -45   0   0   0',...
                 '-400-400 135   0   0   0',...
                 ' 000-400  90   0   0   0',...
                 ' 400-400  45   0   0   0',...
                 '   0   0   0   0   0   0'];

% Limpa os dados da Comunicação
flushinput(Comunicacao.u2)
flushinput(Comunicacao.u2)
flushinput(Comunicacao.u2)
flushinput(Comunicacao.u2)
flushinput(Comunicacao.u2)
flushinput(Comunicacao.u2)
flushinput(Comunicacao.u2)
flushinput(Comunicacao.u2)

% Constante de saturação da velocidade
% ##### DEVE ESTAR IGUAL NO PDI #####
Entrada.K = 3;

% Caso a Entrada esteja correta, salva as variáveis de cada robô e da bola
if size(Entrada.Vetor,2) == 168
    
    Entrada.NErros(1) = Entrada.NErros(1)+ 1;
    
    Robo(1).Posicao    = [str2double(Entrada.Vetor(001:004)) str2double(Entrada.Vetor(005:008)) str2double(Entrada.Vetor(009:012))]';
    Robo(1).Velocidade = Entrada.K*[str2double(Entrada.Vetor(013:016)) str2double(Entrada.Vetor(017:020)) str2double(Entrada.Vetor(021:024))]';
    
    Robo(2).Posicao    = [str2double(Entrada.Vetor(025:028)) str2double(Entrada.Vetor(029:032)) str2double(Entrada.Vetor(033:036))]';
    Robo(2).Velocidade = Entrada.K*[str2double(Entrada.Vetor(037:040)) str2double(Entrada.Vetor(041:044)) str2double(Entrada.Vetor(045:048))]';
    
    Robo(3).Posicao    = [str2double(Entrada.Vetor(049:052)) str2double(Entrada.Vetor(053:056)) str2double(Entrada.Vetor(057:060))]';
    Robo(3).Velocidade = Entrada.K*[str2double(Entrada.Vetor(061:064)) str2double(Entrada.Vetor(065:068)) str2double(Entrada.Vetor(069:072))]';
    
    Adv(1).Posicao     = [str2double(Entrada.Vetor(073:076)) str2double(Entrada.Vetor(077:080)) str2double(Entrada.Vetor(081:084))]';
    Adv(1).Velocidade  = Entrada.K*[str2double(Entrada.Vetor(085:088)) str2double(Entrada.Vetor(089:092)) str2double(Entrada.Vetor(093:096))]';
    
    Adv(2).Posicao     = [str2double(Entrada.Vetor(097:100)) str2double(Entrada.Vetor(101:104)) str2double(Entrada.Vetor(105:108))]';
    Adv(2).Velocidade  = Entrada.K*[str2double(Entrada.Vetor(109:112)) str2double(Entrada.Vetor(113:116)) str2double(Entrada.Vetor(117:120))]';
    
    Adv(3).Posicao     = [str2double(Entrada.Vetor(121:124)) str2double(Entrada.Vetor(125:128)) str2double(Entrada.Vetor(129:132))]';
    Adv(3).Velocidade  = Entrada.K*[str2double(Entrada.Vetor(133:136)) str2double(Entrada.Vetor(137:140)) str2double(Entrada.Vetor(141:144))]';
    
    Bola.Posicao       = [str2double(Entrada.Vetor(145:148)) str2double(Entrada.Vetor(149:152)) str2double(Entrada.Vetor(153:156))]';
    Bola.Velocidade    = Entrada.K*[str2double(Entrada.Vetor(157:160)) str2double(Entrada.Vetor(161:164)) str2double(Entrada.Vetor(165:168))]';
    
% Exibe os posíveis erros de comunicação
else
    
    Entrada.NErros(2) = Entrada.NErros(2)+ 1;
%     warning('Entrada lida com tamanho diferente do esperado')
    
end