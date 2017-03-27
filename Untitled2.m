x = emotioDataCluster{1,1}{1,1}(25,:);
N = length(x);
fe=44100;
axe = (0:1/N:1-1/N)*fe;
fe=44100;


[vecPutereSemnal, energie(1)] = calculPutere(x);
    
    n2 = 1 + floor(N/2);
    m = melfb(40, N, fe);
   
    
    z = log(m * vecPutereSemnal(1:n2)');
    
    figure
    subplot(2,1,1)
    plot(m * vecPutereSemnal(1:n2)');
    title('energiile obtinute dupa filtrare')
    ylabel('Amplitudine')
    xlabel('Nr de coeficienti')
  
    subplot(2,1,2)
    plot( dct(z));
    title('energiile obtinute dupa filtrare si logaritmare')
    ylabel('log(Amplitudine)')
    xlabel('Nr de coeficienti')