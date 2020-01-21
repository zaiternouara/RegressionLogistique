function preci = Precision(X, Y, Theta)
     
    z = Theta * X';
    [proba id]= max(Hypothesis_Sigmoid(z));
   
    preci = id' ;
    preci = mean(double(Y == preci)*100);
end