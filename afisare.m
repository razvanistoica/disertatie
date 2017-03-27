function [putere]=afisare(x)
fe=44100;
N=length(x);

for i=length(x)+1:N;
    x(i)=0;
end

putere = abs(fft(x)) .^ 2;

axe = (0:1/N:1-1/N)*fe;

plot(axe(1:end/2), putere(1:end/2));
title('spectrul unei ferestre de semnal')
ylabel('Amplitudine')
xlabel('Frecventa [Hz]')

end
