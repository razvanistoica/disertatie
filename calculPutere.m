function [putere, energ] = calculPutere(v)

%Initializare parametrii

Fe = 44100;
N = length(v);

%Calculul puteriilor

putere = abs(fft(v)) .^ 2;
energ = sum(v .^2);
end