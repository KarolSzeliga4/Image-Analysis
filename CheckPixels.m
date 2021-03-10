function pixels = CheckPixels(image)

s = size(image);
sze = s(1,1);
wys = s(1,2); 

pixels = 0;
    for i = 1:sze
        for k = 1:wys
            if image(i ,k ) == 1
                pixels = pixels+1;
            end
        end
    end   


