function S = ConectarSerial(COM)

try
    fclose(instrfindall);
end
if nargin == 0
    a = instrhwinfo('serial');
    jj = 1;
    for ii = 1:length(a.ObjectConstructorName)
        S(ii) = eval(a.ObjectConstructorName{ii});
        
    end
else
    for ii = 1:length(COM)
        S(ii) = serial(COM{ii});
    end
    
end
aa = [];
for ii = 1:length(S)
    try
        fopen(S(ii));
        disp([S(ii).Port ' conectada!']);
    catch
        aa = [aa ii];
        disp(['[!]' S(ii).Port ' não conectada!']);
    end
end
for ii = length(aa):-1:1
    
    S(aa(ii)) = [];
end

end