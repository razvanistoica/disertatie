function [cluster] = citireSiPreprocesareSemnale(pathToRec, numberOfRecordingsForTraining)
durataFer = 0.025;
raportSuprapunere = 0.4;
FsDefault = 44100; %default frequency
[lFer, suprapunere] = calculParametriiFereastra(FsDefault);

folder = {'DC'; 'JE'; 'JK'; 'KL'};
for j = 1:4
    addpath(strcat(pathToRec,'\', folder{j}));
    for i = 1:numberOfRecordingsForTraining
        if (i < 10)
            index = strcat('0', int2str(i));
        else
            index = int2str(i);
        end
        
        [anger{i + 10 * (j - 1)}, Fs] = audioread( strcat('a',index,'.wav') );   % citeste fisierul audio si elimina componenta continua
        
%         figure
%         subplot(2,1,1);
%         plot(anger{i + 10 * (j - 1)});
%         title('semal initial')
%         xlabel('amplitudine')
%         ylabel('esantioane')
        
        anger{i + 10 * (j - 1)} = eliminarePauze(anger{i + 10 * (j - 1)});
        
%         subplot(2,1,2);
%         plot(anger{i + 10 * (j - 1)});
%         title('semal dupa eliminarea pauzelor')
%         xlabel('amplitudine')
%         ylabel('esantioane')
       
        
        anger{i + 10 * (j - 1)} = filter([1 -0.97], [1], detrend(anger{i + 10 * (j - 1)}')/std(anger{i + 10 * (j - 1)}(:)')); %pre-emphasis filter 1-0.97z^-1
        if ( ne(Fs, FsDefault) ) [lFer, suprapunere] = calculParametriiFereastra(Fs);  FsDefault = Fs; end   %evalueaza Fs dupa fiecare citire pentru a putea adapta citirea si pt alte semnale
        anger{i + 10 * (j - 1)} = segmentareFerestre(anger{i + 10 * (j - 1)}, lFer, raportSuprapunere); %segmenteaza semnalul in ferestre suprapuse
        
      
        [disgust{i + 10 * (j - 1)}, Fs] = audioread( strcat('d',index,'.wav') );  
        disgust{i + 10 * (j - 1)} = eliminarePauze(disgust{i + 10 * (j - 1)});
        disgust{i + 10 * (j - 1)} = filter([1 -0.97], [1], detrend(disgust{i + 10 * (j - 1)}')/std(disgust{i + 10 * (j - 1)}(:)'));
        if ( ne(Fs, FsDefault) ) [lFer, suprapunere] = calculParametriiFereastra(Fs);  FsDefault = Fs; end
        disgust{i + 10 * (j - 1)} = segmentareFerestre(disgust{i + 10 * (j - 1)}, lFer, raportSuprapunere);
        
        [fear{i + 10 * (j - 1)}, Fs] = audioread( strcat('f',index,'.wav') );        
        fear{i + 10 * (j - 1)} = eliminarePauze(fear{i + 10 * (j - 1)});
        fear{i + 10 * (j - 1)} = filter([1 -0.97], [1],detrend(fear{i + 10 * (j - 1)}')/std(fear{i + 10 * (j - 1)}(:)'));
        if ( ne(Fs, FsDefault) ) [lFer, suprapunere] = calculParametriiFereastra(Fs);  FsDefault = Fs; end
        fear{i + 10 * (j - 1)} = segmentareFerestre(fear{i + 10 * (j - 1)}, lFer, raportSuprapunere);
        
        [happiness{i + 10 * (j - 1)}, Fs] = audioread( strcat('h',index,'.wav') );
        happiness{i + 10 * (j - 1)} = eliminarePauze(happiness{i + 10 * (j - 1)});
        happiness{i + 10 * (j - 1)} = filter([1 -0.97], [1],detrend(happiness{i + 10 * (j - 1)}')/std(happiness{i + 10 * (j - 1)}(:)'));
        if ( ne(Fs, FsDefault) ) [lFer, suprapunere] = calculParametriiFereastra(Fs);  FsDefault = Fs; end
        happiness{i + 10 * (j - 1)} = segmentareFerestre(happiness{i + 10 * (j - 1)}, lFer, raportSuprapunere);
        
        [neutral{i + 10 * (j - 1)}, Fs] = audioread( strcat('n',index,'.wav') );
        neutral{i + 10 * (j - 1)} = eliminarePauze(neutral{i + 10 * (j - 1)});
        neutral{i + 10 * (j - 1)} = filter([1 -0.97], [1],detrend(neutral{i + 10 * (j - 1)}')/std(neutral{i + 10 * (j - 1)}(:)'));
        if ( ne(Fs, FsDefault) ) [lFer, suprapunere] = calculParametriiFereastra(Fs);  FsDefault = Fs; end
        neutral{i + 10 * (j - 1)} = segmentareFerestre(neutral{i + 10 * (j - 1)}, lFer, raportSuprapunere);
        
        [sadness{i + 10 * (j - 1)}, Fs] = audioread( strcat('sa',index,'.wav') );
        sadness{i + 10 * (j - 1)} = eliminarePauze(sadness{i + 10 * (j - 1)});
        sadness{i + 10 * (j - 1)} = filter([1 -0.97], [1], detrend(sadness{i + 10 * (j - 1)}')/std(sadness{i + 10 * (j - 1)}(:)'));
        if ( ne(Fs, FsDefault) ) [lFer, suprapunere] = calculParametriiFereastra(Fs);  FsDefault = Fs; end
        sadness{i + 10 * (j - 1)} = segmentareFerestre(sadness{i + 10 * (j - 1)}, lFer, raportSuprapunere);
        
        [surprise{i + 10 * (j - 1)}, Fs] = audioread( strcat('su',index,'.wav') );
        surprise{i + 10 * (j - 1)} = eliminarePauze(surprise{i + 10 * (j - 1)});
        surprise{i + 10 * (j - 1)} = filter([1 -0.97], [1], detrend(surprise{i + 10 * (j - 1)}')/std(surprise{i + 10 * (j - 1)}(:)'));
        if ( ne(Fs, FsDefault) ) [lFer, suprapunere] = calculParametriiFereastra(Fs);  FsDefault = Fs; end
        surprise{i + 10 * (j - 1)} = segmentareFerestre(surprise{i + 10 * (j - 1)}, lFer, raportSuprapunere);
        
        
    end
    cluster{1,1} = anger;
    cluster{1,2} = 'anger';
    cluster{2,1} = disgust;
    cluster{2,2} = 'disgust';
    cluster{3,1} = fear;
    cluster{3,2} = 'fear';
    cluster{4,1} = happiness;
    cluster{4,2} = 'happiness';
    cluster{5,1} = neutral;
    cluster{5,2} = 'neutral';
    cluster{6,1} = sadness;
    cluster{6,2} = 'sadness';
    cluster{7,1} = surprise;
    cluster{7,2} = 'surprise';
    
end
end