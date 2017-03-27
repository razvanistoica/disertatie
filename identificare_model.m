function [modele] = identificare_model(X, r, s)
%%
%X - ferestre
%r - ordinul fara sa tinem cont de s
%s - skip factor
%r si s vectori -> r(i) corespunde lui s(i)

[M, N] = size(X);
if (M > N)
    X = X';
    [M, N] = size(X);
end

p = length(r);

for i = 1 : p
    rr = r(i)/s(i);
    model = zeros(M, rr);
    
    for j = 1 : M
        D = zeros(r(i),N);
        for k = 1 : r(i)
           D(k,(k+1):N) = X(j,1:(N-k));  
        end
        Y = [D(s(i):s(i):r(i), :)];
        
        model(j, :) = (Y*Y')\(Y*X(j,:)');

    end
    modele{i} = model; 
end

end