function [Xcaci, rezid] = aplicareFiltru(X, filtru, s)

[M,N] = size(X);
for i = 1 : length(filtru)
    pas = s(i);
    rr = size(filtru{i},2);
    r = rr * pas;
    
    for j = 1 : M
        D = zeros(r,N);
        for k = 1 : r
           D(k,(k+1):N) = X(j,1:(N-k));  
        end
        Y = [D(pas:pas:r, :)];
        rez(j,:,i) = X(j,:) - filtru{i}(j,:)*Y;
    end
end


[alfa, index] = min(rez.^2,[],3);
for i = 1 : M
    for j = 1 : N
        rezid(i,j) = rez(i,j,index(i,j));
    end
end

Xcaci = X - rezid;
end