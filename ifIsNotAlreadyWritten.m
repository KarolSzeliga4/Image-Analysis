function F_or_T = ifIsNotAlreadyWritten(dlu,x,y, x1, y1)
%funkcja pomocnicza do ładowania po linii

s = 0; %(uns int) jeśli w sasiedztwie kwadratowym s jest już zapisany piksel, to tego już nie zapisemy   
F_or_T = 1;
for i = 1 : dlu-1
    if ((x(i) <= x1+s) & (x(i) >= x1-s)) & ((y(i) <= y1+s) & (y(i) >= y1-s))
    %if  (x(i) == x1) & (y(i) == y1)
        F_or_T = 0;
    end
end
