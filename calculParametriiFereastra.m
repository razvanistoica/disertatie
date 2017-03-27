function [lFer, suprapunere] = calculParametriiFereastra(Fs)
durataFer = 0.025;
raportSuprapunere = 0.4;

lFer = floor(durataFer * Fs);
suprapunere = floor(raportSuprapunere * lFer);

end
