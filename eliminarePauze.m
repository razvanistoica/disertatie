function [signalFaraPauza] = eliminarePauze(signal, prag)
% prag energie valori intre 0 si 1

if (exist('param', 'var') == 0)
    prag = 0.2;
end

[linii, col] = size(signal);
if ( col > 1 )
    signal = signal';
end

lFer = 250;
signalFaraPauza = 0;
avgEnerg = sum(signal.^2)/length(signal);

for i = 1 : ceil(length(signal)/lFer) - 1
    sigFer = signal((i - 1) * lFer + 1 : (i - 1) * lFer + lFer);
    avgEnergFer = sum(sigFer.^2) / lFer;
    
    if (avgEnergFer > avgEnerg * prag)        
        signalFaraPauza = [signalFaraPauza ; sigFer];
    end
end

sigFer = signal(i * lFer + 1 : length(signal));
avgEnergFer = sum(sigFer.^2) / length(sigFer);
    
if (avgEnergFer > avgEnerg * prag)
    signalFaraPauza = [signalFaraPauza ; sigFer];
end

signalFaraPauza = signalFaraPauza(2 : length(signalFaraPauza));

end