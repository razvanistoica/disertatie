function [dataCluster] = constructieSiAplicareFiltru(dataCluster)

[M,N] = size(dataCluster);


for i = 1:M
    
    [L,T] = size(dataCluster{i,3});
    for j = 1:T
        dataCluster{i,N+1}{j} = identificare_model(dataCluster{i,3}{j}, [12 32],[2 4]);
        [Xcaci, rez] = aplicareFiltru(dataCluster{i,3}{j}, dataCluster{i,N+1}{j}, [2 4]);
        dataCluster{i,N+2}{j} = Xcaci;
        dataCluster{i,N+3}{j} = rez;
    end
end


end