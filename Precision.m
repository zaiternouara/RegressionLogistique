function preci = Precision(X, Y, Theta)
    
   
    z = Theta * X';
    [proba id] = max(Hypothesis_Sigmoid(z)); %On obtient la probabilit� et la prediction qui sont le r�sultat de l'hypothese la plus elev�
   
    preci = id' ;
    preci = mean(double(Y == preci)*100);
end