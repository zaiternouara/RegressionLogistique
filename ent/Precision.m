function preci = Precision(X, Y, Theta)
    X=[ones(size(X,1),1) X];
   
    z = Theta * X';
    [proba id]= max(Hypothesis_Sigmoid(z));
   
    preci = id' ;
    preci = mean(double(Y == preci)*100);
end