function [vectorCaracteristici] = prelucrareFerestre(ferestreSemnalVocal)
[nrLinii, nrCol] = size(ferestreSemnalVocal);
N = nrCol;
fe = 44100;
n = 1; % coeficient mfcc pt delta


for i = 1 : n
ferestreSemnalVocal = [ferestreSemnalVocal(1,:); ferestreSemnalVocal; ferestreSemnalVocal(nrLinii + i - 1, :)];
end

for i = 1 : nrLinii + 2 * n
 
    [vecPutereSemnal, energie(i)] = calculPutere(ferestreSemnalVocal(i, :));
    
    n2 = floor(N/2);
    m = Create_MelFrequencyFilterBank(fe, N, 40);
    
    z = log(m * vecPutereSemnal(1:n2)');
    
    cosTransfCoef = dct(z);
    mfcc(i,:) = cosTransfCoef(2 : 13) - mean(cosTransfCoef(2 : 13));
    
    if (i > 2 * n)
        [delta(i - n, :), energieDelta(i - n)] = calcDeltaAndAcc(mfcc(i - 2 *  n : i, :), n);
    
    if (i == 2 * n + 1)
        for j = 1 : n
            delta(j, :) = delta(n + 1, :);
            energieDelta(j) = energieDelta(n + 1);
        end
    end
    
    if (i == nrLinii + 2 * n)
        for j = 1 : n
            delta(i - n + j, :) = delta(i - n, :);
            energieDelta(i - n + j) = energieDelta(i - n);
        end
    end
    end
    
    if (i > 3 * n)
        [acceleratie(i - 3 * n, :), energieAcc(i - 3 * n)] = calcDeltaAndAcc(delta(i - 3 *  n : i - n, :), n);
        vectorCaracteristici(i - 3 * n, :) = [mfcc(i - 2 * n, :) energie(i - 2 * n) delta(i - 2 * n, :) acceleratie(i - 3 * n, :) energieDelta(i - 2 * n) energieAcc(i - 3 * n)];
    end
    
end

for i = length(acceleratie) + 1 : nrLinii
    [acceleratie(i, :), energieAcc(i)] = calcDeltaAndAcc(delta(i - 2 : i + 2, :), n);
    vectorCaracteristici(i, :) = [mfcc(i + 2 * n, :) energie(i + 2 * n) delta(i + 2 * n, :) acceleratie(i, :) energieDelta(i + 2 * n) energieAcc(i)];
end

% for i = nrLinii/2 : nrLinii/2 + 10
%     figure
%     plot(vectorCaracteristici(i, :));
%     mean(vectorCaracteristici(i, :));
%     var(vectorCaracteristici(i, :));
% end

% assignin('base', 'vectorCaracteristici', vectorCaracteristici);
% X = vectorCaracteristici';
% 
% B = multiscale_train(X, {2:2:20} );
% B1 = identificare_model(X, 20, 2);
% % [Xcaci1, rez1] = aplicareFiltru(X,B1,2);
% [Xcaci, rez] = multiscale_filter(X, B, {2:2:20} );
% assignin('base', 'Xcaci1', Xcaci1);
% assignin('base', 'rez1', rez1);
% assignin('base', 'Xcaci', Xcaci);
% assignin('base', 'rez', rez);
% assignin('base', 'B', B);
% assignin('base', 'B1', B1);
% assignin('base', 'X', X);

end