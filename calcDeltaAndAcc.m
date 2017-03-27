function [Dt, energ] = calcDeltaAndAcc(vectCalcDelta, n)

[m, k] = size(vectCalcDelta);
Dt = zeros(1, k);
pondere = 0;

for i = 1:n
    Dt = Dt + (vectCalcDelta(i, :) - vectCalcDelta(m + 1 - i, :));
    pondere = pondere + n^2;
end

Dt = Dt / (2 * pondere);
energ = sum(Dt .^2);
end