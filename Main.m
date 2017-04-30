% clear all
% close all
% clc

%% Program principal - Se apeleaza functiile pentru citire invatare si detectie
% numberOfRecordingsForTraining = 10;   %max 15
% fs = 44100;

% pathToRec = 'D:\Work\School\Disertatie\Date antrenare si test\AudioData\AudioData'

% [emotioDataCluster] = citireSiPreprocesareSemnale(pathToRec, numberOfRecordingsForTraining);

% emotioDataCluster()
start = 1;
for j = 1 : size(emotioDataCluster,1)
    for i = 1 : numberOfRecordingsForTraining * 4
        x = emotioDataCluster{j,6}{1,i};
        alfa(:,start:start + size(x,2) - 1) = x(:,1:end);
        start = start + size(x,2);
    end
end
% tic

% [vectoriCaracteristici] = prelucrareFerestre(ferestreSemnalVocal);
% [emotioDataCluster] = construireClase(emotioDataCluster);
% emotioDataCluster = constructieSiAplicareFiltru(emotioDataCluster)

% toc
