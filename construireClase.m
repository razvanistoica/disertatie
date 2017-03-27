function [dataCluster] = construireClase(dataCluster)

N = size(dataCluster,1);

for i = 1:N
    M = size(dataCluster{i,1},2);
    mfccTotal = [];
    
    for j = 1:M
        mfcc = prelucrareFerestre(dataCluster{i,1}{j});
        dataCluster{i,3}{j} = mfcc';
        mfccTotal = [mfccTotal; mfcc];
    end
    dataCluster{i,4} = mfccTotal';
end

end
