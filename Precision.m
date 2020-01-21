function preci = Precision(X, Y, Theta)
    
   
    z = Theta * X';
    [proba id] = max(Hypothesis_Sigmoid(z)); %On obtient la probabilité et la prediction qui sont le résultat de l'hypothese la plus elevé
   
    preci = id' ;
    preci = mean(double(Y == preci)*100);
end