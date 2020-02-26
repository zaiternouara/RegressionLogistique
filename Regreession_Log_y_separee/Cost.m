function [J] = Cost(X, Y , theta,Lambda) 
  m = size(X,1); %recup�re le nombre d'�chantillons (exemple)
  J = (-1/m) * sum(Y.*log(Hypothesis_Sigmoid(X * theta)) + (1 - Y).*log(1 - Hypothesis_Sigmoid(X * theta))) + (Lambda/(2*m)) * sum(theta.^2); %formule de co�t avec la r�gularisation
end
