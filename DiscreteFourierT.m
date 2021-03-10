function [fourier] = DiscreteFourierT(x_r)

    x_c = complex(x_r(:,1), x_r(:,2));

    fourier.length = length(x_c);
    a = zeros(fourier.length,1);
    fourier.freq = zeros(fourier.length,1);
    X_k = complex(a, 0);
    
    %transformation
    for k =1:fourier.length
        for n = 1:fourier.length
            phase = (-1i * 2 * pi * (k-1) * (n-1) ) / fourier.length;
            X_k(k) = X_k(k)+ x_c(n)*exp(phase);
        end
        fourier.freq(k) = k-1;
    end
    X_k = X_k/length(X_k);
    fourier.R = abs(X_k);
    %now circles are sorted by freq 
    [fourier.R, index] = sort(fourier.R, 'descend');
    
    fourier.freq = fourier.freq(index);
    fourier.phase = angle(X_k(index));
    %now circles are sorted by radius length
    fourier.dt = 2*pi/fourier.length;
end 

