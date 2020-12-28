function preci = Precision(X, Y, couche)

    X=[ones(size(X,1),1) X];
   
    z = couche * X';
    YPrecision= Sigmoid(z);
    YPrecision=round(YPrecision);
    preci = mean(double(Y ==  YPrecision')*100);
    
    
    
end