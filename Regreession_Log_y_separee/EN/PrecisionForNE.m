function preci = PrecisionForNE(X, Y, Theta)
    z = round(X * Theta);
    
    right = 0;
    for i = 1:size(z,1)
        if(Y(i,1)==z(i,1))
            right = right +1;
        end
    end
    preci = right / size(Y,1) * 100;
end

