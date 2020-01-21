function [theta ,vect_cost] = GradientDescent(X, Y, theta, Alpha, NbIteration,Lambda)
  	m = length(Y);   %recup�re le nombre d'�chantillons (exemple)
    vect_cost = zeros(NbIteration, 1);%initialiser tableau de cost avec ligne  = nombre des it�rations et une seule colonne
	n = length(theta); %renvoie la taille de la dimension la plus longue de theta.
    

  tmp = theta; 
  for i = 1 : NbIteration
    err = (Hypothesis_Sigmoid(X * theta) - Y);%Calculer l'erreur de l'hypoth�se
    	for j=1 : n
        	tmp(j,1) = sum(err.*X(:,j));
    	end
	
	theta = theta - (Alpha/m) * tmp + (Lambda/m) * tmp;%Calculer les thetas avec la r�gularisation lambda
    
    vect_cost(i,1) = Cost(X,Y,theta,Lambda); %Appel � la fonction de co�t
  end
end
