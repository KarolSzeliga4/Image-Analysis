function cords =  LoadByLine(obraz_edge)

siz = size(obraz_edge);
sze = siz(1,1);
wys = siz(1,2); 

ile_pikseli = 0;
    for i = 1:sze
        for k = 1:wys
            if obraz_edge(i ,k ) == 1
                ile_pikseli = ile_pikseli+1;
            end
        end
    end    
   
    
cords = [0,0];
x =NaN(1,ile_pikseli);
y =NaN(1,ile_pikseli); 
x(1) = 1;
y(1) = 1;



x_srodek_spirali = wys - 1;
y_srodek_spirali = 1;
ile_zapisanych = 1; % liczba zapisanych pikseli plus 1
gotowe = 0;
while gotowe == 0
    if ile_zapisanych > ile_pikseli - 2
        gotowe = 1;
    else
        
        ix = 0;
        iy = 0;
        h = 1; %bok kwadratu spirali
        znaleziony = 0;
        while znaleziony == 0
            
            for k = 1:h
                if (x_srodek_spirali + ix < sze) && (y_srodek_spirali + iy < wys) && (x_srodek_spirali +ix > 0) && (y_srodek_spirali +iy > 0)
                    if obraz_edge(x_srodek_spirali + ix , y_srodek_spirali + iy) == 1
                         if znaleziony ==0
                            if ifIsNotAlreadyWritten(ile_zapisanych,x,y,x_srodek_spirali + ix,y_srodek_spirali + iy)
                                x(ile_zapisanych) = x_srodek_spirali + ix;
                                y(ile_zapisanych) = y_srodek_spirali + iy;
                                znaleziony =  1;
                                ile_zapisanych = ile_zapisanych+1;
                            end
                         end
                    end
                end
                ix= ix+1;
            end
    
            for k = 1:h
                if (x_srodek_spirali + ix < sze) && (y_srodek_spirali + iy < wys) && (x_srodek_spirali +ix > 0) && (y_srodek_spirali +iy > 0)
                    if obraz_edge(x_srodek_spirali + ix , y_srodek_spirali + iy) == 1
                         if znaleziony ==0
                            if ifIsNotAlreadyWritten(ile_zapisanych,x,y,x_srodek_spirali + ix,y_srodek_spirali + iy)
                                x(ile_zapisanych) = x_srodek_spirali + ix;
                                y(ile_zapisanych) = y_srodek_spirali + iy;
                                znaleziony =  1;
                                ile_zapisanych = ile_zapisanych+1;
                            end
                         end
                    end
                end
                iy= iy+1;
            end
    
            h = h+1;
    
            for k = 1:h
                if (x_srodek_spirali + ix < sze) && (y_srodek_spirali + iy < wys) && (x_srodek_spirali +ix > 0) && (y_srodek_spirali +iy > 0)
                    if obraz_edge(x_srodek_spirali + ix , y_srodek_spirali + iy) == 1
                         if znaleziony ==0
                            if ifIsNotAlreadyWritten(ile_zapisanych,x,y,x_srodek_spirali + ix,y_srodek_spirali + iy)
                                x(ile_zapisanych) = x_srodek_spirali + ix;
                                y(ile_zapisanych) = y_srodek_spirali + iy;
                                znaleziony =  1;
                                ile_zapisanych = ile_zapisanych+1;
                            end
                         end
                    end
                end
                ix= ix-1;
            end
            
            for k = 1:h
                if (x_srodek_spirali + ix < sze) && (y_srodek_spirali + iy < wys) && (x_srodek_spirali +ix > 0) && (y_srodek_spirali +iy > 0)
                    if obraz_edge(x_srodek_spirali + ix , y_srodek_spirali + iy) == 1
                         if znaleziony ==0
                            if ifIsNotAlreadyWritten(ile_zapisanych,x,y,x_srodek_spirali + ix,y_srodek_spirali + iy)
                                x(ile_zapisanych) = x_srodek_spirali + ix;
                                y(ile_zapisanych) = y_srodek_spirali + iy;
                                znaleziony =  1;
                                ile_zapisanych = ile_zapisanych+1;
                            end
                         end
                    end
                end
                iy= iy-1;
            end
            
            if ile_zapisanych > ile_pikseli - 2
                gotowe = 1;
                znaleziony = 1;
            end
                
            h = h+1;
            
            if h > 2*wys
                znaleziony = 1;
                gotowe = 1;
            end
            %rysowanie na bierzaco
%             plot(y,-x);   uwaga! zacina si� mocno 
%             xlim([0 wys]); 
%             ylim([-sze 0]);
%             pause(0.000000000001);
        end
       x_srodek_spirali = x(ile_zapisanych -1);
       y_srodek_spirali = y(ile_zapisanych -1); 
    end
end

cords = [y',-x'];
cords = reshape(cords(~isnan(cords)),[],size(cords,2));
       
end