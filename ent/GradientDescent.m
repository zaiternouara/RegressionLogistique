function [theta ,vect_cost] = GradientDescent(X, Y, theta, Alpha, NbIteration,Lambda)
  	m = length(Y);   %recupère le nombre d'échantillons (exemple)
    vect_cost = zeros(NbIteration, 1);
	n = length(theta);
    

  tmp = theta; 
  for i = 1 : NbIteration
    err = (Hypothesis_Sigmoid(X * theta) - Y);
    	for j=1 : n
        	tmp(j,1) = sum(err.*X(:,j));
    	end
	
	theta = theta - (Alpha/m) * tmp + (Lambda/m) * tmp;
    
    vect_cost(i,1) = Cost(X,Y,theta,Lambda);
  end
end
