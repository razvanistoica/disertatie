function afisareDiffFilt(cluster, emotie, individ, inregistrare, fereastra)

if (individ > 4)
    error('Exista maxim 4 indivizi');
end

for i = 1 :size(cluster,1)
    cluster{i,2}
    if( strcmp(cluster{i,2}, emotie))
        L = length(cluster{i,3});
        if (inregistrare > L/4)
            error('Exista maxim %s inregistrari', L/4);
        end
        pozitie = L/4 * (individ - 1) + inregistrare;
        X = cluster{i,3}{pozitie};
        Xcaci = cluster{i,6}{pozitie};
        rez = cluster{i,7}{pozitie};
        if (fereastra > length(X))
            error('Exista maxim %s ferestre', length(X));
        end
        break
    end
    if (i == size(cluster,1))
        error('Emotia aleasa nu exista. \n Va rog alegeti dintre valorile: \n''anger'' \n''disgust'' \n''fear'' \n''happiness'' \n''neutral'' \n''sadness'' \n''surprise'' ')
    end
end


figure
plot(X(:,fereastra));
hold on
plot(Xcaci(:,fereastra));
title('parametrii initiali vs parametrii estimati')
xlabel('Nr. parametrii')
ylabel('Amplitudine')

figure
subplot(3,1,1)
plot(X(:,fereastra));
title('mfcc');
subplot(3,1,2)
plot(Xcaci(:,fereastra));
title('mfcc filtrat');
subplot(3,1,3)
plot(rez(:,fereastra));
title('reziduu');

figure
surf(X)
title('mfcc');
colormap(hsv)

figure
surf(Xcaci)
title('mfcc filtrat');
colormap(hsv)

 figure
 surf(rez);
 title('reziduu');
 colormap(hsv)

figure
histogram(abs(X(:,fereastra)), 39)
X(:,fereastra)
end