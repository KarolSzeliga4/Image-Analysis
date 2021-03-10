function cords =  LoadSimple(obraz_edge)

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
    
x =NaN(1,ile_pikseli);
y =NaN(1,ile_pikseli); 
iter = 1;
gora_dol = 1;
for i = 1:wys
  if gora_dol == 1  
    for k = 1:sze
      if obraz_edge(k,i) == 1
          x(iter) = i;
          y(iter) = k;
          iter= iter + 1;
      end
    end
    gora_dol = 0;
  else
    
    for k = sze:-1:1
      if obraz_edge(k,i) == 1
          x(iter) = i;
          y(iter) = k;
          iter= iter + 1;
      end
    end
    gora_dol = 1;
  end
%     plot(app.UIAxes,x,-y,'.');
%     xlim(app.UIAxes,[0 wys]);
%     ylim(app.UIAxes,[-sze 0]);
%           pause(0.000000000001);
end

cords = [x',-y'];
cords = reshape(cords(~isnan(cords)),[],size(cords,2));

        end