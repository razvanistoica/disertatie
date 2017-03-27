function Fer = segmentareFerestre(x, lFer, suprapunere)

%Initializare parametrii

N = length(x);
w = rectwin(lFer);
L = lFer;
i = 0;
a = floor(i * lFer * suprapunere) + 1;
Fer = zeros(1, lFer);

%Segmentarea datelor pe ferestre temporale cu durata si suprapunere fixata

while ( 1 )
    
    a = floor(i * lFer * suprapunere) + 1;                           % Valoarea de incepul a fiecarei ferestre
    
    if (a + lFer - 1 > N)
        break
    end
    
    Fer( i + 1, : ) = x( a : a + L - 1 ) .* w';                             % Aplicarea ferestrei pe semnalul initial
    
    i = i + 1;
end

end