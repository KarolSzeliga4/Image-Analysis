function [X_Y] = GetCircles(fourier,time)
%give one frame by write center of all circles in this frame (depend on time) 

X_Y = zeros(fourier.length, 2);

X_Y(1,1) = fourier.R(1)*cos(fourier.freq(1)*time+fourier.phase(1));
X_Y(1,2) = fourier.R(1)*sin(fourier.freq(1)*time+fourier.phase(1));

for i = 2:fourier.length    
   X_Y(i,1) = X_Y(i-1,1) + fourier.R(i)*cos(fourier.freq(i)*time+fourier.phase(i));
   X_Y(i,2) = X_Y(i-1,2) + fourier.R(i)*sin(fourier.freq(i)*time+fourier.phase(i));
   
end

end


