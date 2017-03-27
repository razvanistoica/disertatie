function [signalOut] = speechPauseElimination(signalIn)

meanSignalIn = mean(signalIn);

j = 0;
for i = 1:length(alfa)
    
    if (abs(signalIn(i)) > meanSignalIn/5)
        signalIn(i);
        j = j + 1;
        signalOut(j) = signalIn(i);
    end
end