clear all
close all
clc

%% Program principal - Se apeleaza functiile pentru citire invatare si detectie
numberOfRecordingsForTraining = 10;   %max 15
fs = 44100;

pathToRec = 'D:\Work\School\Disertatie\Date antrenare si test\AudioData\AudioData'

[emotioDataCluster] = citireSiPreprocesareSemnale(pathToRec, numberOfRecordingsForTraining);




tic

% [vectoriCaracteristici] = prelucrareFerestre(ferestreSemnalVocal);
[emotioDataCluster] = construireClase(emotioDataCluster);
emotioDataCluster = constructieSiAplicareFiltru(emotioDataCluster)

toc
